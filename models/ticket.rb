require_relative('../db/sql_runner.rb')

class Ticket
  def initialize(ticket)
    @id = ticket['id'].to_i if ticket['id']
    @film_id = ticket['film_id'].to_i
    @customer_id = ticket['customer_id'].to_i
  end


end
