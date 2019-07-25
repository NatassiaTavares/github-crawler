# Github Crawler

Gets the top rated repositories from Github in five languages: java, elixir, python, ruby and scala. The repositories are stored in a Postgres powered database.

This application is running on heroku [here](https://github-crawler-nat.herokuapp.com).

## Up and Running
This application uses [Docker](https://www.docker.com/), so you must have docker and [docker-compose](https://docs.docker.com/compose/) installed.

First, build the necessary images with:
```
docker-compose build
```

then run the container with:
```
docker-compose up
```

Now we must get the database ready, for this, we shall run:
```
docker-compose run web rake db:setup
```

The app should be running in localhost:3000.

## Tests
This application uses [RSpec Rails](https://github.com/rspec/rspec-rails) for testing.

To run the test suite, the containers must be previously build, then run:

```
docker-compose run web rake spec
```