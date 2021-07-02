# FROM ubuntu:latest
FROM python:3-alpine
RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog
RUN adduser -S truffleHog
USER truffleHog
WORKDIR /proj
RUN pwd
RUN ls
COPY . ./
ENTRYPOINT [ "trufflehog" ]
CMD [ "-h" ]  
RUN trufflehog --regex --entropy=false file:///proj/react-buggy.git
# VOLUME $(pwd):/proj dxa4481/trufflehog --regex --entropy=true file:///proj
# RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git

# RUN trufflehog --regex --entropy=true --include_paths package-lock.json
# # ENTRYPOINT [ "./dependency-check-script.sh" ]
# WORKDIR /dependency-check/bin
# # COPY . ./
# # # RUN cd /dependency-check/bin
# # RUN ls -F
# RUN pwd
# # RUN /dependency-check-script.bash

# COPY /dependency-check-script.bash /
# RUN chmod +x /dependency-check-script.bash
# ENTRYPOINT [ "/dependency-check-script.bash" ]

# FROM ubuntu:16.04
# WORKDIR /app
# COPY . ./
# RUN pwd
# RUN ls -a
# RUN dir
# RUN chmod +x ./dependency-check-script.bash

 # syntax=docker/dockerfile:1
FROM node:12-alpine
RUN apk add --no-cache python g++ make
WORKDIR /app
COPY . .
RUN ls -a
RUN chmod +x ./
RUN /dependency-check-script.bash
# RUN npm install
# CMD ["node", "src/index.js"]
