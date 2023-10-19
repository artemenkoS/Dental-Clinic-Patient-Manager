FROM node:18.18.1-alpine AS build
WORKDIR /app
COPY ./package.json ./
COPY ./yarn.lock ./
RUN yarn 
COPY . .
RUN yarn build


FROM nginx
COPY --from=build /app/dist /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
