
require "sinatra"
require "instagram"
require 'dotenv'

Dotenv.load


enable :sessions

CALLBACK_URL = "http://localhost:9393/oauth/callback"

Instagram.configure do |config|
  config.client_id = ENV['CLIENT_ID']
  config.client_secret = ENV['CLIENT_SECRET']
end

get '/' do
  erb :homepage
end

get '/oauth' do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  redirect "/"
end



get '/index' do
# response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
# @username = response["user"]["username"]

erb :homepage

end