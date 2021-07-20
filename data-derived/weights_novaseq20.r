library(tidyverse)
library(data.table)
args <- commandArgs(trailingOnly = TRUE)
datadir <- args[1]
outfile <- args[2]

### Create weights from reference file
library(data.table)
setDTthreads(1)

refids <- read_csv("../ReferenceIDs_healthies_for_z_scores.csv")
refids <- refids %>% filter(!is.na(psomagen_submission))
refids <- refids$cg_id

datadir <- "/dcs04/scharpf/data/rscharpf/danish-batch01-wgs-plasma-2021-06-02/gc-counts/"
ref20_paths <-paste(datadir,refids,"_gc.csv",sep="")
#write_csv(data.frame(ref20_paths),"ref20_paths_novaseq.csv")

#ref20_paths <- read_csv("ref20_paths_novaseq.csv")

x <- rbindlist(lapply(as.list(ref20_paths), fread))
x[,prob:=n/sum(n),by=.(id, seqnames)]
x[,prob2:=cumsum(prob),by=.(id, seqnames)]
print(x)
x <- x[,.(n=sum(n)),by=.(id, gc, seqnames)]
x <- x[grepl("P_2$|P_1$", id)]
print(x)
mediandt <- x[,.(gcmed=median(n)),by=.(seqnames, gc)]
mediandt[,seqnames:=factor(seqnames, c(paste0("chr", 1:22), "chrX", "chrY"))]
mediandt[order(seqnames, gc)]
fwrite(mediandt, outfile)

# setkey(mediandt, gc, seqnames)
# setkey(x, gc, seqnames)
# x <- x[mediandt][order(id, seqnames, gc)]
# x[,w:=gcmed/n,  by=.(id,  seqnames)]
# 
# fwrite(x, outfile)
