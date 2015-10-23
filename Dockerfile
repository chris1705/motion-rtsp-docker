FROM ubuntu:14.04

MAINTAINER Christian Fender (chris1705) <info@fenderdev.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://ppa.launchpad.net/mc3man/trusty-media/ubuntu trusty main" \
  > /etc/apt/sources.list.d/media.list \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED8E640A \
  && apt-get update \
  && apt-get install -y \
  python-tornado \
  python-jinja2 \
  python-imaging \
  ffmpeg \
  v4l-utils \
  git \
  automake \
  autoconf \
  pkgconf \  
  libtool \
  build-essential \
  libjpeg-dev \
  libjpeg8-dev \
  libavformat-dev \
  libavcodec-dev \
  libswscale-dev \
  libzip-dev \
  python-pip

RUN git clone https://github.com/Mr-Dave/motion.git motion-mrdave; \
   cd motion-mrdave; \
   ls -al; \ 
   autoreconf -fiv; \
   ./configure --prefix=/usr --without-pgsql --without-sdl --without-sqlite3 --without-mysql; \ 
   ls -al; \
   make -j 4; \
   cp motion /usr/local/bin/motion; \
   cd ../

RUN pip install motioneye==0.27.2-2; \
   mkdir -p /etc/motioneye; \
   cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf; \
   mkdir -p /var/lib/motioneye
  
VOLUME ["/var/lib/motioneye"]

WORKDIR /motioneye

EXPOSE 8765

CMD ["/usr/local/bin/meyectl","startserver","-c","/etc/motioneye/motioneye.conf","-l"]
