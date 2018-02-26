# vcfToGds - Convert vcf files to gds format

## Description 

This workflow converts files in Variant Call Format (VCF) to Genomic Data Structure format (GDS). 

### Authors

This workflow is produced and maintained by the [Manning Lab](https://manning-lab.github.io/). Contributing authors include:

* Tim Majarian (tmajaria@broadinstitute.org)

## Dependencies

### Workflow execution

* [WDL](https://software.broadinstitute.org/wdl/documentation/quickstart)
* [Cromwell](http://cromwell.readthedocs.io/en/develop/)

### R packages

* [SeqArray](https://www.bioconductor.org/packages/release/bioc/html/SeqArray.html)

## Workflow elements

### vcfToGds.R
This script is the main function for converting vcf to gds. It uses the SeqArray package in R.

Inputs:
* vcf : a file in vcf format
* disk : amount of disk space to allot for each job
* memory : amount of memory to allot for each job

Outputs :
* out_file : GDS file matching the name of the input vds with ".gds" appeneded to the end