#DNLA-server serviio, based on Arch linux

FROM base/archlinux

MAINTAINER Sergii Rolskyi

# Download latest Serviio aplication
ENV SERVIIO_URL http://download.serviio.org/releases/serviio-1.10.1-linux.tar.gz

#Update and install needed package
RUN pacman -Sy && pacman -S wget ffmpeg java-runtime-common jre8-openjdk-headless dcraw --noconfirm

WORKDIR /tmp

#Download application and unpack into work directory
RUN wget "${SERVIIO_URL}" && \ 
	mkdir -p /opt/serviio && tar -xzvf serviio-* -C /opt/serviio/ --strip-components=1

#Create media directory
RUN mkdir -p /opt/media/

VOLUME /opt/media

EXPOSE 1900 8895 23423

RUN chmod +x /opt/serviio/bin/serviio.sh

CMD [ "/opt/serviio/bin/serviio.sh" ]
