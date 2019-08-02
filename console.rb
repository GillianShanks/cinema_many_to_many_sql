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
    'fund' => 20
  }
)

customer1.save()

customer2 = Customer.new(
  {
    'name' => 'Ron',
    'fund' => 10
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

film2.title = 'Huge Disaster'
film2.update()

customer3.name = 'Voldemort'
customer3.update()

binding.pry
nil
