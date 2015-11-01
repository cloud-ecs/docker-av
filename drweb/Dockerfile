FROM cloudcss/debiani386:jessie
MAINTAINER Josef Fröhle "github@josef-froehle.de"

#Prevent daemon start during install
RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d

# Install Requirements
RUN apt-get update -qq

# Add EICAR Test Virus File to malware folder
ADD http://www.eicar.org/download/eicar.com.txt /malware/EICAR

ADD http://download.geo.drweb.com/pub/drweb/unix/release/Linux/x86/drweb-10.1-av-linux-x86.run /

# Try to reduce size of container.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
