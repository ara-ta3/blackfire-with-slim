FROM php:7.1.10
RUN apt-get update
RUN apt-get install -y wget 
RUN wget -O - https://packagecloud.io/gpg.key | apt-key add -
RUN echo "deb http://packages.blackfire.io/debian any main" | tee /etc/apt/sources.list.d/blackfire.list 
RUN apt-get update
RUN apt-get install -y blackfire-agent
COPY ./blackfire.ini /etc/blackfire/agent
RUN /etc/init.d/blackfire-agent restart
RUN apt-get install blackfire-php
