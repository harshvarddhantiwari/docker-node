FROM ubuntu
# or we can simply use `FROM node` so we don't need to inatall node manually 

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
#moved the package.json and package-lock.json from root to /app


RUN cd app && npm install 
# moved file up to save caching while making changes to the main.js

COPY main.js /app/main.js
# or we can use `COPY . .` to copy all files from the current directory to the container



ENTRYPOINT [ "node", "/app/main.js" ]