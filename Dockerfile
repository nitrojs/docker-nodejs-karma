FROM node:4-wheezy

MAINTAINER Jesús Germade <jesus@germade.es>

RUN apt-get update; \
    apt-get install -y --force-yes \
      build-essential \
      git \
      curl

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ; \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list'; \
    apt-get update && apt-get install -y --force-yes google-chrome-stable xvfb

RUN npm install bower -g

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/google-chrome

ADD xvfb.sh /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/entrypoint.sh"]
