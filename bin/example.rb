# Author::    Jorge Vargas  (mailto:jorge.vargas@voicebunny.com)
# Copyright:: Copyright (c) 2008 Torrenegra IP, LLC.
# License::   Distributed under Creative Commons CC-BY license http://creativecommons.org/licenses/by/3.0/

require 'ruby-carrot-dev'
require 'yaml'
require 'faraday'
require 'faraday_middleware'

vb_carrot = RubyCarrot::VBCarrot.new("XXX", 0, "XXX",0)
balance = vb_carrot.balance
balance.to_yaml
puts "Your account balance is: "+ balance['balance']['amount'] +" "+ balance['balance']['currency']
current_balance = balance['balance']['amount'].to_i

script = "What's up , folks?"
quote = vb_carrot.quote(script)
quote.to_yaml
puts "Posting this script will cost: "+ quote['quote']['rewardAmount'] +" "+ quote['quote']['rewardCurrency']
reward = quote['quote']['rewardAmount'].to_i

if(current_balance >= reward)
    project = {
        script: script,
        specialInstructions: "I want the voice be similar to Bugs Bunny.",
        rewardAmount:reward,
        rewardCurrency: 'usd',
        test: '1'
    }
    vb_carrot.create_project(project)
    puts "Project successfully posted."
else
    puts "You dont have enough money to post this project."
end