FROM node:12

RUN -v /workspace:/proj dxa4481/trufflehog --regex --entropy=true file:///proj
# RUN trufflehog --regex --entropy=true https://github.com/sadiaashfaq2812/react-buggy.git