# builder
FROM node:22-alpine3.24 AS builder
WORKDIR /app 
COPY app/package.json app/yarn.lock /app/
RUN yarn install 
COPY app/ .
RUN yarn build 

# runtime
FROM nginxinc/nginx-unprivileged:stable-alpine
WORKDIR /app
COPY --from=builder app/build /usr/share/nginx/html/
EXPOSE 8080




