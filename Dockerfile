FROM ruby:3.2.1

ENV DATABASE_HOST=db
ENV DATABASE_USERNAME=root
ENV DATABASE_PASSWORD=root

RUN mkdir /app
WORKDIR /app

EXPOSE 3000

COPY Gemfile .
COPY Gemfile.lock .
RUN gem update bundler
RUN bundle config build.libv8 --with-system-v8
RUN bundle config build.therubyracer --with-v8-dir=$(brew --prefix v8@3.15)
RUN gem install libv8 -v '3.16.14.19' -- --with-system-v8 \
  && bundle config --global build.libv8 --with-system-v8 \
  && bundle config build.therubyracer --with-v8-dir=$(brew --prefix v8@3.15)
RUN bundle install

CMD RAILS_ENV=development rails server -b 0.0.0.0