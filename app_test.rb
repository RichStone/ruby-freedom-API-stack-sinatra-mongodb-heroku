ENV['APP_ENV'] = 'test'

require './app.rb'
# Test setup.
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
# Database stuff.
require 'mongoid'
project_root = File.dirname(__FILE__)
Mongoid.load!(File.join(project_root, 'mongoid.yml'))

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def teardown
    Mongoid.purge!
  end

  def test_gandhi_about_freedom
    get '/freedom'
    assert last_response.ok?
    assert_match /freedom(.*)Gandhi/, last_response.body
  end

  def test_returns_empty_array_when_no_quotes
    get '/freedom_quotes'
    assert last_response.ok?
    assert_equal '[]', last_response.body
  end

  def test_post_new_freedom_quote
    get 'freedom_quotes'
    assert_equal 0, JSON.parse(last_response.body).count

    quote = 'In Freedom we trust.'
    post '/freedom_quotes', { quote: quote }
    assert last_response.ok?

    get 'freedom_quotes'
    assert_equal 1, JSON.parse(last_response.body).count
    assert_equal quote, JSON.parse(last_response.body).first['quote']
  end

  def test_patch_changes_quote_text
    quote = 'There\'s nothing as cool as Freedom.'
    post '/freedom_quotes', { quote: quote }
    quote_id = JSON.parse(last_response.body)['_id']['$oid']

    new_quote = 'New Freedom is always new.'
    patch "/freedom_quotes/#{quote_id}", { quote: new_quote }
    assert last_response.ok?
    assert_equal 'true', last_response.body
    assert_equal 1, FreedomQuote.count
    assert_equal new_quote, FreedomQuote.first['quote']
  end

  def test_delete_removes_individual_quote
    post '/freedom_quotes', { quote: 'I am running out of freedom quotes.' }
    quote_id_1 = JSON.parse(last_response.body)['_id']['$oid']
    post '/freedom_quotes', { quote: 'Another freedom quote here.' }
    quote_id_2 = JSON.parse(last_response.body)['_id']['$oid']

    delete "/freedom_quotes/#{quote_id_2}"
    assert last_response.ok?
    assert_equal 'true', last_response.body
    assert_raises Mongoid::Errors::DocumentNotFound do
      FreedomQuote.find(quote_id_2)
    end
    assert FreedomQuote.find(quote_id_1)
  end
end
