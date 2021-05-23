FROM node:10-alpine

ARG START_SCRIPT

ARG PORT

ENV START_COMMAND=$START_SCRIPT

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

RUN npm install

RUN npm install -g sequelize-cli

RUN sequelize db:migrate all

RUN sequelize db:seed:all

EXPOSE $PORT

CMD npm run $START_COMMAND