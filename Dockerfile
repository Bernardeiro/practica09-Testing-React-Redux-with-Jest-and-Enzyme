FROM node:18
WORKDIR /usr/src/app
COPY . .
RUN yarn install
EXPOSE 3000
CMD ["yarn", "start"]

