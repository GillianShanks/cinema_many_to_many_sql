require_relative('../db/sql_runner')
require_relative('./film.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :fund

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

  def update()
    sql = "UPDATE customers SET (name, fund) = ($1, $2) WHERE id = $3"

    values = [@name, @fund, @id]

    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map{|customer| Customer.new(customer)}
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql,values)
    return films.map{|film|Film.new(film)}
  end

  def reduce_funds()
    # sql = "SELECT SUM(films.price) FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = $1"
    # values = [@id]
    # price_of_movies = SqlRunner.run(sql,values)[0]['sum'].to_i

    price_of_movies = films().sum{|film| film.price}
    remaining_funds = @fund - price_of_movies

    @fund = remaining_funds
    # @fund -= price_of_movies
    update() #if @fund >= 0
  end

  def tickets()
    tickets = films().count
    return tickets
  end


end
