FROM node:16.13 as build

WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json .
RUN npm ci

COPY . .

RUN npm run build
RUN npm prune --production

EXPOSE 8080

ENV NODE_ENV='production'

CMD ["npm", "start"]
