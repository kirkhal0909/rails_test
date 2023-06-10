FROM ruby:2.7.6-alpine

ENV BUNDLER_VERSION=2.4.13

RUN apk add --update --no-cache \
      libc-dev \
      postgresql-dev \
      postgresql-contrib \
      libpq-dev \
      libffi-dev \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      openssl \
      pkgconfig \
      tzdata

RUN gem install bundler -v 2.4.13

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . ./

ENTRYPOINT ["./scripts/entrypoints/docker-entrypoint.sh"]
