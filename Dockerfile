FROM finalduty/archlinux:latest

MAINTAINER Mamut3D

LABEL Description="Guocci ui test server"

RUN pacman -Syu --noconfirm &&\
  pacman -S --noconfirm nodejs\
  npm \
  vim \
  git && \
  useradd -m guocci  

RUN cd /home/guocci && \
  su guocci -c 'git clone https://github.com/dudoslav/guocci-web-ui.git && \
  cd /home/guocci/guocci-web-ui  && \ 
  npm install --silent' 

RUN sed -ie 's/guocci-mock-server.herokuapp.com/localhost:3001/g' /home/guocci/guocci-web-ui/app/app.request.options.ts

USER guocci
CMD bin/bash -c 'cd /home/guocci/guocci-web-ui && npm run start'
