FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm install pm2 -g && npm i @adiwajshing/baileys@https://github.com/THEJO307/baileys

COPY . .

EXPOSE 5000

CMD ["npm", "start"]