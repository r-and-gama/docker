FROM gamaplatform/gama:1.8.0

FROM ubuntu:bionic

MAINTAINER RoiArthurB <https://github.com/RoiArthurB>
MAINTAINER meta00 <https://github.com/meta00>

# Copy GAMA in container from gamaplatform/gama official container
COPY --from=0 /usr/lib/gama /usr/lib/gama

# Disable apt interaction
ARG DEBIAN_FRONTEND=noninteractive 

## Setup container
RUN apt update && \
		# Install R
		apt install -y r-base && \
		# Install needed libs
        #For devtools
        apt -y --no-install-recommends install \
	        libssl-dev \
	        libxml2-dev \
	        libcurl4-openssl-dev \
	        libssh2-1-dev r-cran-httpuv && \
        #For gamar
        apt install -y --no-install-recommends \
        	libmagick++-dev && \
        # Keep layer as small as possible
        rm -rf /var/lib/apt/lists/*
        
# Install gamar
RUN Rscript -e 'install.packages("devtools")' 
RUN Rscript -e 'devtools::install_github("r-and-gama/gamar")' 

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
