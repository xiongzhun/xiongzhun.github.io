# Dockerfile
FROM node:slim
RUN apt-get update && apt-get install -y git ssh-client ca-certificates --no-install-recommends && rm -r /var/lib/apt/lists/*
Run git clone -b ci https://github.com/xiongzhun/xiongzhun.github.io.git
Run cd /xiongzhun.github.io && git pull
Run npm install hexo-cli -g
Run cd /xiongzhun.github.io && npm install
EXPOSE 4000
EXPOSE 22