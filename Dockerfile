FROM ubuntu:14.04 
RUN apt-get update -y && \
    apt-get -y install curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash && \
    . ~/.nvm/nvm.sh && \
    nvm install v6.9.4
RUN ls -al
RUN pwd
RUN mkdir /src
COPY . /src
EXPOSE 3001
#CMD ["node", "/src/app.js"]
#CMD ["bash", "-c", ".", "~/.nvm/nvm.sh", ";", "node", "/src/app.js"]
CMD ["bash", "-c", ". /root/.nvm/nvm.sh ; nvm install v6.9.4 ; nvm use v6.9.4 ; node /src/app.js"]
