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
# RUN gitleaks --leaks-exit-code=1 --repo-url=https://github.com/sadiaashfaq2812/react-buggy -v --depth=100

# # SonarScanner integration for code scanning and results on SonarCloud- done
# FROM sonarsource/sonar-scanner-cli:4.6
# WORKDIR /proj
# COPY --from=hugo /source /proj
# RUN sonar-scanner -Dsonar.projectBaseDir=$(pwd) -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=607100fadb18e14b3a9ba3e0fa27e6af26a89722 

# # Trufflehog to checking keys - done
# FROM dxa4481/trufflehog as trufflehogScan
# WORKDIR /proj
# COPY --from=hugo /source /proj
# # RUN pwd
# RUN ls -a
# RUN trufflehog https://github.com/sadiaashfaq2812/react-buggy.git
# /*--json --regex --entropy=true --max_depth=100 */
# RUN trufflehog --regex --entropy=false file:///proj
# CMD ["trufflehog", "--regex", "--entropy=true", "/proj"]

# dependency-check for checking vulnerable modules - done
FROM openjdk:8
WORKDIR /proj
COPY --from=hugo /source /proj
# COPY /dependency-check /dependency-check
USER root
RUN chmod +x ./dependency-check/bin/dependency-check.sh
RUN ./dependency-check/bin/dependency-check.sh --project react-project --scan ./ --out ModuleVulnerabilities

# FROM owasp/zap2docker-stable
# RUN -t owasp/zap2docker-stable zap-baseline.py -t https://react-eop2gprqzq-uc.a.run.app/

FROM node:12
# set working directory
WORKDIR /app

COPY --from=hugo /source /app

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