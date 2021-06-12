FROM node:12

RUN npm install trufflehog
# set working directory
WORKDIR /app

# RUN adduser -S truffleHog
# USER truffleHog
# WORKDIR /app
# ENTRYPOINT [ "trufflehog" ]
# CMD [ "-h" ]

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./

# COPY package-lock.json ./

RUN npm install
# RUN npm install react-scripts@3.4.1 -g --silent

# RUN npm install trufflehog
RUN truffleHog https://github.com/SadiaAshfaq2812/react-buggy.git
      
# RUN trufflehog -c ./config.json



# add app
COPY . ./

# Define environment variables for Cloud Run
ENV PORT 3000
ENV HOST 0.0.0.0
EXPOSE 3000

# start app
#CMD ["npm", "start"]