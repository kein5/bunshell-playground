# use the official Bun image
# see all versions at https://hub.docker.com/r/oven/bun/tags
FROM oven/bun:latest

# install git
RUN apt update && apt install -y git

# install dependencies
WORKDIR /usr/src/app
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile

# copy all (non-ignored) project files into the image
COPY . .

# run the app
ENTRYPOINT [ "/bin/bash" ]
