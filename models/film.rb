require_relative('../db/sql_runner.rb')
require_relative('./customer.rb')
require_relative('./screening.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(film)
    @id = film['id'].to_i if film['id']
    @title = film['title']
    @price = film['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"

    values = [@title, @price]

    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"

    values = [@title, @price, @id]

    SqlRunner.run(sql,values)
  end

  def delete()
    sql = 'DELETE FROM films WHERE id = $1'
    values = [@id]

    SqlRunner.run(sql,values)
  end

  def self.all()
    sql = 'SELECT * from films'
    films = SqlRunner.run(sql)
    return films.map{|film| Film.new(film)}
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = $1"

    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map{|customer| Customer.new(customer)}
  end

  def tickets()
    tickets = customers().count
    return tickets
  end

  def screenings()
    sql = "SELECT * FROM screenings WHERE screenings.film_id = $1 ORDER BY screenings.screening_time"

    values = [@id]

    screenings = SqlRunner.run(sql, values)
    return screenings.map{|screening| Screening.new(screening)}
  end

  def times()
    times_array = screenings().map{|screening| screening.screening_time}
  end

# times_array.each{|time| p time}
  def self.find_by_id(id)
    sql = "SELECT * FROM FILMS where id = $1"
    values = [id]

    film = SqlRunner.run(sql,values)[0]
    return Film.new(film)
  end

end
