FROM ubuntu:15.04
MAINTAINER khoaln

## Install php nginx mysql supervisor xserver wget
RUN apt-get update && \
    apt-get install -y apt-utils python python-dev python-pip build-essential nginx xvfb xserver-xephyr vnc4server python-pil scrot wget unzip && \
    rm -rf /var/lib/apt/lists/*

## Install uWSGI
RUN pip install uwsgi

## Install django
RUN pip install Django==1.9.2

## Install pyvirtualdisplay
RUN pip install pyvirtualdisplay

## Install pyscreenshot
RUN pip install pyscreenshot

## Install selenium
RUN pip install selenium

## Install Firefox
RUN apt-get update && \
    apt-get install -qqy firefox && \
    rm -rf /var/lib/apt/lists/*

## Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update && \
    apt-get install -qqy google-chrome-stable && \
    rm -rf /var/lib/apt/lists/* && \
    rm /etc/apt/sources.list.d/google-chrome.list

## Install Chromedriver
RUN wget --no-verbose -O chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/2.21/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN rm chromedriver_linux64.zip
RUN mv chromedriver /usr/bin/chromedriver
RUN chmod 755 /usr/bin/chromedriver
