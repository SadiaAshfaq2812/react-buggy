FROM ubuntu:latest
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
VOLUME $(pwd):/proj dxa4481/trufflehog --regex --entropy=true file:///proj
# # RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git

# ENTRYPOINT [ "./dependency-check-script.sh" ]
WORKDIR /app
COPY . ./
# RUN cd ./dependency-check/bin
# RUN ls -F
RUN pwd
RUN ./dependency-check-script.bash