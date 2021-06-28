FROM python:3-alpine
RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog
RUN adduser -S truffleHog
USER truffleHog
WORKDIR /proj
ENTRYPOINT [ "trufflehog" ]
CMD [ "-h" ]
# RUN trufflehog --regex --entropy=False file:///proj
RUN trufflehog --regex --entropy=true https://github.com/sadiaashfaq2812/react-buggy.git

# RUN --rm -v /workspace:/proj dxa4481/trufflehog --regex --entropy=true file:///proj