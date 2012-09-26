# Author::    Jorge Vargas  (mailto:jorge.vargas@voicebunny.com)
# Copyright:: Copyright (c) 2008 Torrenegra IP, LLC.
# License::   Distributed under Creative Commons CC-BY license http://creativecommons.org/licenses/by/3.0/

require 'ruby-carrot-dev'
require 'yaml'
require 'faraday'
require 'faraday_middleware'

vbCarrot = RubyCarrotDev::VBCarrot.new( 0, "xxxxXXXXxxxxXXXX")

balance = vbCarrot.balance
balance.to_yaml
puts "Your account balance is: "+ balance['balance']['amount'] +" "+ balance['balance']['currency']
current_balance = balance['balance']['amount'].to_f

title = "My test project"
script = {:part001=>"What's up, folks?", :part002=>"What's up, doc?"}
language = 'eng-us'
quoteParams = {
    language: language,
    script: script
}
quote = vbCarrot.quote(quoteParams)
quote.to_yaml
puts "Posting this project will cost: "+ quote['quote']['price'].to_s() +" "+ quote['quote']['currency']
reward = quote['quote']['price'].to_f

if(current_balance >= reward)
    project = {
        title: title,
        script: script.to_json,
        remarks: "I want the voice be similar to Bugs Bunny.",
        price:reward,
        rewardCurrency: 'usd'
    }
    response = vbCarrot.create_project(project)
    if(response.has_key?("error"))
        puts "Something happened: " + response['error']['message'].to_s
    else
        puts "Project successfully posted."
    end
    
else
    puts "You dont have enough money to post this project."
end