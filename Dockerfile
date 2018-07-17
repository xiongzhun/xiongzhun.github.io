# Dockerfile
FROM node:slim
RUN apt-get update && apt-get install -y git ssh-client ca-certificates --no-install-recommends && rm -r /var/lib/apt/lists/*
Run git clone -b ci https://github.com/xiongzhun/xiongzhun.github.io.git
Run cd /xiongzhun.github.io && git pull
Run npm install hexo-cli -g
Run cd /xiongzhun.github.io && npm install && hexo clean && hexo g && hexo d
Run cd /xiongzhun.github.io/public && git init && git config --global user.name "xiongzhun" && git config --global user.email "xz2048@aliyun.com" && git add . && git commit -m "Update docs" && git push --force --quiet "https://github.com/xiongzhun/xiongzhun.github.io.git" master:master
EXPOSE 4000
EXPOSE 22