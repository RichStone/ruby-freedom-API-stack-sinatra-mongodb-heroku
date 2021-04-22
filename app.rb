# app.rb

require 'sinatra'
require 'sinatra/reloader' if development?

get '/freedom' do
  '“Freedom is not worth having if it does not include the freedom to make' \
  ' mistakes.” - Mahatma Gandhi'
end
