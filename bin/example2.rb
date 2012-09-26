# Author::    Jorge Vargas  (mailto:jorge.vargas@voicebunny.com)
# Copyright:: Copyright (c) 2008 Torrenegra IP, LLC.
# License::   Distributed under Creative Commons CC-BY license http://creativecommons.org/licenses/by/3.0/

require 'ruby-carrot-dev'
require 'yaml'
require 'faraday'
require 'faraday_middleware'

vbCarrot = RubyCarrotDev::VBCarrot.new( 0, "xxxxXXXXxxxxXXXX")

title = "My test project"
script = {:part001=>"What's up, folks?", :part002=>"What's up, doc?"}
language = 'eng-us'
talentId = 6
quoteParams = {
    language: language,
    script: script,
    fulfilmentType: 'booking',
    talentID: talentId

}
quote = vbCarrot.quote(quoteParams)
quote.to_yaml
puts "Posting this booking post will cost: "+ quote['quote']['price'].to_s() +" "+ quote['quote']['currency']
reward = quote['quote']['price'].to_f

project = {
    title: title,
    script: script.to_json,
    remarks: "I want the voice be similar to Bugs Bunny.",
    rewardCurrency: 'usd',
    talentID: talentId
}
response = vbCarrot.create_booking_project(project)
if(response.has_key?("error"))
    puts "Something happened: " + response['error']['message'].to_s
else
    puts "Project successfully posted."
end
