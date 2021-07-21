FROM bioconductor/bioconductor_docker:RELEASE_3_13

MAINTAINER tim majarian (tmajaria@broadinstitute.org)

RUN apt-get update & \
	apt-get -y install git

RUN git clone https://github.com/manning-lab/vcfToGds.git

RUN Rscript -e "BiocManager::install('SeqArray')"