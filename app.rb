require 'sinatra'
require 'rest-client'
require 'json'

get '/' do
  erb :index
end

post '/convert' do
  currency
