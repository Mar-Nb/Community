# from base image node
FROM node:14.14.0-alpine3.10

ENV APP_PORT=$APP_PORT

# copy oter files as well
COPY . .

# install all dependencies
RUN npm install serve -g
RUN npm i -g expo expo-cli
# Installe les dépandances et build le client
RUN npm install && expo build:web --non-interactive

# command to run when intantiate an image
CMD serve -s ./web-build -l $APP_PORT

EXPOSE $APP_PORT

