FROM skazuki/alpine-node-yarn

LABEL maintainer="S-Kazuki<contact@revoneo.com>"

ENV APP_ROOT=/node

WORKDIR $APP_ROOT

RUN yarn global add @vue/cli

ONBUILD COPY package.json ${APP_ROOT}/
ONBUILD COPY yarn.lock ${APP_ROOT}/

ONBUILD RUN npm ci \
  && npm cache clean --force

CMD ["yarn", "start"]