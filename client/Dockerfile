FROM node:18.18.1-alpine
WORKDIR /app
COPY ./package.json ./
COPY ./yarn.lock ./
RUN yarn 
COPY . .
RUN yarn build
