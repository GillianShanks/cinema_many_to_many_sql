require_relative('../db/sql_runner.rb')

class Ticket
  attr_reader :id
  attr_accessor :film_id, :customer_id
  
  def initialize(ticket)
    @id = ticket['id'].to_i if ticket['id']
    @film_id = ticket['film_id'].to_i
    @customer_id = ticket['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id) VALUES ($1, $2) RETURNING id"

    values = [@film_id, @customer_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE tickets SET (film_id, customer_id) = ($1,$2) WHERE id = $3"
    values = [@film_id, @customer_id, @id]
    SqlRunner.run(sql, values)
  end


end
