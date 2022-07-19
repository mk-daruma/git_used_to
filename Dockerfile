FROM ruby:3.0.2

RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN set -x && apt-get update -y -qq && apt-get install -yq nodejs yarn

RUN mkdir /git_used_to
WORKDIR /git_used_to
COPY Gemfile /git_used_to/Gemfile
COPY Gemfile.lock /git_used_to/Gemfile.lock
RUN bundle install
COPY . /git_used_to