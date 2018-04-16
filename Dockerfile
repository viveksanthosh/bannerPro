FROM node:8.9.4
RUN apt-get update && apt-get install -y imagemagick 
RUN apt-get install -y wget
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm i
COPY bannerpro bannerpro
COPY entry.js entry.js
COPY i.jpg i.jpg
EXPOSE 80
CMD node entry.js
