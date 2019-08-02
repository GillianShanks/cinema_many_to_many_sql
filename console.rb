require('pry-byebug')
require_relative('./models/ticket.rb')
require_relative('./models/film.rb')
require_relative('./models/customer.rb')

Customer.delete_all()
Film.delete_all()

film1 = Film.new(
  {
    'title' => 'Happy Unicorns',
    'price' => 5
  }
)
film1.save()

film2 = Film.new(
  {
    'title' => 'Big Disaster',
    'price' => 10
  }
)
film2.save()

film3 = Film.new(
  {
    'title' => 'Totally In Love',
    'price' => 6
  }
)
film3.save()

customer1 = Customer.new(
  {
    'name' => 'Hermione',
    'fund' => 30
  }
)

customer1.save()

customer2 = Customer.new(
  {
    'name' => 'Ron',
    'fund' => 21
  }
)
customer2.save()

customer3 = Customer.new(
  {
    'name' => 'Harry',
    'fund' => 40
  }
)
customer3.save()

ticket1 = Ticket.new(
  {
    'film_id' => film1.id,
    'customer_id' => customer1.id
  }
)

ticket2 = Ticket.new(
  {
    'film_id' => film1.id,
    'customer_id' => customer2.id
  }
)

ticket3 = Ticket.new(
  {
    'film_id' => film1.id,
    'customer_id' => customer3.id
  }
)

ticket4 = Ticket.new(
  {
    'film_id' => film2.id,
    'customer_id' => customer3.id
  }
)

ticket5 = Ticket.new(
  {
    'film_id' => film2.id,
    'customer_id' => customer2.id
  }
)

ticket6 = Ticket.new(
  {
    'film_id' => film3.id,
    'customer_id' => customer1.id
  }
)

ticket7 = Ticket.new(
  {
    'film_id' => film3.id,
    'customer_id' => customer2.id
  }
)




film2.title = 'Huge Disaster'
film2.update()

# customer3.name = 'Voldemort'
# customer3.update()

binding.pry
nil
