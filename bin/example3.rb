# Author::    Jorge Vargas  (mailto:jorge.vargas@voicebunny.com)
# Copyright:: Copyright (c) 2008 Torrenegra IP, LLC.
# License::   Distributed under Creative Commons CC-BY license http://creativecommons.org/licenses/by/3.0/

require 'ruby-carrot-dev'
require 'yaml'
require 'faraday'
require 'faraday_middleware'

vbCarrot = RubyCarrotDev::VBCarrot.new( 0, "xxxxXXXXxxxxXXXX")

wordsToChange = 5
readId = 75
voiceBunnyError = 1
instructions = 'Please correct the 4th word.'

quoteParams = {
    wordsAddedOrChanged: wordsToChange,
    voiceBunnyError: voiceBunnyError

}
quote = vbCarrot.revision_quote(readId, quoteParams)
quote.to_yaml
puts "Posting this revision will cost: "+ quote['quote']['price'].to_s() +" "+ quote['quote']['currency']

revision = {
    wordsAddedOrChanged: wordsToChange,
    voiceBunnyError: voiceBunnyError,
    instructions: instructions
}
response = vbCarrot.revision_add(readId, revision)
if(response.has_key?("error"))
    puts "Something happened:" + response['error']['message'].to_s
else
    puts "Revision successfully posted."
end
