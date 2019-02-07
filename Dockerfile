FROM ruby:2.6.1

RUN apt-get update && apt-get install -y apt-transport-https --no-install-recommends \
      build-essential \
      ruby-dev \
      libgdbm-dev \
      libncurses5-dev \
      curl \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
