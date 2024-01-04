FROM node:21.5.0-bookworm-slim

# Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

WORKDIR /app
# RUN apt-get update \
#     && apt-get install -y curl \
#     && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* 
COPY package.json /app
RUN npm install
COPY . /app

CMD ["node","index.js"]
EXPOSE 8080