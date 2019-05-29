FROM uwgac/topmed-master:latest

MAINTAINER tim majarian (tmajaria@broadinstitute.org)

RUN apt-get update & \
	apt-get -y install git

RUN git clone https://github.com/manning-lab/vcfToGds.git