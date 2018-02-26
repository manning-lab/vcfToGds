# Adapted from:
# 	Author: topmed analysis pipeline, smgogarten
# 	Link: https://github.com/smgogarten/analysis_pipeline/blob/master/R/vcf2gds.R

library(SeqArray)

args <- commandArgs(trailingOnly=T)
vcf <- args[1]
gds_out <- paste(args[2],".gds",sep="")

seqVCF2GDS(vcf, gds_out, storage.option="LZMA_RA", verbose=TRUE)