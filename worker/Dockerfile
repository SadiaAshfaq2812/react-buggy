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
RUN cd ./proj
RUN trufflehog file:///user/dxa4481/codeprojects/truffleHog/
# RUN chmod +x ./dependency-check.sh
# RUN $(pwd) trufflehog --regex --entropy=false file:///proj
# RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git