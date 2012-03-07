# Author::    Jorge Vargas  (mailto:jorge.vargas@voicebunny.com)
# Copyright:: Copyright (c) 2008 Torrenegra IP, LLC.
# License::   Distributed under Creative Commons CC-BY license http://creativecommons.org/licenses/by/3.0/

require 'ruby-carrot-dev'
require 'yaml'
require 'faraday'
require 'faraday_middleware'
require 'test/unit'

class CarrotTest  < Test::Unit::TestCase

  @lib = nil

  def test_balance
      @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
      response = @lib.balance
      response.to_yaml
      assert_equal("1000.98",  response['balance']['amount'])
      assert_equal('usd',  response['balance']['currency'])

  end

  def test_all_projects
    @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
    response = @lib.all_projects
    response.to_yaml
    assert_equal('2', response['projects'][1]['id'])
    assert_equal('eng-us', response['projects'][1]['language'])
    assert_equal('usd', response['projects'][1]['rewardCurrency'])
  end

  def test_get_project
    @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
    response = @lib.get_project(1)
    response.to_yaml
    assert_equal('1', response['projects'][0]['id'] )
    assert_equal('eng-us', response['projects'][0]['language'] )
    assert_equal('usd', response['projects'][0]['rewardCurrency'])
  end

  def test_create_project
   @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)

    project = Hash.new
    project[:title] = 'My Test Project'
    project[:script] = 'Hello world.'
    project[:rewardAmount] = '9.81'
    project[:genderAndAge] = 'middleAgeMale'
    project[:language] = 'eng-us'
    project[:lifetime] = '1'
    project[:rewardCurrency] = 'usd'
    project[:specialInstructions] = 'Special instructions'

    response = @lib.create_project(project)
    response.to_yaml
    assert_equal('2', response['project']['id'])
    assert_equal('eng-us',  response['project']['language'])
    assert_equal('usd',response['project']['rewardCurrency'])

  end

  def test_get_project
    @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
    response = @lib.get_project(1)
    response.to_yaml
    assert_equal('1', response['projects'][0]['id'])
    assert_equal('eng-us',  response['projects'][0]['language'])
    assert_equal('usd', response['projects'][0]['rewardCurrency'])
  end

  def test_force_dispose
    @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
    response = @lib.force_dispose(1)
    response.to_yaml
    assert_equal('1', response['projects'][0]['id'])
    assert_equal('eng-us',  response['projects'][0]['language'])
    assert_equal('usd', response['projects'][0]['rewardCurrency'])
  end

  def test_quote
    @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
    response = @lib.quote(" ")
    response.to_yaml
    assert_equal('0', response['quote']['rewardAmount'])
    assert_equal('usd', response['quote']['rewardCurrency'])
  end

  def test_get_read
    @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
    response = @lib.get_read(1)
    response.to_yaml
    assert_equal('1', response['reads'][0]['id'])
    assert_equal('0',  response['reads'][0]['user'])
    assert_equal('2', response['reads'][0]['project'])
  end

  def test_approve_read
    @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
    response = @lib.approve_read(1)
    response.to_yaml
    assert_equal('1', response['reads'][0]['id'])
    assert_equal('0',  response['reads'][0]['user'])
    assert_equal('2', response['reads'][0]['project'])
  end

  def test_reject_read
    @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
    response = @lib.reject_read(1)
    response.to_yaml
    assert_equal('1', response['reads'][0]['id'])
    assert_equal('0',  response['reads'][0]['user'])
    assert_equal('2', response['reads'][0]['project'])
  end

  def test_languages
    @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
    response = @lib.languages()
    response.to_yaml
    assert_equal('ara', response['languages'][0]['id'])
    assert_equal('ben', response['languages'][1]['id'])
    assert_equal('bos-ba', response['languages'][2]['id'])
  end

  def test_gender_ages
    @lib = RubyCarrotDev::VBCarrot.new("XXX", 0, "XXX", 2)
    response = @lib.gender_ages()
    response.to_yaml
    assert_equal('baby', response['genderandages'][0]['code'])
    assert_equal('child', response['genderandages'][1]['code'])
    assert_equal('teenageGirl', response['genderandages'][2]['code'])
  end



end
