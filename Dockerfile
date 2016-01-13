FROM ddamon/base-centos7
MAINTAINER David Damon <dwdamon@gmail.com>

LABEL name="CentOS 7 SSL Image" \
    vendor="CentOS" \
    license="GPLv2" \
    build-date="2015-12-23"

RUN yum -y install net-tools \
 && yum -y install iproute \
 && yum -y install openssl \
 && yum -y install openssh \
 && yum clean all

CMD ["/bin/bash"]
