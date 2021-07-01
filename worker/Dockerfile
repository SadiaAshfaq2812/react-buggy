# FROM ubuntu:latest
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
# VOLUME $(pwd):/proj dxa4481/trufflehog --regex --entropy=true file:///proj
# # # RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git

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

FROM ubuntu:16.04
WORKDIR /proj
COPY . ./
RUN pwd
RUN ls
RUN chmod +x /dependency-check-script.bash
