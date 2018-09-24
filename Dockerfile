FROM ubuntu:xenial
MAINTAINER Chris Miller <c.a.miller@wustl.edu>

LABEL Image for running IGV and screenshots

#############
## IGV 3.0 ##

RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    default-jre \
    wget \
    unzip \
    curl \ 
    xvfb \ 
    lsof \
    glib-networking-common && \
    mkdir -p /igv && \
    cd /igv && \
    wget http://data.broadinstitute.org/igv/projects/downloads/2.4/IGV_2.4.14.zip && \
    unzip IGV_2.4.14.zip && \
    cd IGV_2.4.14 && \
    sed -i 's/Xmx4000/Xmx8000/g' igv.sh && \
    cd /usr/bin && \
    ln -s /igv/IGV_2.4.14/igv.sh ./igv


# needed for MGI data mounts info
RUN apt-get update && apt-get install -y libnss-sss && apt-get clean all

# #set timezone to CDT
# RUN apt-get update && apt-get install -y --no-install-recommends tzdata && \
#     ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime && \
#     echo "America/Chicago" > /etc/timezone && \
#     dpkg-reconfigure --frontend noninteractive tzdata
