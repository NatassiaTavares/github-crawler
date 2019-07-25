# Github Crawler

Gets the top rated repositories from Github in five languages: java, elixir, python, ruby and scala. The repositories are stored in a Postgres powered database.

This application is running on heroku [here](https://github-crawler-nat.herokuapp.com).

## Behavior
All Github integration is made in github_service.rb, there, a search request is made for each of the five languages, the repositories found are recorded straight to the database. 

On each search request to Github API are returned 30 results. Because the application searches 5 times (one for each language), 150 records are stored in the database.

Github API has a rate time limit for the amount of made requests, throwing a 403 Http Status when the rate is reached, to handle this, just a simple exception is being used, there's no need to implement any fallout, the application will render the repositories already in the database. 

## Up and Running
This application uses [Docker](https://www.docker.com/), so you must have docker and [docker-compose](https://docs.docker.com/compose/) installed.

First, build the necessary images with:
```
docker-compose build
```

Install the webpacker with:
```
docker-compose run web rails webpacker:install
```

Everything should go smooth until this point, but I sometimes got this error:
TODO: paste the error here

To solve all we need to do is to run XX directly inside the container with:
```
docker-compose run web yarn install --check-files
```
You can retry to install webpacker now, it should work.

Now we must get the database ready, for this, we shall run:
```
docker-compose run web rake db:setup
```

Run the migrations with: 
```
docker-compose run web rake db:migrate
```

then run the container with:
```
docker-compose up
```

The app should be running in localhost:3000.

## Tests
This application uses [RSpec Rails](https://github.com/rspec/rspec-rails) for testing.

To run the test suite, the containers must be previously build, first, we need to get the test database ready with:

```
docker-compose run web rake db:test:prepare
```

Then the test suite is ready to be run with:
```
docker-compose run web rake spec
```