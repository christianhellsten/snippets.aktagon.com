---
id: '907'
title: Simple Dockerfile for Ruby on Rails applications
languages:
- bash
tags:
---
```bash
#
# Ruby on Rails Dockerfile
#
# ## Features:
#
# - Ruby
# - Puma
# - Yarn
# - Node
# - PostgreSQL
#
# ## Configuration
#
# ```bash
# mkdir .docker
# cat << EOF > .docker/envrc.dev
# RAILS_ENV=development
# DB_HOST=localhost
# DB_NAME=app_development
# DB_USER=app
# DB_PASS=password
# EOF
# cat << EOF > .docker/envrc.prod
# RAILS_ENV=production
# DB_HOST=postgres
# DB_NAME=app_production
# DB_USER=app
# DB_PASS=password
# EOF
# ```
#
# ## Usage
#
# ```bash
# $ docker build . -t <image name>
#
# # Development
# $ docker run --network=host --env-file=.docker/envrc.dev <image name>
#
# # Production
# $ docker run -p 3000:3000 --env-file=.docker/envrc.prod <image name>
# ```
#
FROM ruby:2.6.3

# Add Yarn to apt
# RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Don't run as root
RUN useradd --user-group -m --home /app --shell /bin/false app
RUN chown app:app /app
RUN chmod -R 740 /app
USER app

# Set working dir
ENV RAILS_ROOT /app
WORKDIR $RAILS_ROOT

ARG RAILS_ENV
ARG DB_HOST
ARG DB_NAME
ARG DB_USER
ARG DB_PASS

# Set ENV variables
ENV RAILS_ENV ${RAILS_env}
ENV RACK_ENV ${RAILS_ENV}
ENV DB_HOST ${DB_HOST}
ENV DB_NAME ${DB_NAME}
ENV DB_USER ${DB_USER}
ENV DB_PASS ${DB_PASS}

# Add and cache Ruby & Javascript dependencies
COPY --chown=app Gemfile Gemfile
COPY --chown=app Gemfile.lock Gemfile.lock
ADD package.json yarn.lock /tmp/
# Install Ruby and Javascript dependencies
RUN gem install bundler:2.0.2
RUN bundle install --jobs 20 --retry 5 --with=$RAILS_ENV --deployment
RUN yarn install

# Add project files
COPY --chown=app . .
# Precompile assets
RUN bundle exec rake assets:precompile

RUN mkdir -p log tmp/pids

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
```
