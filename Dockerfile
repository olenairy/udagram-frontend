# 
FROM node:13-alpine as build


WORKDIR /usr/src/app
 
 # Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./


RUN npm install -g ionic

# Install dependencies
RUN npm install

# Bundle app source
COPY . .

#RUN npm run-script build:prod
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
#COPY --from=build /app/www/ /usr/share/nginx/html/

