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

# Setup GAMAR


# Clear build packages
RUN apt purge -y \
	gnupg

# Exit points
# 
#WORKDIR /usr/lib/gama/headless
#
#ENTRYPOINT ["gama-headless"]
#CMD ["-help"]
