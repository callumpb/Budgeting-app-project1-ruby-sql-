require_relative('../db/sql_runner.rb')

class Tag

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO tags (name)
    VALUES ($1)
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tags"
    values = []
    result = SqlRunner.run(sql, values)
    result.map { |tag| Tag.new(tag) }
    return result
  end

  def delete_all
    sql = "DELETE * FROM tags"
    values = []
    result = SqlRunner.run(sql, values)
  end
end
