FROM node:alpine

MAINTAINER zaflun UG "developer@zaflun.com"

ARG ANGULAR_CLI_VERSION=9.1.7

RUN yarn global add @angular/cli@$ANGULAR_CLI_VERSION && \
	yarn cache clean && \
    apt-get update && \
    apt-get install -y parallel