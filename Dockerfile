FROM fedora:latest
MAINTAINER Nikola Đipanov <nikola.djipanov@gmail.com>

# install needed tools
RUN dnf install -y git wget nodejs npm nodejs-grunt-cli

# make sure that we have an updated version of npm
RUN npm install -g npm

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
