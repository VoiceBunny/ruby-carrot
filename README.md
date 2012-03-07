# Ruby Carrot - VoiceBunny Library

[Ruby Carrot](https://github.com/Voice123/ruby-carrot) is a Ruby library that provides connection to the [VoiceBunny.com](http://voicebunny.com) HTTP RESTful API, using the library [Faraday](https://github.com/technoweenie/faraday) for the HTTP request/response cycle.
If you need more information on how to use our library check the [installation guide](https://github.com/Voice123/ruby-carrot/wiki/installation) or the [tutorial](https://github.com/Voice123/ruby-carrot/wiki/Use-tutorial).

### Usage

```ruby
# Initialize the library
vb_carrot = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")

# Get information
response = vb_carrot.languages
response.to_yaml
puts response['languages']

# Post project
project = {
    script: "Test project",
    specialInstructions: "Posted from Ruby-Carrot"
}
response = vb_carrot.create_project(project)
response.to_yaml
puts response['project']

# Get a project
response = vb_carrot.get_project(1)
response.to_yaml
puts response['projects']
```

### Request a VoiceBunny API Key
To use this library you need to request an API Key in the [VoiceBunny.com Developer's Section](http://voicebunny.com/developers/token).

### Don't you like Ruby?
If you're not confortable with Ruby language, you can also check our other libraries:

* [Python Carrot](https://github.com/Voice123/python-carrot)
* Groovy Carrot (Coming Soon)

Or why not, build your own library from scratch checking the [API documentation](http://voicebunny.com/developers/index).

### Copyright

Copyright (c) 2008 Torrenegra IP, LLC. Distributed under Creative Commons [CC-BY license](http://creativecommons.org/licenses/by/3.0/).