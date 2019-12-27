FROM node:9
ls 
docker info 
docker build -t jenkins-demo:${currentBuild.number} . 
docker tag jenkins-demo:${currentBuild.number} jenkins-demo:latest 
docker images
