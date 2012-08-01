# Author::    Jorge Vargas  (mailto:jorge.vargas@voicebunny.com)
# Copyright:: Copyright (c) 2008 Torrenegra IP, LLC.
# License::   Distributed under Creative Commons CC-BY license http://creativecommons.org/licenses/by/3.0/

Gem::Specification.new do |s|
 s.name        = 'ruby-carrot'
  s.version     = '0.7'
  s.date        = '2012-08-01'
  s.summary     = "VoiceBunny carrot library"
  s.description = "VoiceBunny library for accessing API using Ruby."
  s.authors     = ["Jorge Vargas", "Mr. VoiceBunny"]
  s.email       = 'api@voicebunny.com'
  s.files       = ["lib/ruby-carrot.rb"]
  s.homepage    =
    'http://voicebunny.com/developers/libraries'
  s.add_dependency('faraday', '>= 0.7.6')
  s.add_dependency('faraday_middleware', '>= 0.8.4')
  s.add_development_dependency('test/unit', '>= 2.4.5')
end