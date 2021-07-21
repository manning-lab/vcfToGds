# vcfToGds - Convert vcf files to gds format

### Authors
**[Tim Majarian](tmajaria@broadinstitute.org)**

## Description 

This workflow converts files in Variant Call Format (VCF) to Genomic Data Structure format (GDS). 

* vcf_files: "Array of files, with extensions: .vcf, .vcf.gz, or .vcf.bgz"
* disk: "Runtime parameter; amount of disk space to provision in gigabytes. Default: 100GB."
* memory: "Runtime parameter; amount of memory to provision in gigabytes. Default: 20GB."
* preemptible: "Runtime parameter; whether to use preemptible machines. Default: 0 (no)."
