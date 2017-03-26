FROM node:7.3.0-alpine
MAINTAINER Tobias Hagemann <tobias.hagemann@gmail.com>

ARG MAILTRAIN_VERSION=1.22.0

RUN set -ex && apk add --no-cache curl \
  && cd /tmp \
  && curl -fSL https://github.com/andris9/mailtrain/archive/v${MAILTRAIN_VERSION}.tar.gz -o mailtrain.tar.gz \
  && tar xzf mailtrain.tar.gz \
  && mkdir /app \
  && mv mailtrain-${MAILTRAIN_VERSION}/* /app

WORKDIR /app
RUN npm install --production

ENV NODE_ENV=production
CMD ["npm", "start"]

VOLUME /app/config
EXPOSE 3000
