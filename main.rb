# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'shotgun'

# Path to refer to static contents (e.g. Image)
set :public, File.dirname(__FILE__) + '/public'

# Show records in the database
get '/' do
  @msg = "Hi!"
  @msg
  #haml :index
end

# Upload URI to post
post '/upload' do
  if params[:file]
    save_path = "./public/images/#{params[:file][:filename]}"
    File.open(save_path, 'wb') do |f|
      p params[:file][:tempfile]
      f.write params[:file][:tempfile].read
    end
    @image_path = "images/#{params[:file][:filename]}"
  else
    @image_path = "res/no-image.jpg"
  end
  
  if params[:tweet]
    @tweet = params[:tweet]
  else
    @tweet = ""
  end
  post = Post.create(
                     :title => @tweet + " (via '/upload')",
                     :tweet_num => @tweet.length,
                     :image_path => @image_path,
                     :created_at => Time.now
                     )
  redirect '/'
end

get '/create' do
  post = Post.create(
                     :title => "Hello world!" + " (via '/create')",
                     :tweet_num => 0,
                     :image_path => "res/no-image.jpg",
                     :created_at => Time.now
                     )
  "Post.create was created!" unless post.nil?
end

