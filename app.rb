# app.rb

require 'sinatra'
require 'sinatra/reloader' if development?
require 'mongoid'
project_root = File.dirname(__FILE__)
Mongoid.load!(File.join(project_root, 'mongoid.yml'))

class FreedomQuote
  include Mongoid::Document

  field :quote, type: String
end

get '/freedom' do
  '“Freedom is not worth having if it does not include the freedom to make' \
  ' mistakes.” - Mahatma Gandhi'
end
