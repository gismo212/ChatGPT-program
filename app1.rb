require 'sinatra'
require 'rest-client'
require 'json'

get '/' do
  erb :index
end

post '/convert' do
  currency_from = params[:currency_from]
  currency_to = params[:currency_to]
  amount = params[:amount].to_f
  url = "https://api.exchangerate-api.com/v4/latest/#{currency_from}"
  response = RestClient.get(url)
  data = JSON.parse(response.body)
  rate = data['rates'][currency_to]
  result = amount * rate
  erb :result, :locals => { :result => result, :currency_from => currency_from, :currency_to => currency_to, :amount => amount }
end
