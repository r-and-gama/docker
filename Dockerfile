FROM gamaplatform/gama:1.8.0

MAINTAINER RoiArthurB <https://github.com/RoiArthurB>
MAINTAINER meta00 <https://github.com/meta00>

# Disable apt interaction
# https://askubuntu.com/a/1013396
ARG DEBIAN_FRONTEND=noninteractive

## Update Ubuntu mirror && install needed software
RUN apt update && apt upgrade -y

# Install R
RUN apt install -y r-base && R --version

# Install GAMAR
ADD ./gamarAutoInstall.R /tmp/gamarAutoInstall.R

## Lib for devtools
Run apt install -y \
	libssl-dev \
	libxml2-dev \
	libcurl4-openssl-dev \
	libssh2-1-dev r-cran-httpuv r-cran-httpuv

RUN Rscript -e 'if (! "devtools" %in% row.names(installed.packages())) install.packages("devtools")' 

## Lib for gamar
Run apt install -y \
	libmagick++-dev #libgraphicsmagick1-dev

RUN Rscript -e 'if (! "gamar" %in% row.names(installed.packages())) devtools::install_github("r-and-gama/gamar")' 

# Setup GAMAR
## https://github.com/r-and-gama/gamar/issues/28
RUN mkdir -p /usr/lib/gama/Contents/Eclipse/Configuration
RUN ln -s /usr/lib/gama/configuration/config.ini /usr/lib/gama/Contents/Eclipse/Configuration/config.ini
## Setup path
RUN Rscript -e 'library(gamar); setup_gama("/usr/lib/gama")'

# Exit points
# 
#WORKDIR /usr/lib/gama/headless
#
#ENTRYPOINT ["gama-headless"]
#CMD ["-help"]
