#---------------------------Stage 1-----------------------
FROM node:16 as build

WORKDIR /app

COPY package* ./

RUN npm install

COPY . .

#----------------------------Stage 2------------------------

FROM node:16-slim

WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

CMD ["npm","start"]
