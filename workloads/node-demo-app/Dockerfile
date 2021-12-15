FROM node:17

WORKDIR /app

COPY package.json .

RUN npm install --production

COPY ./src ./src

EXPOSE 3000

ENTRYPOINT ["npm", "start"]