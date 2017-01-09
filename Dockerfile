FROM finalduty/archlinux

MAINTAINER Mamut3D

LABEL Description="Guocci ui test server"

RUN pacman -Syu --noconfirm &&\
  pacman -S --noconfirm nodejs\
  npm \
  vim \
  git && \
  cd /root && \
  git clone https://github.com/dudoslav/guocci-web-ui.git && \
  cd guocci-web-ui && \ 
  npm install && \
  echo "Yeah!" 

CMD ["/bin/bash"]
