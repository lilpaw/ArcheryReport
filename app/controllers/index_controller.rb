
require "sinatra"
require "instagram"
require 'dotenv'

Dotenv.load


enable :sessions

#LOCAL HOST INFO

CALLBACK_URL = "http://localhost:9393/oauth/callback"

Instagram.configure do |config|
  config.client_id = ENV['LH_CLIENT_ID']
  config.client_secret = ENV['LH_CLIENT_SECRET']
end

# HEROKU INFO

# CALLBACK_URL = "https://archery.herokuapp/oauth/callback"

# Instagram.configure do |config|
#   config.client_id = ENV['CLIENT_ID']
#   config.client_secret = ENV['CLIENT_SECRET']
# end

get '/' do
  # @tags = Tag.all
  p session[:access_token]
  erb :homepage
end

get '/oauth/connect' do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  redirect "/"
end

# get "/tags/archery/media/recent" do
#   @searchresults = []
#   client = Instagram.client(:access_token => session[:access_token])

#   tags = client.tag_search("archery")
#   for media_item in client.tag_recent_media(tags[0].name)
#     @searchresults << "<img src='#{media_item.images.thumbnail.url}'>"
#   end
#   # content_type :json
#   # @searchresults << client
#   return @searchresults.to_json

# end



# get '/index' do
# # response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
# # @username = response["user"]["username"]

# erb :homepage

# end


