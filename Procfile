web: bundle exec rails s -p $PORT -e $RACK_ENV
webpack: bin/webpack-dev-server
worker: bundle exec sidekiq -c 5 -v -C config/sidekiq.yml