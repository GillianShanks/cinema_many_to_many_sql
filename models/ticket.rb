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

  def self.popular_ticket()
    all_tickets = Ticket.all()
    screenings = all_tickets.map{|ticket| ticket.screening_id}
    time_count_hash = screenings.each_with_object(Hash.new(0)){|time, hash| hash[time] += 1}
    sorted_hash = time_count_hash.sort_by{|screening, count| count}
    screening_time_id=sorted_hash.last[0]

  end

end
