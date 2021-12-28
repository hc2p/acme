FROM ruby:3.0-slim-buster

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install -y build-essential git libsqlite3-dev && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN bundle install

COPY . /app

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
