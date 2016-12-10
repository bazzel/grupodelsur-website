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
* `bundle install --binstubs`
* `cp .env.example .env`
* Get a proper Content Delivery API key

## Get content
* `bin/middleman contentful`

## Running / Development

* `bin/middleman`
* Visit your app at [http://localhost:4567](http://localhost:4567).

## Deployment to S3

This project uses [Middleman::S3Sync](https://github.com/fredjean/middleman-s3_sync). Consult this extension on usage instructions.

~~~ bash
 $ cp .s3_sync.sample .s3_sync

~~~

* edit the S3 credentials in `.s3_sync`

## And...

* Flag Icons by [GoSquared](http://www.gosquared.com/)
* Social media icons downloaded from [Flaticon](http://www.flaticon.com/)
* [Justified Gallery](http://miromannino.github.io/Justified-Gallery/)
* [PhotoSwipe](http://photoswipe.com/)
* [Waves](http://fian.my.id/Waves/)
* [gmaps.js](hpneo.github.io/gmaps)
