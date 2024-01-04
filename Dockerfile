FROM brainsdevops/node
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN apt-get update
RUN apt-get install -y curl
CMD node index.js
EXPOSE 8080