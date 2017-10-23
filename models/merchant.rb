require_relative('../db/sql_runner.rb')

class Merchant

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql =
    "INSERT INTO merchants (name)
    VALUES ($1)
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM merchants"
    values = []
    result = SqlRunner.run(sql, values)
    result.map { |merchant| Merchant.new(merchant)}
    return result
  end

  def delete_all
    sql = "DELETE * FROM merchants"
    values = []
    result = SqlRunner.run(sql, values)
  end

  def delete(id)
    sql = "DELETE * FROM merchants
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
  end
end
