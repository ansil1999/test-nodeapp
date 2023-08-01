FROM node:8

# Create app directory
WORKDIR /usr/node/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8082
CMD [ "npm", "start" ]
