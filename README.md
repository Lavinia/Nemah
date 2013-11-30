# Nemah [![Build Status](https://secure.travis-ci.org/Lavinia/Nemah.png)](http://travis-ci.org/Lavinia/Nemah) [![Code Climate](https://codeclimate.com/github/Lavinia/Nemah.png)](https://codeclimate.com/github/Lavinia/Nemah)

Nemah is a library for calculating the proper amount of fodder for your horse. In real life, Nemah is an [Arabian horse](http://en.wikipedia.org/wiki/Arabian_horse) with an immense appetite.

## Requirements

Given that Nemah is an Arabian princess, she wants as many rubies as possible, but no fewer than 2.0.

## Installation.

Add this line to your application's Gemfile:

    gem 'nemah'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nemah

## Usage

### Initial version

* Calculate a horse's need of nutrients.
* Calculations are made internally with at least three digits precision. Public methods will return values rounded to two decimals by default.

### Yet to be implemented

* Fodder
* Rations
* Given a horse, its needs, and a list of fodder, calculate suitable rations.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
