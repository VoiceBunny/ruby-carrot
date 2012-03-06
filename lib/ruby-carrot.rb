# Author::    Jorge Vargas  (mailto:jorge.vargas@voicebunny.com)
# Copyright:: Copyright (c) 2008 Torrenegra IP, LLC.
# License::   Distributes under Creative Commons CC-BY license http://creativecommons.org/licenses/by/3.0/

# This module hace the class that handle the connection
# to the VoiceBunny API

module RubyCarrot
  class VBCarrot

    API_BASE_URL 			= "api.voicebunny.com/"

    #Connection object
    @conn = nil
    @api_id = nil
    @api_user = nil
    @api_key = nil

    # Initializes the carrot and save the account information on class variables
    def initialize(user, id, key)
      @api_id = id
      @api_user = user
      @api_key = key

      setup
    end

    # Setup the connection to the API using Faraday, and saves the connection object in a class variable
    def setup
        @conn = Faraday.new(:url =>("https://"+ @api_id.to_s+":"+@api_key +"@"+API_BASE_URL),:ssl => {:verify => false}) do |builder|
          builder.use Faraday::Request::Multipart
          builder.use Faraday::Request::UrlEncoded
          builder.use Faraday::Response::ParseJson
          builder.use Faraday::Adapter::NetHttp
        end
    end

    # Returns the balance of the user initialized
    def balance
      resp = @conn.get 'balance.json'
      resp.body
    end

    # Returns the projects created by the user initialized
    def all_projects
      resp = @conn.get 'projects.json'
      resp.body
    end

    # Return the project with the specified ID
    def get_project(id)
      resp = @conn.get 'projects/'+id.to_s+'.json'
      resp.body
    end

    # Create a project given a hashtable with the project information
    def create_project(project)
      resp = @conn.post 'projects/add.json', {
          title: project[:title],
          script: project[:script],
          rewardAmount: project[:rewardAmount],
          genderAndAge: project[:genderAndAge],
          language: project[:language],
          lifetime: project[:lifetime],
          ping: project[:ping],
          test: project[:test],
          rewardCurrency: project[:rewardCurrency],
          specialInstructions: project[:specialInstructions]
        }

      resp.body
    end

    # Dispose the project with the specified ID
    def force_dispose(id)
      resp = @conn.get 'projects/forceDispose/'+id.to_s+'.json'
      resp.body
    end

    # Returns the suggested amount of money, of a a project with the given script
    def quote(text, contest=0, maxContestEntries=3)
      resp = @conn.post 'projects/quote.json', {
          script: text,
          contest: contest,
          maxContestEntries: maxContestEntries
      }
      resp.body
    end

    # Returns the read with the specified ID
    def get_read(id)
      resp = @conn.get 'reads/'+id.to_s+'.json'
      resp.body
    end

    # Approve the read with the specified ID
    def approve_read(id)
      resp = @conn.get 'reads/approve/'+id.to_s+'.json'
      resp.body
    end

    # Reject the read with the specified ID
    def reject_read(id)
      resp = @conn.get 'reads/reject/'+id.to_s+'.json'
      resp.body
    end

    # Return a list of all the languages supported by the service
    def languages
      resp = @conn.get 'languages.json'
      resp.body
    end

    # Return a list of all the gender and ages supported by the service
    def gender_ages
      resp = @conn.get 'genderAndAges.json'
      resp.body
    end

  end
end
