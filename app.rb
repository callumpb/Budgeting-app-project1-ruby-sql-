require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('controllers/merchants_controller.rb')
require_relative('controllers/transactions_controller.rb')
require_relative('controllers/tags_controller.rb')

get '/' do
  @total = Transaction.total_spend
  erb(:index)
end
