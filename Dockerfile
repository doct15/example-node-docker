FROM ubuntu:14.04 
RUN apt-get update -y && \
    apt-get -y install curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash && \
    source ~/.nvm/nvm.sh && \
    nvm install v6.9.4
COPY . /src
EXPOSE 3001
CMD ["node", "/src/app.js"]
