from r-base:3.4.3

MAINTAINER tim majarian (tmajaria@broadinstitute.org)

RUN apt-get update
RUN apt-get -y install git

RUN echo 'source("https://bioconductor.org/biocLite.R")' > install.R && \
	echo "biocLite(c('SeqArray'), clean=TRUE, INSTALL_opts='--no-docs --no-demo --byte-compile');" >> install.R && \
	echo "biocLite(ask=FALSE, clean=TRUE, INSTALL_opts='--no-docs --no-demo --byte-compile');" >> install.R && \
	Rscript --vanilla /home/install.R && \
	rm /home/install.R

RUN git clone https://github.com/manning-lab/vcfToGds.git && cd ./vcfToGds && git pull origin master