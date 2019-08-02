require_relative('../db/sql_runner.rb')
require_relative('./ticket.rb')

class Screening

  attr_reader :id
  attr_accessor :screening_time, :film_id

  def initialize(screening)
    @id = screening['id'].to_i if screening['id']
    @screening_time = screening['screening_time']
    @film_id = screening['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (screening_time, film_id) VALUES ($1,$2) RETURNING id"
    values = [@screening_time, @film_id]

    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"

    SqlRunner.run(sql)
  end

  # def self.all()
  #   sql = "SELECT * FROM screenings"
  #   screenings = SqlRunner.run(sql)
  #   return screenings.map{|screening|Screening.new(screening)}
  # end

  # def tickets() #all the tickets for a screening
  #   sql = "SELECT * FROM tickets WHERE tickets.screening_id = $1"
  #   values = [@id]
  #   tickets = SqlRunner.run(sql,values)
  #   return tickets.map{|ticket|Ticket.new(ticket)}
  #
  # end

  def self.find_by_id(id)
    sql = "SELECT * FROM screenings WHERE id = $1"
    values = [id]
    screening = SqlRunner.run(sql, values)[0]
    return Screening.new(screening)

  end

  def self.popular()
    all_tickets = Ticket.all()
    screenings = all_tickets.map{|ticket| ticket.screening_id}
    time_count_hash = screenings.each_with_object(Hash.new(0)){|time, hash| hash[time] += 1}
    sorted_hash = time_count_hash.sort_by{|screening, count| count}
    screening_time_id=sorted_hash.last[0] #doesn't work for ties
    pop_screening = Screening.find_by_id(screening_time_id)
    return pop_screening

  end

end
