require_relative('../models/transactions.rb')
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
require('pry')

Transaction.delete_all
Tag.delete_all
Merchant.delete_all

tag1 = Tag.new({
  "name" => "food"
  })

tag1.save

tag2 = Tag.new({
  "name" => "clothes"
  })

tag2.save

tag3 = Tag.new({
  "name" => "recreation"
  })

tag3.save

merchant1 = Merchant.new({
  "name" => "Argos"
  })

merchant1.save

merchant2 = Merchant.new({
  "name" => "Primark"
  })

merchant2.save

merchant3 = Merchant.new({
  "name" => "Chanter"
  })

merchant3.save

transaction1 = Transaction.new({
  "amount" => 10,
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
  })

transaction1.save

transaction2 = Transaction.new({
  "amount" => 20,
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id
  })

transaction2.save

transaction3 = Transaction.new({
  "amount" => 15,
  "merchant_id" => merchant3.id,
  "tag_id" => tag3.id
  })

transaction3.save
