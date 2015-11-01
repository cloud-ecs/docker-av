FROM cloudcss/debiani386:jessie
MAINTAINER Josef Fröhle "github@josef-froehle.de"

#Prevent daemon start during install
RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d

# Install Requirements
RUN apt-get update -qq

# Install F-Secure
ADD https://download.f-secure.com/corpro/ls/current/fsls-10.20.358-rtm.tar.gz /

# Update F-Secure


# Add EICAR Test Virus File to malware folder
ADD http://www.eicar.org/download/eicar.com.txt /malware/EICAR

# Try to reduce size of container.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
