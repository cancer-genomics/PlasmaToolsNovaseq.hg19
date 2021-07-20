#get the bins from the cluster and aggregate them into one csv
library(data.table); library(tidyverse); library(readxl)
library("plyr") 
library(devtools)

library(data.table)
setDTthreads(1)

#this code has to be run on the cluster only
#refids <- read_csv("../ReferenceIDs_healthies_for_z_scores.csv")
#refids <- refids %>% filter(!is.na(psomagen_submission))
#refids <- refids$cg_id

#datadir <- "/dcs04/scharpf/data/rscharpf/danish-batch01-wgs-plasma-2021-06-02/bins/5mb_bins_akshaya_reference20/"
#ref20 <-paste(datadir,refids,"_5mb.csv",sep="")

#x <- rbindlist(lapply(as.list(ref20), fread))


#write_csv(x,"refbins20.csv")

#read in the csv from local directory
ref20_bins <- read_csv("refbins20.csv")
#save the directory
usethis::use_data(ref20_bins)
