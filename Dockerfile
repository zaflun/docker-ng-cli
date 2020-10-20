FROM node:lts-slim

MAINTAINER zaflun UG "developer@zaflun.com"

# reduce logging, disable angular-cli analytics for ci environment
ENV NPM_CONFIG_LOGLEVEL=warn NG_CLI_ANALYTICS=false

ARG ANGULAR_CLI_VERSION=10.1.4
LABEL angular-cli=$ANGULAR_CLI_VERSION node=$NODE_VERSION

RUN yarn global add @angular/cli@$ANGULAR_CLI_VERSION && \
	yarn cache clean && \
	apt-get update && \
	apt-get install -y \
		ca-certificates \
		curl \
		zip \
		git \
		build-essential \
		python \
		rsync \
		parallel \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*