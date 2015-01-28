FROM node:latest

RUN apt-get update && apt-get install -y git vim-tiny

RUN npm install -g grunt-cli bower \
&& npm install -g n_  \
&& npm cache clear

WORKDIR /apps
RUN git clone https://github.com/redpelicans/transac-redline.git \
&& cd transac-redline \
&& npm install \
&& bower --force-latest --allow-root install \
&& grunt  serve:dist 

EXPOSE 80
WORKDIR /apps/transac-redline
CMD node backend/main



