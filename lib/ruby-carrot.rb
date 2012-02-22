
module RubyCarrot
  class VBCarrot

    API_BASE_URL 			= "api.dev.voicebunny.com/"
    API_DEV_URL 			= "http://127.0.0.1:8080/test/"

    #Connection object
    @conn = nil
    @api_id = nil
    @api_user = nil
    @api_key = nil

    def initialize(user, id, key, dev=false)
      @api_id = id
      @api_user = user
      @api_key = key

      if(dev)
        setup_dev
      else
        setup
      end
    end

    def setup
        @conn = Faraday.new(:url =>("https://"+ @api_id.to_s+":"+@api_key +"@"+API_BASE_URL),:ssl => {:verify => false}) do |builder|
          builder.use Faraday::Request::Multipart
          builder.use Faraday::Request::UrlEncoded
          builder.use Faraday::Response::ParseJson
          builder.use Faraday::Adapter::NetHttp
        end
    end

    def setup_dev
      @conn = Faraday.new(:url =>(API_DEV_URL)) do |builder|
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

    def force_dispose(id)
      resp = @conn.get 'projects/forceDispose/'+id.to_s+'.json'
      resp.body
    end

    def quote(text)
      resp = @conn.post 'projects/quote.json', {
          script: text
      }
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
