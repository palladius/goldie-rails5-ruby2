# v1. copied from https://blog.codeship.com/running-rails-development-environment-docker/
#FROM ubuntu:14.04

# v2: https://github.com/pacuna/rails5-docker-alpine/blob/master/Dockerfile
FROM ruby:2.5.1-alpine3.7

LABEL maintainer="palladiusbonton@gmail.com"

# Minimal requirements to run a Rails app
RUN apk add --no-cache --update build-base \
                                linux-headers \
                                git \
                                postgresql-dev \
                                nodejs \
                                tzdata

ENV APP_PATH /usr/src/app

# Different layer for gems installation
WORKDIR $APP_PATH
ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH
RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

# Copy the application into the container
COPY . APP_PATH
EXPOSE 3000