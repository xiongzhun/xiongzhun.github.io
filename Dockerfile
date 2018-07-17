# Dockerfile
FROM node:slim
RUN apt-get update && apt-get install -y git ssh-client ca-certificates --no-install-recommends && rm -r /var/lib/apt/lists/*
Run git clone -b ci https://github.com/xiongzhun/xiongzhun.github.io.git
Run cd /hexow && git pull
Run npm install hexo-cli -g
Run cd /hexow && npm install
EXPOSE 4000
EXPOSE 22
ENTRYPOINT cd /hexow &&git fetch --all &&git reset --hard origin/master &&hexo clean &&hexo g &&hexo d&& hexo s