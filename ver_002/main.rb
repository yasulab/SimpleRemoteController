# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'shotgun'

# Path to refer to static contents (e.g. Image)
#set :public, File.dirname(__FILE__) + '/public'
save_path = "./public/buffer"

# Show records in the database
get '/' do
  File.open(save_path, 'r') do |f|
    #p save_path
    @key = f.read
  end
  @key
end

get '/:key' do  
  @output = "{\"date\":#{Time.now.to_i}, \"key\":\"#{params[:key]}\"}"
  File.open(save_path, 'wb') do |f|
    f.write @output  
  end  
  @output
end

