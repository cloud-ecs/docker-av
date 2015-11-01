FROM cloudcss/debiani386:jessie
MAINTAINER Josef Fröhle "github@josef-froehle.de"

#Prevent daemon start during install
RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d

RUN apt-get install -yq gdebi wget

ADD http://www.microworldsystems.com/download/linux/soho/deb/escan-antivirus-wks-7.0-18.i386.deb /
ADD http://ftp.debian.org/debian/pool/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u3_i386.deb /

# Install EScan
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /libgcrypt11_1.5.0-5+deb7u3_i386.deb
RUN DEBIAN_FRONTEND=noninteractive gdebi -n /escan-antivirus-wks-7.0-18.i386.deb

# Add EICAR Test Virus File to malware folder
ADD http://www.eicar.org/download/eicar.com.txt /malware/EICAR

# Try to reduce size of container.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
