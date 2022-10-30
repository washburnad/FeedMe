FROM ruby:3.0.0
WORKDIR /app
ENV RAILS_ENV=production
COPY Gemfile* package.json
RUN bundle install
COPY . .
RUN bin/rails assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]