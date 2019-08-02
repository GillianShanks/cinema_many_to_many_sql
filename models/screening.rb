require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :screening_time, :film_id

  def initialize(screening)
    @id = screening['id'].to_i if screening['id']
    @screening_time = screening['screening_time']
    @film_id = screening['film_id'].to_i
  end



end
