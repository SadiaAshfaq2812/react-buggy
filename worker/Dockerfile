FROM python:3-alpine
# RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog
# RUN adduser -S truffleHog
# USER truffleHog
# WORKDIR /proj
# RUN pwd
# RUN ls -F
# COPY . ./
# ENTRYPOINT [ "trufflehog" ]
# CMD [ "-h" ]  

# RUN $(pwd) trufflehog --regex --entropy=true file:///proj
# # RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git

# ENTRYPOINT [ "./dependency-check-script.sh" ]
WORKDIR /proj
RUN pwd
RUN ./dependency-check-script.bash