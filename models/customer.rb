require_relative('../db/sql_runner')

class Customer

  def initialize(customer)
    @id = customer['id'].to_i if customer['id']
    @name = customer['name']
    @fund = customer['fund']
  end



end
