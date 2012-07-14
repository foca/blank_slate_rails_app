Blank Slate app
===============

This app contains just the minimum configuration needed to start coding right
away on the things that matter. And it's easier to maintain than a rails
template.

I use this app with [this script][script] to create new Rails applications.

[script]: https://gist.github.com/3063978

Setup
-----

In order to bootstrap this application, run the following commands from the
application directory:

    $ gem install foreman
    $ bundle
    $ cp .env.sample .env; $EDITOR .env # Configure anything you need.
    $ foreman run rake db:setup
    $ foreman run rake

To boot the application:

    $ foreman start

To run tests:

    $ foreman run rake

We use [PhantomJS](phantom) for our integration tests. Make sure you have it
installed.

[phantom]: http://phantomjs.org

Copyright (c) 2012 Nicolás Sanguinetti (http://nicolassanguinetti.info)
