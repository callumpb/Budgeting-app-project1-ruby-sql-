require_relative('../db/sql_runner.rb')

class Transaction

  attr_reader :id, :amount, :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def save
    sql = "INSERT INTO transactions
    (amount, merchant_id, tag_id)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@amount, @merchant_id, @tag_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM transactions"
    values = []
    result = SqlRunner.run(sql, values)
    result.map { |transaction| Transaction.new(transaction)}
    return result
  end

  def delete_all
    sql = "DELETE * FROM transactions"
    values = []
    result = SqlRunner.run(sql, values)
  end
end
