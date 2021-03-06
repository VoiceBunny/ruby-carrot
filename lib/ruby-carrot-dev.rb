# Author::    Jorge Vargas  (mailto:jorge.vargas@voicebunny.com)
# Copyright:: Copyright (c) 2008 Torrenegra IP, LLC.
# License::   Distributed under Creative Commons CC-BY license http://creativecommons.org/licenses/by/3.0/

# This module have the class that handle the connection
# to the VoiceBunny API

module RubyCarrotDev
  class VBCarrot

    API_LOCAL_URL     = "api.local.voicebunny.com/"
    API_TEST_URL 			= "http://127.0.0.1:8080/test/"

    #Connection object
    @conn = nil
    @api_id = nil
    @api_key = nil

    def initialize(id, key, url=0)
      @api_id = id
      @api_key = key

      if(url==0)
        setup_local
      else
        setup_test
      end
    end

    def setup_test
      @conn = Faraday.new(:url =>(API_TEST_URL)) do |builder|
          builder.use Faraday::Request::Multipart
          builder.use Faraday::Request::UrlEncoded
          builder.use Faraday::Response::ParseJson
          builder.use Faraday::Adapter::NetHttp
      end
    end

    def setup_local
      @conn = Faraday.new(:url =>("https://"+ @api_id.to_s+":"+@api_key +"@"+API_LOCAL_URL),:ssl => {:verify => false}) do |builder|
          builder.use Faraday::Request::Multipart
          builder.use Faraday::Request::UrlEncoded
          builder.use Faraday::Response::ParseJson
          builder.use Faraday::Adapter::NetHttp
        end
    end

    def balance
      resp = @conn.get 'balance.json'
      resp.body
    end

    def all_projects
      resp = @conn.get 'projects.json'
      resp.body
    end

    def get_project(id)
      resp = @conn.get 'projects/'+id.to_s+'.json'
      resp.body
    end

    def create_project(project)
      resp = @conn.post 'projects/addSpeedy.json', {
          title: project[:title],
          script: project[:script],
          price: project[:price],
          genderAndAge: project[:genderAndAge],
          language: project[:language],
          lifetime: project[:lifetime],
          ping: project[:ping],
          test: project[:test],
          currency: project[:currency],
          remarks: project[:remarks],
          timedRecording: project[:timedRecording]
        }

      resp.body
    end

    def create_booking_project(project)
      resp = @conn.post 'projects/addBooking.json', {
          title: project[:title],
          script: project[:script],
          talentID: project[:talentID],
          genderAndAge: project[:genderAndAge],
          language: project[:language],
          lifetime: project[:lifetime],
          ping: project[:ping],
          test: project[:test],
          currency: project[:currency],
          remarks: project[:remarks],
          timedRecording: project[:timedRecording]
        }

      resp.body
    end

    def force_dispose(id)
      resp = @conn.get 'projects/forceDispose/'+id.to_s+'.json'
      resp.body
    end

    def quote(params)
      data = Hash.new
      data[:language] = params[:language]
      data[:fulfilmentType] = params[:fulfilmentType]
      data[:maxEntries] = params[:maxEntries]
      data[:talentID] = params[:talentID]
      if params.has_key?('numberOfCharacters')
        data[:numberOfCharacters] = params[:numberOfCharacters]
      elsif params.has_key?('numberOfWords')
        data[:numberOfWords] = params[:numberOfWords]
      else
        data[:script] = params[:script]
      end
      resp = @conn.post 'projects/quote.json', data
      resp.body
    end

    def get_read(id)
      resp = @conn.get 'reads/'+id.to_s+'.json'
      resp.body
    end

    def approve_read(id)
      resp = @conn.get 'reads/approve/'+id.to_s+'.json'
      resp.body
    end

    def reject_read(id)
      resp = @conn.get 'reads/reject/'+id.to_s+'.json'
      resp.body
    end

    def revision_quote(readId, params)
      data = Hash.new
      data[:voiceBunnyError] = params[:voiceBunnyError]
      if params.has_key?('charactersAddedOrChanged')
        data[:charactersAddedOrChanged] = params[:charactersAddedOrChanged]
      else
        data[:wordsAddedOrChanged] = params[:wordsAddedOrChanged]
      end
      resp = @conn.get 'reads/'+readId.to_s+'/revision/quote.json', data
      resp.body
    end

    def revision_add(readId, params)
      data = Hash.new
      data[:ping] = params[:ping]
      data[:instructions] = params[:instructions]
      data[:voiceBunnyError] = params[:voiceBunnyError]
      if params.has_key?('charactersAddedOrChanged')
        data[:charactersAddedOrChanged] = params[:charactersAddedOrChanged]
      else
        data[:wordsAddedOrChanged] = params[:wordsAddedOrChanged]
      end
      resp = @conn.get 'reads/'+readId.to_s+'/revision/add.json', data
      resp.body
    end

    def languages
      resp = @conn.get 'languages.json'
      resp.body
    end

    def gender_ages
      resp = @conn.get 'genderAndAges.json'
      resp.body
    end

  end
end
