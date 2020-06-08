#DNLA-server serviio, based on Arch linux

FROM archlinux/base

MAINTAINER Sergii Rolskyi

# Download latest Serviio aplication
#ENV SERVIIO_URL https://download.serviio.org/releases/serviio-2.1-linux.tar.gz

#Update and install needed package
RUN pacman -Sy && pacman -S  tar wget ffmpeg java-runtime-common jre8-openjdk-headless dcraw --noconfirm

WORKDIR /tmp

COPY ./serviio-2.1-linux.tar.gz .
#Download application and unpack into work directory
#RUN wget "${SERVIIO_URL}" && \ 
RUN mkdir -p /opt/serviio && tar -xzvf serviio-* -C /opt/serviio/ --strip-components=1

#Create media directory
RUN mkdir -p /opt/media/

VOLUME /opt/media

EXPOSE 1900 8895 23423

RUN chmod +x /opt/serviio/bin/serviio.sh

CMD [ "/opt/serviio/bin/serviio.sh" ]
