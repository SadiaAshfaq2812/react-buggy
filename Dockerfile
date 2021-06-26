FROM node:12

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

# RUN ./dependency-check.sh --project https://github.com/sadiaashfaq2812/react-buggy.git --scan https://github.com/sadiaashfaq2812/react-buggy.git --out ModuleVulnerabilities

# add app
COPY . ./

# Define environment variables for Cloud Run
ENV PORT 3000
ENV HOST 0.0.0.0
EXPOSE 3000

# start app
#CMD ["npm", "start"]