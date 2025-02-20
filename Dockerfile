FROM ruby:3.2
RUN apt-get update -qq && apt-get install -y nodejs npm libmariadb-dev
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY . .
EXPOSE 3000