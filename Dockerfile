FROM ruby:2.5.1-alpine
RUN apk add --no-cache make build-base openssl postgresql-dev tzdata

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY ./Gemfile /usr/src/goals-backend/Gemfile
WORKDIR /usr/src/goals-backend
RUN bundle install

COPY ./ /usr/src/goals-backend/

EXPOSE 3000 
CMD bundle exec rails s 
