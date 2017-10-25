require_relative('../db/sql_runner.rb')

class Transaction

  attr_reader :id, :amount, :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def total_spend
    sql = "SELECT SUM(amount) AS sum
    FROM transactions"
    values = []
    result = SqlRunner.run(sql, values)
    return result.first["sum"].to_f
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
    return result.map { |transaction| Transaction.new(transaction)}
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Transaction.new(result.first)
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete(id)
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def merchant
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [@merchant_id]
    result = SqlRunner.run(sql, values)
    merchant_info = Merchant.new(result.first)
    return merchant_info.name
  end

  def tag
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [@tag_id]
    result = SqlRunner.run(sql, values)
    tag_info = Tag.new(result.first)
    return tag_info.name

  end

end
