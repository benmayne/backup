FROM ubuntu:24.04

RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
  apt-utils \
  rclone
    
