require 'json'
require 'faraday'
require 'faraday_middleware'

module VB_api_client

  API_BASE_URL 			= "http://api.dev.voicebunny.com"
	API_CLIENT_ID 		= 1
	API_USER 					= "test@test.com"
	API_SIGNING_KEY 	= "478c35ec24ff7621c1b2e932d367a41a"

  #Connection object
  @conn = nil
  @api_id = nil
  @api_user = nil
  @api_key = nil

  def initialize(user, id, key)
    @api_id = id
    @api_user = user
    @api_key = key
  end

  def setup

  end


end
