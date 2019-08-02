require_relative('../db/sql_runner')

class Customer

  def initialize(customer)
    @id = customer['id'].to_i if customer['id']
    @name = customer['name']
    @fund = customer['fund']
  end

  def save()
    sql = "INSERT INTO customers (name, fund) VALUES ($1, $2) RETURNING id"

    values = [@name, @fund]

    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end
end
