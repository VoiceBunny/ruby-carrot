# Author::    Jorge Vargas  (mailto:jorge.vargas@voicebunny.com)
# Copyright:: Copyright (c) 2008 Torrenegra IP, LLC.
# License::   Distributed under Creative Commons CC-BY license http://creativecommons.org/licenses/by/3.0/

require 'ruby-carrot'
require 'yaml'
require 'faraday'
require 'faraday_middleware'
require 'test/unit'

class CarrotTest  < Test::Unit::TestCase

  @lib = nil

  def test_balance
      @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
      response = @lib.balance
      response.to_yaml
      assert_equal("1000.98",  response['balance']['amount'])
      assert_equal('usd',  response['balance']['currency'])

  end

  def test_all_projects
    @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
    response = @lib.all_projects
    response.to_yaml
    puts response
    assert_equal('2', response['projects'][1]['id'])
    assert_equal('eng-us', response['projects'][1]['language'])
    assert_equal('usd', response['projects'][1]['currency'])
  end

  def test_get_project
    @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
    response = @lib.get_project(1)
    response.to_yaml
    assert_equal('1', response['projects'][0]['id'] )
    assert_equal('eng-us', response['projects'][0]['language'] )
    assert_equal('usd', response['projects'][0]['currency'])
  end

  def test_create_project
   @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")

    project = Hash.new
    project[:title] = 'My Test Project'
    project[:script] = 'Hello world.'
    project[:price] = '9.81'
    project[:genderAndAge] = 'middleAgeMale'
    project[:language] = 'eng-us'
    project[:lifetime] = '1'
    project[:currency] = 'usd'
    project[:remarks] = 'Special instructions'

    response = @lib.create_project(project)
    response.to_yaml
    assert_equal('2', response['project']['id'])
    assert_equal('eng-us',  response['project']['language'])
    assert_equal('usd',response['project']['currency'])

  end

  def test_get_project
    @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
    response = @lib.get_project(1)
    response.to_yaml
    assert_equal('1', response['projects'][0]['id'])
    assert_equal('eng-us',  response['projects'][0]['language'])
    assert_equal('usd', response['projects'][0]['currency'])
  end

  def test_force_dispose
    @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
    response = @lib.force_dispose(1)
    response.to_yaml
    assert_equal('1', response['projects'][0]['id'])
    assert_equal('eng-us',  response['projects'][0]['language'])
    assert_equal('usd', response['projects'][0]['currency'])
  end

  def test_quote
    @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
    response = @lib.quote(" ")
    response.to_yaml
    assert_equal('0', response['quote']['price'])
    assert_equal('usd', response['quote']['currency'])
  end

  def test_get_read
    @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
    response = @lib.get_read(1)
    response.to_yaml
    assert_equal('1', response['reads'][0]['id'])
    assert_equal('0',  response['reads'][0]['user'])
    assert_equal('2', response['reads'][0]['project'])
  end

  def test_approve_read
    @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
    response = @lib.approve_read(1)
    response.to_yaml
    assert_equal('1', response['reads'][0]['id'])
    assert_equal('0',  response['reads'][0]['user'])
    assert_equal('2', response['reads'][0]['project'])
  end

  def test_reject_read
    @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
    response = @lib.reject_read(1)
    response.to_yaml
    assert_equal('1', response['reads'][0]['id'])
    assert_equal('0',  response['reads'][0]['user'])
    assert_equal('2', response['reads'][0]['project'])
  end

  def test_languages
    @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
    response = @lib.languages()
    response.to_yaml
    assert_equal('ara', response['languages'][0]['id'])
    assert_equal('ben', response['languages'][1]['id'])
    assert_equal('bos-ba', response['languages'][2]['id'])
  end

  def test_gender_ages
    @lib = RubyCarrot::VBCarrot.new("XXX", 0, "XXX")
    response = @lib.gender_ages()
    response.to_yaml
    assert_equal('baby', response['genderandages'][0]['code'])
    assert_equal('child', response['genderandages'][1]['code'])
    assert_equal('teenageGirl', response['genderandages'][2]['code'])
  end



end
