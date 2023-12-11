FROM node:16-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

RUN npm 

COPY . .

EXPOSE 3000

CMD ["npm", "start"]

