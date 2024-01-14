FROM node:20.11.0-alpine3.19

WORKDIR /app

# Ensure both package-lock and package.json are copied
COPY package*.json .

# Install application dependencies
RUN npm install

# Bundle app soruce code
COPY . .

# The Node application utlize port 3000
EXPOSE 3000

# Starts the application
CMD ["npm", "start"]
