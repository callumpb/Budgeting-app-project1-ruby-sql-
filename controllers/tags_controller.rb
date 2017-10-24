require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/tag.rb')

get '/tags' do
  @tags = Tag.all
  erb(:"tags/index")
end
