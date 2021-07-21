FROM node:12
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./

COPY package-lock.json ./
RUN npm install

# add app
COPY . ./

# Define environment variables for Cloud Run
ENV PORT 3000
ENV HOST 0.0.0.0
EXPOSE 3000

# start app
# CMD ["npm", "start"]