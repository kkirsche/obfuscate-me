[![Test Coverage](https://codeclimate.com/github/kkirsche/obfuscate-my/badges/coverage.svg)](https://codeclimate.com/github/kkirsche/obfuscate-my)

# Obfuscate My…

Welcome to Obfuscate My…! With this gem, we hope to allow you to work with sensitive information such as credit cards, social security numbers, and more within your code without worrying about accidently exposing your actual information. Want to create one public and one private version of a website for a client? Obfuscate My… can help! Just obfuscate your data in the public version and voila, your data is hidden from viewers! 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'obfuscate_my'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install obfuscate_my

## Usage

Currently, this is a library to be integrated into your own projects. In the future, this will hopefully gain support for git, directories, and more to allow you to hide sensitive information in any context you may need.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/obfuscate_my/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
