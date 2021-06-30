FROM python:3-alpine
RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog
RUN adduser -S truffleHog
USER truffleHog
WORKDIR /proj
COPY . ./
ENTRYPOINT [ "trufflehog" ]
CMD [ "-h" ]  

RUN -v ./react-buggy dxa4481/trufflehog --regex --entropy=false file:///react-buggy
# RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git