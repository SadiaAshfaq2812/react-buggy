# FROM node:12
# # RUN apk update && apk add bash
# # RUN apk add --no-cache bash
# # set working directory
# WORKDIR /app

# # add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH

# # install app dependencies
# COPY package.json ./

# COPY ./dependency-check.sh ./dependency-check.sh

# # mkdir ModuleVulnerabilities
# # docker run --rm owasp/dependency-check --scan ./ --format "ALL" --project ./ --out ./ModuleVulnerabilities

# # COPY package-lock.json ./
# RUN npm install

# # add app
# COPY . ./

# # Define environment variables for Cloud Run
# ENV PORT 3000
# ENV HOST 0.0.0.0
# EXPOSE 3000

# start app
#CMD ["npm", "start"]










# FROM klakegg/hugo:0.73.0-ext-alpine as hugo
# WORKDIR /app
# COPY . ./app
# RUN git clone https://github.com/sadiaashfaq2812/react-buggy.git . && ls -la && hugo --gc --minify --enableGitInfo --destination=/app

# FROM dxa4481/trufflehog

# # WORKDIR /app

# # COPY . ./app

# # RUN ls -a

# # # RUN pwd

# # RUN trufflehog --regex --entropy=false file:///app

FROM node:12


# set working directory
WORKDIR /app

# # add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# # install app dependencies
COPY package.json ./

# # mkdir ModuleVulnerabilities
# # docker run --rm owasp/dependency-check --scan ./ --format "ALL" --project ./ --out ./ModuleVulnerabilities

# # COPY package-lock.json ./
# RUN npm install

# add app
COPY . ./

# Define environment variables for Cloud Run
ENV PORT 3000
ENV HOST 0.0.0.0
EXPOSE 3000

# start app
CMD ["npm", "start"]