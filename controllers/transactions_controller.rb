require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')

get '/transactions' do
  @transactions = Transaction.all
  @total = Transaction.total_spend
  #  @total_by_tag = Transaction.all.total_spend_tag
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/index")
end

get '/transactions/new' do
  erb(:"transactions/new")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to("/transactions/new")
end


# get '/merchants' do
#   @merchants = Merchant.all
#   erb(:"merchants/index")
# end
#
# get '/tags' do
#   @tags = Tag.all
#   erb(:"tags/index")
# end

# get '/transactions/new' do
#   #@transactions = Transaction.all
#   @merchants = Merchant.all
#   @tags = Tag.all
#   erb(:"transactions/new")
# end
