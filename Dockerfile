FROM alpine:3.10.1
WORKDIR /app
COPY package*.json ./
RUN apk add --update alpine-sdk nodejs npm
RUN LD_LIBRARY_PATH=/usr/local/lib64/:$LD_LIBRARY_PATH && export LD_LIBRARY_PATH && npm i
COPY . .
RUN npm run build && npm i -g serve
EXPOSE 3000 5000
CMD ["serve", "-s", "build"]
