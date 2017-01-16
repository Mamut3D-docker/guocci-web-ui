FROM finalduty/archlinux:latest

MAINTAINER Mamut3D

LABEL Description="Guocci ui test server"

RUN pacman -Syu --noconfirm &&\
  pacman -S --noconfirm nodejs\
  npm \
  vim \
  git \
  wget && \
  useradd -m guocci  

RUN cd /home/guocci && \
  wget https://raw.githubusercontent.com/Mamut3D-docker/guocci-web-ui/master/run.sh && \
  chmod +x run.sh && \
  su guocci -c 'git clone https://github.com/dudoslav/guocci-web-ui.git && \
  cd /home/guocci/guocci-web-ui  && \ 
  npm install --silent' 

USER guocci

CMD bin/bash -c "$HOME/run.sh"
