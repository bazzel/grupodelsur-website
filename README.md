# Grupo del Sur

This repo contains the site for Grupo del Sur.

## Prerequisites

You will need the following things properly installed on your computer:

* [Git](http://git-scm.com/)
* [Ruby](https://www.ruby-lang.org/en/)

## Installation

* `git clone <repository-url>` this repository
* change into the new directory
* `gem install bundler`
* `bundle install`

## Running / Development

* `middleman`
* Visit your app at [http://localhost:4567](http://localhost:4567).

## Deployment to S3

This project uses [Middleman::S3Sync](https://github.com/fredjean/middleman-s3_sync). Consult this extension on usage instructions.

~~~ bash
 $ cp .s3_sync.sample .s3_sync

~~~

* edit the S3 credentials in `.s3_sync`

## And...

* Flag Icons by [GoSquared](http://www.gosquared.com/)
