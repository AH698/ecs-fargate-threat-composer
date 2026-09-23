# builder
FROM node:26.10-alpine3.23 AS builder
WORKDIR /app 
COPY app/package.json app/yarn.lock /app/
RUN yarn install 
COPY app/ .
RUN yarn build 





