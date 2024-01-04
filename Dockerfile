FROM node:21.5.0-bookworm-slim

# Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

ENV NODE_ENV=production

ARG GITHUB_PAT
ENV npm_token=${GITHUB_PAT}
COPY example.npmrc /app/.npmrc

WORKDIR /app
COPY package*.json /app
RUN npm ci
COPY . /app

RUN chown -R node:node /app
USER node

CMD ["node","index.js"]
EXPOSE 8080