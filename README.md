# motion-rtsp-docker

## Introduction
`motion-rtsp-docker` provides a container for [motionEye](https://github.com/ccrisan/motioneye), a web-based front-end for [motion](http://www.lavrsen.dk/foswiki/bin/view/Motion) with support for the Real-Time Streaming Protocol (rtsp).

## Installation
To run motionEye on port 8000 you just need to do the following

``` bash
git clone https://github.com/chris1705/motion-rtsp-docker.git
cd ./motion-rtsp-docker
docker build -t motion-rtsp-docker .
docker run -d -p 8000:8765 motion-rtsp-docker 

```

## Known issues
* No support for mounting storage
