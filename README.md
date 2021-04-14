# vcfToGds - Convert vcf files to gds format

# Superceeded by https://github.com/aofarrel/analysis_pipeline_WDL

## Description 

This workflow converts files in Variant Call Format (VCF) to Genomic Data Structure format (GDS). It was an attempt to implement the first step of the [University of Washington TOPMed pipeline](https://github.com/UW-GAC/analysis_pipeline), itself a five-part process, but is now replaced by the repository linked above.

## Dependencies

### Workflow execution

* [WDL](https://software.broadinstitute.org/wdl/documentation/quickstart)
* [Cromwell](http://cromwell.readthedocs.io/en/develop/)

### R packages

* [SeqArray](https://www.bioconductor.org/packages/release/bioc/html/SeqArray.html)

## Workflow

Inputs:
* vcf : an array of vcf files in vcf, .vcf.bgz, or .vcf.gz format
* disk : amount of disk space to allot for vcfToGds.R
* memory : amount of memory to allot for vcfToGds.R

Output: 

### vcfToGds.R
This script is the main function for converting vcf to gds. It uses the SeqArray package in R.

Inputs:
* vcf : a file in vcf, .vcf.bgz, or .vcf.gz format
* disk : amount of disk space to allot for each job
* memory : amount of memory to allot for each job

Outputs :
* out_file : GDS file matching the name of the input vds with ".gds" appeneded to the end


## Limitations
The U of W version of this pipeline can accept BCF files as valid input. Currently this pipeline does not use bcftools and therefore cannot handle bcf files.

