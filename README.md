# Shiyo
[![johnny-miyake](https://circleci.com/gh/johnny-miyake/shiyo.svg?style=svg)](https://github.com/johnny-miyake/shiyo)

Shiyo is a minimal framework that supports writing your business rules using the [Specification pattern](https://en.wikipedia.org/wiki/Specification_pattern).
It enables to build composite specifications by method chaining like;
```ruby
spec1.and(spec2.or(spec3)).satisfied_by?(candidate)
```

[API documentation](https://www.rubydoc.info/gems/shiyo)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "shiyo"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shiyo

## Usage
You can create your own Shiyo specification as following steps;
1. Include `Shiyo::Specification` module into your class.
2. Implement `#satisfied_by?`.
3. (optional) Implement `#initialize` if needed.

For example;
```ruby
# A specification class
class ContainerFeatureSpec
  include Shiyo::Specification

  TYPE = { armored: "armored", ventilated: "ventilated" }.freeze

  def initialize container_feature
    @container_feature = TYPE.fetch(container_feature)
  end

  def satisfied_by? container
    container.feature.to_s == @container_feature
  end
end

# Another specification class
class ContainerUsedSpec
  include Shiyo::Specification

  def initialize used:
    @used = used
  end

  def satisfied_by? container
    container.used? == @used
  end
end

# The class of the candidate object
class Container
  attr_reader :feature

  def initialize feature, used: false
    @feature = feature
    @used = !!used
  end

  def used?
    @used
  end
end

# containers
brand_new_armored_container = Container.new(:armored, used: false)
used_ventilated_container = Container.new(:ventilated, used: true)
used_cheep_container = Container.new(:cheep, used: true)

# simple specifications
armored_spec = ContainerFeatureSpec.new(:armored)
ventilated_spec = ContainerFeatureSpec.new(:ventilated)
used_spec = ContainerUsedSpec.new(used: true)
brand_new_spec = ContainerUsedSpec.new(used: false)

armored_spec.satisfied_by?(brand_new_armored_container)
#=> true
armored_spec.satisfied_by?(used_ventilated_container)
#=> false
used_spec.satisfied_by?(used_ventilated_container)
#=> true

# composite specifications
used_ventilated_spec = ventilated_spec.and(used_spec)
brand_new_ventilated_spec = ventilated_spec.and(brand_new_spec)
cheep_spec = Shiyo::Not(armored_spec.or(ventilated_spec))

used_ventilated_spec.satisfied_by?(used_ventilated_container)
#=> true
brand_new_ventilated_spec.satisfied_by?(used_ventilated_container)
#=> false
cheep_spec.satisfied_by?(used_cheep_container)
#=> true
armored_spec.satisfied_by?(used_cheep_container)
#=> false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johnny-miyake/shiyo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/johnny-miyake/shiyo/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Shiyo project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/johnny-miyake/shiyo/blob/master/CODE_OF_CONDUCT.md).
