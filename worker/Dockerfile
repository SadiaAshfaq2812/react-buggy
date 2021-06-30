FROM python:3-alpine
RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog
RUN adduser -S truffleHog
USER truffleHog
WORKDIR /proj
RUN pwd
RUN ls -F
COPY . ./
ENTRYPOINT [ "trufflehog" ]
CMD [ "-h" ]  
# RUN chmod +x ./proj
# RUN cd ./
# ENTRYPOINT [ "/USER" ]

RUN chmod -R 777 /proj
RUN pwd
# RUN trufflehog file:///proj
# RUN chmod +x ./dependency-check.sh
RUN $(pwd) trufflehog --regex --entropy=true file:///proj
# RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git