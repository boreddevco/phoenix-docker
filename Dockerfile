from elixir:latest

# This is only for development with no db
RUN set -xe \
  && apt-get update \
  && apt-get -y install inotify-tools \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash \
  && apt-get -y install nodejs \
  && apt-get -y install postgresql-client

WORKDIR /usr/src/app

COPY . . 

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
# RUN mix do compile

RUN npm i --prefix ./assets

EXPOSE 4000
