FROM node:lts-alpine

RUN mkdir -p /home/node/api/node_modules && chown -R node:node /home/node/api

WORKDIR /home/node/api

COPY package.json yarn.* ./

USER node

RUN yarn

COPY --chown=node:node . .

EXPOSE 3333

RUN  yarn sucrase ./src -d ./dist --transforms imports
CMD ["node", "dist/server"]



