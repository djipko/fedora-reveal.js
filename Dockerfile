FROM fedora:latest
MAINTAINER Nikola Đipanov <nikola.djipanov@gmail.com>

# install needed tools
RUN dnf install -y git wget npm make tar bzip2

# make sure that we have an updated version of npm and node
RUN npm install -g npm
RUN npm install -g n
RUN n stable
RUN npm install -g grunt-cli

# Clone the reveal.js repo
RUN git clone https://github.com/hakimel/reveal.js.git
# Install packages dependencies localy
RUN cd reveal.js; npm install

# Prepare the volume we can mount our slides on
RUN mkdir -p /slides/images/
COPY index.html /slides/

RUN rm /reveal.js/index.html
RUN ln -s /slides/index.html /reveal.js/index.html
RUN ln -s /slides/images/ /reveal.js/images

VOLUME /slides/

WORKDIR reveal.js
CMD grunt serve
EXPOSE 8000
