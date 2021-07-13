# # FROM node:12
# # # RUN apk update && apk add bash
# # # RUN apk add --no-cache bash
# # # set working directory
# # WORKDIR /app

# # # add `/app/node_modules/.bin` to $PATH
# # ENV PATH /app/node_modules/.bin:$PATH

# # # install app dependencies
# # COPY package.json ./

# # COPY ./dependency-check.sh ./dependency-check.sh

# # # mkdir ModuleVulnerabilities
# # # docker run --rm owasp/dependency-check --scan ./ --format "ALL" --project ./ --out ./ModuleVulnerabilities

# # # COPY package-lock.json ./
# # RUN npm install

# # # add app
# # COPY . ./

# # # Define environment variables for Cloud Run
# # ENV PORT 3000
# # ENV HOST 0.0.0.0
# # EXPOSE 3000

# # start app
# #CMD ["npm", "start"]










# # FROM klakegg/hugo:0.73.0-ext-alpine as hugo
# # WORKDIR /app
# # COPY . ./app
# # RUN git clone https://github.com/sadiaashfaq2812/react-buggy.git . && ls -la && hugo --gc --minify --enableGitInfo --destination=/app

# # FROM dxa4481/trufflehog

# # # WORKDIR /app

# # # COPY . ./app

# # # RUN ls -a

# # # # RUN pwd

# # # RUN trufflehog --regex --entropy=false file:///app

# FROM node:12


# # set working directory
# WORKDIR /app

# # # add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH

# # # install app dependencies
# COPY package.json ./

# # # mkdir ModuleVulnerabilities
# # # docker run --rm owasp/dependency-check --scan ./ --format "ALL" --project ./ --out ./ModuleVulnerabilities

# # # COPY package-lock.json ./
# # RUN npm install

# # add app
# COPY . ./

# # Define environment variables for Cloud Run
# ENV PORT 3000
# ENV HOST 0.0.0.0
# EXPOSE 3000

# # start app
# CMD ["npm", "start"]


FROM klakegg/hugo:0.73.0-ext-alpine as hugo
WORKDIR /source
RUN git clone https://github.com/sadiaashfaq2812/react-buggy.git . 
RUN ls -la 
RUN hugo --gc --minify --enableGitInfo --destination=/source

WORKDIR /proj
COPY --from=hugo /source /proj
RUN ./dependency-check-script.sh
# FROM ubuntu:16.04
#trufflehog commands
FROM dxa4481/trufflehog as trufflehogScan
WORKDIR /proj
COPY --from=hugo /source /proj
# COPY . ./proj
# RUN pwd
RUN ls -la
# --max_depth 100
RUN trufflehog --regex --entropy False  file:///proj

# RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git


# FROM nginx
# COPY deploy/default.conf.template /etc/nginx/conf.d/default.conf.template
# COPY deploy/nginx.conf /etc/nginx/nginx.conf
# COPY --from=hugo /target /usr/share/nginx/html
# CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'


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
# COPY . ./proj
# RUN pwd
# RUN ls
# RUN pwd
# RUN ./dependency-check-script.bash
# # RUN pwd
# RUN ./dependency-check.sh --project react-project --scan ./ --out ModuleVulnerabilities

# FROM dxa4481/trufflehog as trufflehogScan
# WORKDIR /proj
# COPY . ./proj
# # RUN pwd
# RUN ls -a
# # RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git
# RUN trufflehog --regex --entropy=true ./proj
# # CMD ["trufflehog", "--regex", "--entropy=true", "/proj"]











# FROM node:12
# # set working directory
# WORKDIR /app

# # add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH

# # install app dependencies
# # COPY package.json ./

# # COPY package-lock.json ./
# RUN npm install

# # add app
# COPY . ./

# # FROM trufflehogScan

# # Define environment variables for Cloud Run
# ENV PORT 3000
# ENV HOST 0.0.0.0
# EXPOSE 3000

# # start app
# #CMD ["npm", "start"]


# # FROM python:3-alpine
# # RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog
# # RUN adduser -S truffleHog
# # USER truffleHog
# # WORKDIR /proj
# # RUN pwd
# # RUN ls
# # COPY . ./
# # ENTRYPOINT [ "trufflehog" ]
# # CMD [ "-h" ]  
# # RUN trufflehog https://github.com/sadiaashfaq2812/react-buggy.git
# RUN trufflehog --regex --entropy=true file:///proj
# # VOLUME $(pwd):/proj dxa4481/trufflehog --regex --entropy=true file:///proj
# # #
# # # RUN trufflehog --regex --entropy=true --include_paths package-lock.json
# # # # ENTRYPOINT [ "./dependency-check-script.sh" ]
# # # WORKDIR /dependency-check/bin
# # # # COPY . ./
# # # # # RUN cd /dependency-check/bin
# # # # RUN ls -F
# # # RUN pwd
# # # # RUN /dependency-check-script.bash

# # # COPY /dependency-check-script.bash /
# # # RUN chmod +x /dependency-check-script.bash
# # # ENTRYPOINT [ "/dependency-check-script.bash" ]

# # # FROM ubuntu:16.04
# # # WORKDIR /app
# # # COPY . ./
# # # RUN pwd
# # # RUN ls -a
# # # RUN dir
# # # RUN chmod +x ./dependency-check-script.bash

# #  # syntax=docker/dockerfile:1
# # FROM node:12-alpine
# # RUN apk add --no-cache python g++ make
# # WORKDIR /app
# # COPY . .
# # RUN ls -a
# # RUN chmod +x ./
# # RUN /dependency-check-script.bash
# # # RUN npm install
# # # CMD ["node", "src/index.js"]
