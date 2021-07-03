# FROM ubuntu:latest
# WORKDIR /proj
# RUN ls -a
# COPY . ./
# RUN pwd
# RUN ls
# # COPY dependency-check-script.sh .
# RUN ./dependency-check-script.sh

# FROM node:12
# RUN apk update && apk add bash
# RUN apk add --no-cache bash
# WORKDIR /proj
# RUN pwd
# RUN ls
# # RUN /dependency-check-script.bash
# # RUN pwd
# RUN ./dependency-check.sh --project react-project --scan ./ --out ModuleVulnerabilities

FROM dxa4481/trufflehog as trufflehogScan
WORKDIR /proj
COPY . ./proj
# RUN pwd
RUN ls -a
# RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git
RUN dxa4481/trufflehog --regex --entropy=true ./proj
# CMD ["trufflehog", "--regex", "--entropy=true", "/proj"]


FROM node:12
# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./

# COPY package-lock.json ./
RUN npm install

# add app
COPY . ./

FROM trufflehogScan

# Define environment variables for Cloud Run
ENV PORT 3000
ENV HOST 0.0.0.0
EXPOSE 3000

# start app
#CMD ["npm", "start"]


# FROM python:3-alpine
# RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog
# RUN adduser -S truffleHog
# USER truffleHog
# WORKDIR /proj
# RUN pwd
# RUN ls
# COPY . ./
# ENTRYPOINT [ "trufflehog" ]
# CMD [ "-h" ]  
# RUN trufflehog https://github.com/sadiaashfaq2812/react-buggy.git
# RUN trufflehog --regex --entropy=true file:///proj
# VOLUME $(pwd):/proj dxa4481/trufflehog --regex --entropy=true file:///proj
# #
# # RUN trufflehog --regex --entropy=true --include_paths package-lock.json
# # # ENTRYPOINT [ "./dependency-check-script.sh" ]
# # WORKDIR /dependency-check/bin
# # # COPY . ./
# # # # RUN cd /dependency-check/bin
# # # RUN ls -F
# # RUN pwd
# # # RUN /dependency-check-script.bash

# # COPY /dependency-check-script.bash /
# # RUN chmod +x /dependency-check-script.bash
# # ENTRYPOINT [ "/dependency-check-script.bash" ]

# # FROM ubuntu:16.04
# # WORKDIR /app
# # COPY . ./
# # RUN pwd
# # RUN ls -a
# # RUN dir
# # RUN chmod +x ./dependency-check-script.bash

#  # syntax=docker/dockerfile:1
# FROM node:12-alpine
# RUN apk add --no-cache python g++ make
# WORKDIR /app
# COPY . .
# RUN ls -a
# RUN chmod +x ./
# RUN /dependency-check-script.bash
# # RUN npm install
# # CMD ["node", "src/index.js"]
