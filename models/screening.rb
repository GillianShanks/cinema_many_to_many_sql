require_relative('../db/sql_runner.rb')

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


end
