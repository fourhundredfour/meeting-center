FROM node:latest AS build

WORKDIR /app
COPY . .

RUN yarn && yarn build


FROM node:latest

EXPOSE 3000

ENV SMTP_USER="" \
    SMTP_PASS="" \
    SMTP_HOST="" \
    SMTP_SSL="" \
    MAIL_RECEIVER=""

WORKDIR /app
COPY --from=build /app/build .
COPY --from=build /app/package.json .

ENTRYPOINT [ "node", "index.js" ]
