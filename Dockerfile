FROM gama2020/gama-platform:latest

MAINTAINER RoiArthurB <https://github.com/RoiArthurB>
MAINTAINER meta00 <https://github.com/meta00>

# Update Ubuntu mirror && install needed software
RUN apt update && apt install -y

# Install R and dependancies

# Install GAMAR

# Setup GAMAR

# Exit points
# 
#WORKDIR /usr/lib/gama/headless
#
#ENTRYPOINT ["gama-headless"]
#CMD ["-help"]
