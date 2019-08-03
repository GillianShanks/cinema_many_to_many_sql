require_relative('../db/sql_runner.rb')

class Ticket
  attr_reader :id
  attr_accessor :film_id, :customer_id, :screening_id

  def initialize(ticket)
    @id = ticket['id'].to_i if ticket['id']
    @film_id = ticket['film_id'].to_i
    @customer_id = ticket['customer_id'].to_i
    @screening_id = ticket['screening_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id, screening_id) VALUES ($1, $2, $3) RETURNING id"

    values = [@film_id, @customer_id, @screening_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE tickets SET (film_id, customer_id, screening_id) = ($1,$2,$3) WHERE id = $4"
    values = [@film_id, @customer_id, @screening_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return tickets.map{|ticket|Ticket.new(ticket)}
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  # def customer_pays()
  #   film = Film.find_by_id(@film_id)
  #   customer = Customer.find_by_id(@customer_id)
  #
  #   price_of_film = film.price
  #   remaining_funds = customer.fund - price_of_film
  #
  #   customer.fund = remaining_funds
  #   customer.update()
  # end

  def buy()
    screening = Screening.find_by_id(@screening_id)
    film = Film.find_by_id(@film_id)
    customer = Customer.find_by_id(@customer_id)
    #tried to make these a get_objects() function, didn't work because variables weren't assigned - could make local variables - bad?

    if screening.max_seats > 0
      save()
      screening.max_seats -= 1
      screening.update()
      # customer.reduce_funds()
    end
    "There are #{screening.max_seats} tickets left for #{film.title} at #{screening.screening_time}."
  end

end
