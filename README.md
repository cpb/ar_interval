[A more complete solution exists in Rails 6.1](https://github.com/rails/rails/commit/e5a5cc483573f41fa396779057bd83ce389640d8#diff-353f4f101b1bb04938d761b6e29c88e0f147084e9e276854a77ae5d9a9a3b2a8R30)

-----

Support for Postgres Interval Types for ActiveRecord 5.2.

Currently in [Prerelease](#prerelease)

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

[See, Rails 6.1](https://github.com/rails/rails/commit/e5a5cc483573f41fa396779057bd83ce389640d8#diff-353f4f101b1bb04938d761b6e29c88e0f147084e9e276854a77ae5d9a9a3b2a8R30)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
