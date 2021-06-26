# FROM python:3-alpine
# # RUN apk add --no-cache git && 
# RUN pip install gitdb2==3.0.0 trufflehog
# RUN adduser -S truffleHog
# USER truffleHog
# WORKDIR /proj
# ENTRYPOINT [ "trufflehog" ]
# CMD [ "-h" ]

FROM node:12

# RUN npm install trufflehog
# RUN trufflehog --regex --entropy=False https://github.com/SadiaAshfaq2812/react-buggy.git

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
# mkdir ModuleVulnerabilities
# docker run --rm owasp/dependency-check --scan ./ --format "ALL" --project ./ --out ./ModuleVulnerabilities

# COPY package-lock.json ./
RUN npm install
# RUN ./dependency-check.sh --project https://github.com/SadiaAshfaq2812/react-buggy.git --scan https://github.com/SadiaAshfaq2812/react-buggy.git --out ModuleVulnerabilities
# RUN dxa4481/trufflehog

# RUN npm install trufflehog

      
# RUN trufflehog -c ./config.json



# add app
COPY . ./

# Define environment variables for Cloud Run
ENV PORT 3000
ENV HOST 0.0.0.0
EXPOSE 3000

# start app
#CMD ["npm", "start"]










# # Trufflehog Steps
# FROM python:3.7-alpine

# LABEL name="trufflehog-actions-scan"
# LABEL version="1.0.0"
# LABEL repository="https://github.com/SadiaAshfaq2812/react-buggy"
# LABEL homepage="https://github.com/SadiaAshfaq2812/react-buggy"
# LABEL maintainer="SadiaAshfaq2812"

# LABEL "com.github.actions.name"="Trufflehog Actions Scan"
# LABEL "com.github.actions.description"="Scan repository for secrets with basic trufflehog defaults in place for easy setup."
# LABEL "com.github.actions.icon"="shield"
# LABEL "com.github.actions.color"="yellow"

# RUN pip install gitdb2==3.0.0 truffleHog==2.0.99
# RUN apk --update add git less openssh && \
#   rm -rf /var/lib/apt/lists/* && \
#   rm /var/cache/apk/*

# ADD entrypoint.sh  /entrypoint.sh
# ADD regexes.json /regexes.json

# ENTRYPOINT ["sh", "/entrypoint.sh"]
# RUN ["chmod", "+x", "/entrypoint.sh"]