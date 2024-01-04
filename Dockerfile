FROM node:21.5.0-bookworm-slim

# Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

ENV NODE_ENV=production

WORKDIR /app
COPY package*.json /app
RUN npm ci
COPY . /app

CMD ["node","index.js"]
EXPOSE 8080