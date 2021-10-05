# Adapted from:
# 	Author: topmed analysis pipeline, smgogarten
# 	Link: https://github.com/smgogarten/analysis_pipeline/blob/master/R/vcf2gds.R

library(SeqArray)

args <- commandArgs(trailingOnly=T)
vcf <- args[1]
compression <- args[2]
cores <- as.numeric(args[3])

if (is.na(cores)) {
	cores <- 1
}

# remove extension, can be .vcf, .vcf.gz, .vcf.bgz
gds_out <- paste0(sub(".vcf.bgz$|.vcf.gz$|.vcf$", "", basename(vcf)), ".gds")

seqParallelSetup(cores)
seqVCF2GDS(vcf, gds_out, storage.option=compression, parallel = T, verbose=TRUE)
seqParallelSetup(F)