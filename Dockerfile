FROM node:20.11.0-alpine3.19

WORKDIR /app

COPY . .

# The Node application utlize port 3000
EXPOSE 3000

# Install npm dependencies required to run the Node application and start the application
CMD ["npm", "start"]
