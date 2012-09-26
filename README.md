# Ruby Carrot - VoiceBunny Library

[Ruby Carrot](https://github.com/VoiceBunny/ruby-carrot) is a Ruby library that provides connection to the [VoiceBunny.com](http://voicebunny.com) HTTP RESTful API, using the library [Faraday](https://github.com/technoweenie/faraday) for the HTTP request/response cycle.
If you need more information on how to use our library check the [installation guide](https://github.com/VoiceBunny/ruby-carrot/wiki/installation) or the [tutorial](https://github.com/VoiceBunny/ruby-carrot/wiki/Use-tutorial).

## Usage

```ruby
# Imports
require 'ruby-carrot'
require 'yaml'
require 'faraday'
require 'faraday_middleware'

# Initialize the library
vbCarrot = RubyCarrot::VBCarrot.new(0, "XXX")

# Get information
response = vbCarrot.languages
response.to_yaml
puts response['languages']

# Post project
project = {
    script: "Test project",
    remarks: "Posted from Ruby-Carrot",
    title: "Test Project"
}
response = vbCarrot.create_project(project)
response.to_yaml
puts response['project']

# Get a project
response = vbCarrot.get_project(response['project']['id'])
response.to_yaml
puts response['projects']
```

## Request a VoiceBunny API Token
To use this library you need to request an API Token in the [VoiceBunny.com Developer's Section](http://voicebunny.com/developers/token).

## TODO

* migrate the tests to Stubs instead of text files mocked JSON responses
* update the tests

## Contributing

Feel free to fork our gem or add a pull request

## Don't you like Ruby?
If you're not confortable with Ruby language, you can also check our other libraries:

* [Python Carrot](https://github.com/VoiceBunny/python-carrot)
* [Groovy Carrot](https://github.com/VoiceBunny/groovy-carrot)
* [PHP Carrot](https://github.com/VoiceBunny/php-carrot)

Or why not, build your own library from scratch checking the [API documentation](http://voicebunny.com/developers/index).

## Copyright

Copyright (c) 2008 Torrenegra IP, LLC. Distributed under Creative Commons [CC-BY license](http://creativecommons.org/licenses/by/3.0/).