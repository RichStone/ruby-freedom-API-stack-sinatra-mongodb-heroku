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


# Read all freedom quotes
get '/freedom_quotes' do
  FreedomQuote.all.to_json
end

# Create a new freedom quote
post '/freedom_quotes' do
  quote = FreedomQuote.create!(params)
  quote.to_json
end

# read an individual freedom quote
get '/freedom_quotes/:id' do
  FreedomQuote.find(params[:id]).to_json
end

# Update an existing freedom quote
patch '/freedom_quotes/:id' do
  quote = FreedomQuote.find(params[:id]).update(params)
  quote.to_json
end

# Delete a freedom quote
delete '/freedom_quotes/:id' do
  quote = FreedomQuote.find(params[:id]).delete
  quote.to_json
end

delete '/freedom_quotes' do
  FreedomQuote.delete_all
end

get '/freedom' do
  '“Freedom is not worth having if it does not include the freedom to make' \
  ' mistakes.” - Mahatma Gandhi'
end
