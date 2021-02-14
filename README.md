Support for Postgres Interval Types for ActiveRecord. Currently in [Prerelease](#prerelease)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ar_interval'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ar_interval

## Usage

### Standalone ActiveRecord

```ruby
require 'ar_interval'

class Occurence < ActiveRecord::Base
  attribute :column_name, :interval
end
```

#### Invalid Format as a Validation error

```ruby
require 'ar_interval'

class Occurence < ActiveRecord::Base
  include ArInterval::Validations

  attribute :column_name, :interval
end
```

### Rails

TODO

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cpb/ar_interval.

## Roadmap

### 1.0

- Default behaviour for Postgres Databases
```ruby
create_table :table_name do |t|
  t.interval :column_name
end
```

### Prerelease

- Manually registered `ActiveRecord::Type`
- Optional `ActiveSupport::Concern` providing format validations for `:interval` fields

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
