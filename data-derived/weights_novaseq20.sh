#!/bin/bash
#$ -cwd
#$ -j y
#$ -l h_fsize=100G
#$ -l mem_free=5G
#$ -l h_vmem=5G
#$ -l h_rt=96:00:00
module load conda_R/4.0.x
Rscript weights_novaseq20.r ../gc-counts target20_novaseq.csv
