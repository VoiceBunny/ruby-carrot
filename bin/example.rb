# Author::    Jorge Vargas  (mailto:jorge.vargas@voicebunny.com)
# Copyright:: Copyright (c) 2008 Torrenegra IP, LLC.
# License::   Distributed under Creative Commons CC-BY license http://creativecommons.org/licenses/by/3.0/

require 'ruby-carrot-dev'
require 'yaml'
require 'faraday'
require 'faraday_middleware'

vb_carrot = RubyCarrotDev::VBCarrot.new("xx", 0, "xxxxXXXXxxxxXXXX")
balance = vb_carrot.balance
balance.to_yaml
puts "Your account balance is: "+ balance['balance']['amount'] +" "+ balance['balance']['currency']
current_balance = balance['balance']['amount'].to_f

title = "My test project"
script = {:part001=>"What's up, folks?", :part002=>"What's up, doc?"}
language = 'eng-us'
quote = vb_carrot.quote(language, script)
quote.to_yaml
puts "Posting this script will cost: "+ quote['quote']['price'].to_s() +" "+ quote['quote']['currency']
reward = quote['quote']['price'].to_f

if(current_balance >= reward)
    project = {
        title: title,
        script: script.to_json,
        remarks: "I want the voice be similar to Bugs Bunny.",
        price:reward,
        rewardCurrency: 'usd'
    }
    response = vb_carrot.create_project(project)
    if(response.has_key?("error"))
        puts "Something happened when attempting to post the project."
    else
        puts "Project successfully posted."
    end
    
else
    puts "You dont have enough money to post this project."
end