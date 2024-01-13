FROM node:20.11.0-alpine3.19

WORKDIR /app

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
