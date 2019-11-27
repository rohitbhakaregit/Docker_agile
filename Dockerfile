FROM node:alpine as tempcontainer

WORKDIR /app

COPY package.json .
RUN npm install
COPY .  .
RUN  npm run build

FROM nginx
COPY --from=tempcontainer /app/build /usr/share/nginx/html

