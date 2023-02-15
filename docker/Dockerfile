FROM node:18 AS builder

RUN npm install -g pnpm
ENV APP_DIR=/chatgpt-web
WORKDIR ${APP_DIR}

COPY . ${APP_DIR}
RUN cd ${APP_DIR}/service && pnpm install && pnpm build
RUN cd ${APP_DIR} && pnpm install && pnpm build

FROM node:18

RUN npm install -g pnpm http-server
ENV APP_DIR=/chatgpt-web
WORKDIR ${APP_DIR}

COPY --from=builder ${APP_DIR}/service backend
COPY --from=builder ${APP_DIR}/dist frontend
COPY docker/bootstrap.sh /usr/local/bin/bootstrap.sh

EXPOSE 3000
ENTRYPOINT ["/usr/local/bin/bootstrap.sh"]

