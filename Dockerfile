FROM ubuntu:bionic
MAINTAINER Sébastien M-B <essembeh@gmail.com>

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y nodejs npm ruby-compass

RUN npm install -g bower
RUN npm install -g grunt-cli

COPY package.json /
RUN npm install

COPY bower.json /
RUN bower install --allow-root --config.interactive=false


COPY * /

RUN echo test
RUN ls
RUN cd app; ls

EXPOSE 9000
ENTRYPOINT grunt serve --stack --force