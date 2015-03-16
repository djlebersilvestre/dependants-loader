descendants-loader
============

If you had any trouble trying to find dynamically the classes that implements a base/parent class, maybe this gem could help you.

This is often seen when working with Rails on development/test environment since the eager_load is set to false by default, therefore all the classes are loaded dynamically when requested.

Due to that, when you call something like `MyBaseClass.descendants` or `MyBaseClass.subclasses` it will return an empty array if the descendants/subclasses weren't accessed earlier.

Getting started
---------------

1.  Add descendants-loader to your `Gemfile` and `bundle install`:
```ruby
gem 'descendants-loader'
```

2.  Load the module and use it according to the example bellow:
```ruby
require 'descendants_loader'

class MyBaseClass
  include DescendantsLoader

  ... methods / your implementation ...
end
```

When the module DescendantsLoader is included it overwrites the static methods `Object.descendants` and `Object.subclasses`.
Basically it forces the autoloading of all classes under the same directory (recursivelly) of the base class.
Finally it calls super, returning the expect subclasses.

Continuing with the example (subclasses under the same directory structure of `MyBaseClass`):
```ruby
class SonA < MyBaseClass
  ...
end
class SonB < MyBaseClass
  ...
end
class SonC < MyBaseClass
  ...
end
class GrandSonA < SonA
  ...
end
```

Calling those methods we get the following output:
> MyBaseClass.subclasses
=> [SonA, SonB, SonC]
> MyBaseClass.descendants
=> [SonA, SonB, SonC, GrandSonA]

## Contact

*Code and Bug Reports*

* [Issue Tracker](https://github.com/djlebersilvestre/descendants-loader/issues)

*Questions, Problems, Suggestions, etc.*

* [Github - Daniel Silvestre](https://github.com/djlebersilvestre)

## Contributing

To fetch & test the library for development, do:

```bash
git clone https://github.com/djlebersilvestre/descendants-loader.git
cd descendants-loader
./script/setup_dev_env.sh
```

If you want to contribute, please:

  * Fork the project.
  * Make your feature addition or bug fix.
  * Add tests for it. This is important so I don't break it in a future version unintentionally.
  * **Bonus Points** go out to anyone who also updates `CHANGELOG.md` :)
  * Send me a pull request on Github.

## Running Individual Tests

This project uses Rspec. Individual tests can be run like this:

```bash
bundle exec rspec path/to/test.rb
```

## Copyright

Copyright (c) 2015 Daniel Silvestre. See MIT-LICENSE for details.

## TODOs

* Test compatibility with other ruby versions.
