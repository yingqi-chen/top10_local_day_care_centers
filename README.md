# Top10LocalDayCareCenters

It is created to present the top 10 local day care centers according to user input.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'top10_local_day_care_centers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install top10_local_day_care_centers

## Usage

You will be asked for a zip code first, and then get a list of top 10 rated day care centers back, where you can input a number of a specific center and thus get more information from it.
But to use it, you have to get your own yelp API, you can get it from: https://www.yelp.com/fusion
Once you get it, try to create a file called `.env` the same level as the directory `bin` and `lib`. And then put "API_KEY=YOUR_API_KEY"  in the `.env` document, then it should be ok to run!

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chanwkkk/top10_local_day_care_centers.git.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
