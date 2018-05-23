FROM node:8.9-alpine
ENV NODE_ENV development

COPY package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /app && cp -a /tmp/node_modules /app/

WORKDIR /app
COPY . .

RUN npm install -g gulp
RUN npm link gulp

EXPOSE 3000

CMD npm run dev