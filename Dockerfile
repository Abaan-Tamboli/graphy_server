# Use the latest Node.js image based on Debian Bullseye or Alpine
FROM node:18-bullseye  # or node:18-alpine

# Install patched version of git (1:2.20.1-2+deb10u9)
RUN apt-get update && \
    apt-get install -y git=1:2.20.1-2+deb10u9
    apt-get install -y e2fsprogs=1.46.2-2+deb11u1

COPY graphserver.js .
COPY package.json .
COPY UScities.json .
RUN npm install &&\
    apk update &&\
    apk upgrade
EXPOSE 4000
CMD node graphserver.js
