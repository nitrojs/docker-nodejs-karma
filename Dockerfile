FROM ubuntu:bionic

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; \
    apt-get update; \
    apt-get install -y \
        git \
        curl \
        wget \
        build-essential \
        xvfb;

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -; \
        apt-get update; \
        apt-get install -y nodejs;

RUN node -v; \
    npm -v;

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -; \
    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list; \
    apt-get update; \
    apt-get install -y \
        google-chrome-stable \
        firefox;

ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome

ADD xvfb.sh /etc/init.d/xvfb
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
