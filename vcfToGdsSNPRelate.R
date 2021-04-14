library(SNPRelate)

args <- commandArgs(trailingOnly=T)
vcf <- args[1]
gds_out <- paste(args[2],".gds",sep="")

snpgdsVCF2GDS(vcf, gds_out, method="copy.num.of.ref", snpfirstdim=FALSE, verbose=TRUE)