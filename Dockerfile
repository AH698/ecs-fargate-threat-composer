# builder
FROM node:22-alpine3.24 AS builder
WORKDIR /app 
COPY app/package.json app/yarn.lock /app/
RUN yarn install 
COPY app/ .
RUN yarn build 





