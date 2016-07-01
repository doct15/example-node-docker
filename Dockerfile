FROM ubuntu:14.04
RUN apt-get update -y
RUN sudo apt-get -y install nodejs
COPY . /src
EXPOSE 3000
CMD ["nodejs", "/src/app.js"]
