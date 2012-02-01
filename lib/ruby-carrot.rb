require 'faraday'
require 'faraday_middleware'


module RubyCarrot
  class VBCarrot

    API_BASE_URL 			= "https://api.dev.voicebunny.com"
    #API_CLIENT_ID 		= 1
    #API_USER 					= "test@test.com"
    #API_SIGNING_KEY 	= "478c35ec24ff7621c1b2e932d367a41a"

    #Connection object
    @conn = nil
    @api_id = nil
    @api_user = nil
    @api_key = nil

    def initialize(user, id, key)
      @api_id = id
      @api_user = user
      @api_key = key

      setup
    end

    def setup
        @conn = Faraday.new(:url =>("http://"+ @api_id.to_s+":"+@api_key +"@api.dev.voicebunny.com") ) do |builder|
          builder.use Faraday::Request::Multipart
          builder.use Faraday::Request::UrlEncoded
          builder.use Faraday::Response::ParseJson
          builder.use Faraday::Adapter::NetHttp
        end
    end

    def projects

    end

    def balance
      resp = @conn.get '/balance.json'
      puts '/balance/'+@api_id.to_s+'.json'
      return resp
    end


  end
end
