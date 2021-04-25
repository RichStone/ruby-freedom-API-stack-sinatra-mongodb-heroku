# Ruby Freedom Stack: Sinatra - MongoDB - Heroku - Minitest

A flexible lightweight API mini backend **template**.

An example running on Heroku here: https://sheltered-escarpment-38193.herokuapp.com/freedom.

You can build it from scratch in this comprehensive step-by-step tutorial: https://richstone.io/p/6205b610-cf12-4cbb-bb92-7f649422b43f/

## Prerequisites

For the full experience, you will need:

* Ruby (2.7.1 should work fine) and Ruby's bundler installed
* Heroku account and Heroku CLI installed
* MongoDB installed and account at MongoDB Atlas

## Local installation

The local version should be running successfully once you have MongoDB installed.

Then you can do:

```shell
$ git clone git@github.com:RichStone/ruby-freedom-API-stack-sinatra-mongodb-heroku.git freedom-stack
$ cd freedom-stack
$ bundle install
$ ruby app.rb
== Sinatra (v2.1.0) has taken the stage on 4567 for development with backup from Puma
Puma starting in single mode...
* Version 4.3.6 (ruby 2.7.1-p83), codename: Mysterious Traveller
* Min threads: 0, max threads: 16
* Environment: development
* Listening on tcp://127.0.0.1:4567
* Listening on tcp://[::1]:4567
```

## Heroku deployment

To deploy on Heroku you will need a MongoDB Atlas account. After setting everything up,
you will need to create an `.env` file and add your configurations:

```shell
MONGODB_CLUSTER_USER=your-mongodb-user
MONGODB_CLUSTER_PASSWORD=your-secret-password
MONGODB_CLUSTER_URL=your-cluster.zhtt7.mongodb.net/myFirstDatabase?retryWrites=true&w=majority
```

If you need more instructions, see the section [More Details](#more-details) below.

## Development

```shell
$ # do your changes
$ bundle exec ruby app_test.rb
$ # commit to git
```

## Contributing

1. Fork it (https://github.com/yourname/yourproject/fork)
2. Create your feature branch (`git switch -c feature-branch`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Create a new Pull Request in GitHub

## More details

If you need more details about any of the steps, there's a comprehensive step-by-step
tutorial that builds this template from scratch over at [richstone.io](https://richstone.io/p/6205b610-cf12-4cbb-bb92-7f649422b43f/).
