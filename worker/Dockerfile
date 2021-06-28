FROM python:3-alpine
RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog
RUN adduser -S truffleHog
USER truffleHog
WORKDIR /proj
ENTRYPOINT [ "trufflehog" ]
# ENTRYPOINT [ "docker run --rm -v /workspace:/proj trufflehog --regex --entropy=true file:///proj" ]
CMD [ "-h" ]  
# RUN . ./ dxa4481/trufflehog --regex --entropy=true file:///proj

RUN trufflehog --regex --entropy=True --max_depth=20 https://github.com/sadiaashfaq2812/react-buggy.git

# RUN --rm -v /workspace:/proj dxa4481/trufflehog --regex --entropy=true file:///proj