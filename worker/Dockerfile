FROM klakegg/hugo:0.73.0-ext-alpine as hugo
WORKDIR /source
RUN git clone https://github.com/sadiaashfaq2812/react-buggy.git . 
RUN ls -la 
RUN hugo --gc --minify --enableGitInfo --destination=/source

FROM node:12
# set working directory
WORKDIR /app

COPY --from=hugo /source /app

RUN ls -la

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
# COPY package.json ./

# COPY package-lock.json ./
RUN npm install

# add app
COPY . /

# Define environment variables for Cloud Run
# ENV PORT 3000
ENV HOST 0.0.0.0
# EXPOSE 3000

# start app
CMD ["npm", "start"]

# # gitleaks integration - done
# FROM zricethezav/gitleaks
# WORKDIR /proj
# COPY --from=hugo /source /proj
# RUN ls -la
# RUN gitleaks --leaks-exit-code=0 --repo-url=https://github.com/sadiaashfaq2812/react-buggy -v --depth=100 --report=LeaksReport.json

# #dependency-check for checking vulnerable modules - done
# FROM openjdk:8
# WORKDIR /proj
# COPY --from=hugo /source /proj
# COPY ./dependency-check ./dependency-check
# USER root
# RUN chmod +x ./dependency-check/bin/dependency-check.sh
# RUN ./dependency-check/bin/dependency-check.sh --project react-project --scan ./ --out ModuleVulnerabilities


# FROM dxa4481/trufflehog as trufflehogScan
# WORKDIR /proj
# COPY --from=hugo /source /proj
# # RUN pwd
# RUN ls -a
# # RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git
# RUN trufflehog --regex --max_depth=100 file:///proj --entropy=false
# CMD ["trufflehog", "--regex", "--entropy=true", "/proj"]