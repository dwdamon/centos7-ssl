FROM ddamon/base-centos7
MAINTAINER David Damon <dwdamon@gmail.com>

ENV container docker

LABEL name="CentOS 7 SSL Image" \
    vendor="CentOS" \
    license="GPLv2" \
    build-date="2015-12-23"

ADD authorized_keys /home/docker/.ssh/authorized_keys
ADD authorized_keys /home/docker/.ssh/authorized_keys2

# && mkdir -m 0700 /home/docker/.ssh\
RUN yum -y install net-tools iproute systemd openssl openssh openssh-server initscripts passwd openssh-clients sudo\
 && yum clean all \
 && useradd docker -g users \
 && mkdir -m 0700 /root/.ssh\
 && chown -R docker.users /home/docker/.ssh\
 && chmod -R go-rwx /home/docker/.ssh\
 && /usr/sbin/sshd-keygen\
 && (echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers)

#VOLUME ["/ssh_host_keys"]

EXPOSE 22

CMD (/usr/sbin/sshd -D &) && bash
