from elixir:latest

# This is only for development with no db
RUN set -xe \
  && apt-get update \
  && apt-get -y install inotify-tools \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash \
  && apt-get -y install nodejs

WORKDIR /usr/src/app

COPY . . 

RUN npm i --prefix ./assets
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get

EXPOSE 4000
CMD ["mix", "phx.server"]
