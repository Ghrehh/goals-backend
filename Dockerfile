FROM ruby:2.5.1-alpine
RUN apk add --no-cache make build-base openssl postgresql-dev tzdata

COPY ./Gemfile /usr/src/goals-backend/Gemfile
WORKDIR /usr/src/goals-backend
RUN bundle install

COPY ./ /usr/src/goals-backend/

EXPOSE 3000 
CMD bundle exec rails s 
