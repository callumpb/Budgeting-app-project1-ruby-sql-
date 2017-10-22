require_relative('../db/sql_runner.rb')

class Merchant

  attr_reader: :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end
end