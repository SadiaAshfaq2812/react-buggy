FROM klakegg/hugo:0.73.0-ext-alpine as hugo
WORKDIR /source
RUN git clone https://github.com/sadiaashfaq2812/react-buggy.git . 
RUN ls -la 
RUN hugo --gc --minify --enableGitInfo --destination=/source

# # gitleaks integration - done
# FROM zricethezav/gitleaks
# WORKDIR /proj
# COPY --from=hugo /source /proj
# RUN ls -la
# RUN gitleaks --leaks-exit-code=0 --repo-url=https://github.com/sadiaashfaq2812/react-buggy -v --depth=100 --report=LeaksReport.json

FROM gruebel/retirejs
WORKDIR /proj
COPY --from=hugo /source /proj
RUN retire https://github.com/sadiaashfaq2812/react-buggy.git

# docker run --rm -v $PWD:/app gruebel/retirejs:latest

# FROM sonarqube
# WORKDIR /proj
# COPY --from=hugo /source /proj
# RUN sysctl -w vm.max_map_count=524288
# RUN sysctl -w fs.file-max=131072
# RUN ulimit -n 131072
# RUN ulimit -u 8192

RUN -d -p 9000:9000 --name sonarserver sonarqube
# RUN wget https://github.com/ShiftLeftSecurity/sast-scan/releases/download/v1.9.27/scan
# RUN chmod +x scan
# ./scan -t nodejs

FROM rvannauker/checkmarx
WORKDIR /proj
COPY --from=hugo /source /proj
RUN "rvannauker/checkmarx" Scan /proj
# -CxServer {server} -ProjectName {projectName} -CxUser {username} -CxPassword {password} -Incremental -LocationType {location_type} -LocationPath {location_path} -LocationPathExclude "{exclude_paths}" -v


# abhartiya/tools_gitallsecrets
FROM abhartiya/tools_gitallsecrets
WORKDIR /proj
COPY --from=hugo /source /proj
RUN git-all-secrets -token="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" -repoURL https://github.com/sadiaashfaq2812/react-buggy.git -toolName=repo-supervisor --report_file

# # shiftleft/sast-scan
# FROM appthreat/dep-scan
# WORKDIR /proj
# COPY --from=hugo /source /proj
# USER root
# RUN chmod +x /proj
# RUN /proj appthreat/dep-scan scan --src /proj --report_file /proj/reports/depscan.json


# # shiftleft/sast-scan
# FROM shiftleft/sast-scan
# WORKDIR /proj
# COPY --from=hugo /source /proj
# RUN $PWD shiftleft/sast-scan scan --src /proj --type credscan,nodejs,python,yaml --out_dir /proj/reports

# #dependency-check for checking vulnerable modules - done
# FROM openjdk:8
# WORKDIR /proj
# COPY --from=hugo /source /proj
# COPY ./dependency-check ./dependency-check
# USER root
# RUN chmod +x ./dependency-check/bin/dependency-check.sh
# RUN ./dependency-check/bin/dependency-check.sh --project react-project --scan ./ --out ModuleVulnerabilities

#trufflehog commands
# FROM dxa4481/trufflehog as trufflehogScan
# WORKDIR /proj
# COPY --from=hugo /source /proj
# RUN ls -la
# RUN trufflehog --regex --entropy False --max_depth 100 file:///proj

# RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git


FROM dxa4481/trufflehog as trufflehogScan
WORKDIR /proj
COPY --from=hugo /source /proj
# RUN pwd
RUN ls -a
# RUN trufflehog --regex --entropy=false https://github.com/sadiaashfaq2812/react-buggy.git
RUN trufflehog --regex --max_depth=100 file:///proj --entropy=false
# CMD ["trufflehog", "--regex", "--entropy=true", "/proj"]


FROM node:12
# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
# COPY package.json ./

# COPY package-lock.json ./
RUN npm install

# add app
COPY . ./

# Define environment variables for Cloud Run
ENV PORT 3000
ENV HOST 0.0.0.0
EXPOSE 3000

# start app
#CMD ["npm", "start"]


# FROM python:3-alpine
# RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog
# RUN adduser -S truffleHog
# USER truffleHog
# WORKDIR /proj
# RUN pwd
# RUN ls
# COPY . ./
# ENTRYPOINT [ "trufflehog" ]
# CMD [ "-h" ]  
# RUN trufflehog https://github.com/sadiaashfaq2812/react-buggy.git
RUN trufflehog --regex --entropy=true file:///proj
# VOLUME $(pwd):/proj dxa4481/trufflehog --regex --entropy=true file:///proj
# #
# # RUN trufflehog --regex --entropy=true --include_paths package-lock.json
# # # ENTRYPOINT [ "./dependency-check-script.sh" ]
# # WORKDIR /dependency-check/bin
# # # COPY . ./
# # # # RUN cd /dependency-check/bin
# # # RUN ls -F
# # RUN pwd
# # # RUN /dependency-check-script.bash

# # COPY /dependency-check-script.bash /
# # RUN chmod +x /dependency-check-script.bash
# # ENTRYPOINT [ "/dependency-check-script.bash" ]

# # FROM ubuntu:16.04
# # WORKDIR /app
# # COPY . ./
# # RUN pwd
# # RUN ls -a
# # RUN dir
# # RUN chmod +x ./dependency-check-script.bash

#  # syntax=docker/dockerfile:1
# FROM node:12-alpine
# RUN apk add --no-cache python g++ make
# WORKDIR /app
# COPY . .
# RUN ls -a
# RUN chmod +x ./
# RUN /dependency-check-script.bash
# # RUN npm install
# # CMD ["node", "src/index.js"]
