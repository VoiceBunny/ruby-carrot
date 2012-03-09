# Ruby Carrot - VoiceBunny Library

[Ruby Carrot](https://github.com/VoiceBunny/ruby-carrot) is a Ruby library that provides connection to the [VoiceBunny.com](http://voicebunny.com) HTTP RESTful API, using the library [Faraday](https://github.com/technoweenie/faraday) for the HTTP request/response cycle.
If you need more information on how to use our library check the [installation guide](https://github.com/VoiceBunny/ruby-carrot/wiki/installation) or the [tutorial](https://github.com/VoiceBunny/ruby-carrot/wiki/Use-tutorial).

### Usage

```ruby
# Imports
require 'ruby-carrot-dev'
require 'yaml'
require 'faraday'
require 'faraday_middleware'

# Initialize the library
vb_carrot = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")

# Get information
response = vb_carrot.languages
response.to_yaml
puts response['languages']

# Post project
project = {
    script: "Test project",
    specialInstructions: "Posted from Ruby-Carrot",
    title: "Test Project"
}
response = vb_carrot.create_project(project)
response.to_yaml
puts response['project']

# Get a project
response = vb_carrot.get_project(response['project']['id'])
response.to_yaml
puts response['projects']
```

### Request a VoiceBunny API Token
To use this library you need to request an API Token in the [VoiceBunny.com Developer's Section](http://voicebunny.com/developers/token).

### Don't you like Ruby?
If you're not confortable with Ruby language, you can also check our other libraries:

<<<<<<< HEAD
* [Python Carrot](https://github.com/VoiceBunny/python-carrot)
* [Groovy Carrot](https://github.com/VoiceBunny/groovy-carrot)
=======
* Groovy Carrot (Coming Soon)
* [PHP Carrot](https://github.com/VoiceBunny/php-carrot)
* [Python Carrot](https://github.com/VoiceBunny/python-carrot)
>>>>>>> 129fe154bb937a7236c342401cf5a4ac376d2ded

Or why not, build your own library from scratch checking the [API documentation](http://voicebunny.com/developers/index).

### Copyright

Copyright (c) 2008 Torrenegra IP, LLC. Distributed under Creative Commons [CC-BY license](http://creativecommons.org/licenses/by/3.0/).