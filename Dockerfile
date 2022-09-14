FROM node:12-alpine

ENV SENDGRID_VERSION 6.4.0

LABEL \
  maintainer="Simon Boyer" \
  org.opencontainers.image.title="sendgrid-nodejs" \
  org.opencontainers.image.description="A Node.js Alpine Docker image for SendGrid." \
  org.opencontainers.image.authors="Peter Evans <mail@peterevans.dev>" \
  org.opencontainers.image.url="https://github.com/peter-evans/sendgrid-nodejs" \
  org.opencontainers.image.vendor="https://peterevans.dev" \
  org.opencontainers.image.licenses="MIT"

RUN set -ex \
 && npm install --global --production @sendgrid/mail@$SENDGRID_VERSION @sendgrid/client@$SENDGRID_VERSION \
 && npm cache clean --force \
 && rm -fr /usr/local/lib/node_modules/npm \
           /root/.npm

ENV NODE_PATH "/usr/local/lib/node_modules/"

COPY LICENSE README.md /