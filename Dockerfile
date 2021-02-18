FROM uwgac/topmed-master:latest

MAINTAINER Ash O-Apostrophe-Farrell (aofarrel@ucsc.edu)

# prevent apt-get dialogs
ENV DEBIAN_FRONTEND noninteractive

# become root to install packages
# is there a better workaround?
USER root

RUN apt-get update & \
	apt-get install git

RUN git clone --branch add-uniqueVariantIDs https://github.com/aofarrel/vcfToGds.git
