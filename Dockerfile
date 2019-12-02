FROM node:alpine as tempcontainer

WORKDIR /app

COPY package.json .
RUN npm install
COPY .  .
RUN  npm run build

FROM nginx
EXPOSE 80
COPY --from=tempcontainer /app/build /usr/share/nginx/html

