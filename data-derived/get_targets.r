#get the target distribution from the cluster
#this is done by running the correct weights.r and weights.sh script
#the target distribution should be specified based on the correct reference files
library(tidyverse)
#read in the target.csv from local directory
target20 <- read_csv("target20_novaseq.csv")
#save the target
usethis::use_data(target20,overwrite=TRUE)