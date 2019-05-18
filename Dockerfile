FROM node:12.2.0-alpine

WORKDIR /pharos.net

COPY package.json /pharos.net/package.json
RUN npm config set registry http://registry.npm.qiwoo.org && \
  npm config set package-lock false && npm install

COPY . /pharos.net

ENV DOCKER=true
EXPOSE 9000
ENTRYPOINT [ "sh", "docker-entrypoint.sh" ]