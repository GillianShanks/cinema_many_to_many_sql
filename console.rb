require('pry-byebug')
require_relative('./models/ticket.rb')
require_relative('./models/film.rb')
require_relative('./models/customer.rb')

Ticket.delete_all()
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
    'fund' => 10
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
ticket1.save()

ticket2 = Ticket.new(
  {
    'film_id' => film1.id,
    'customer_id' => customer2.id
  }
)
ticket2.save()


ticket3 = Ticket.new(
  {
    'film_id' => film1.id,
    'customer_id' => customer3.id
  }
)
ticket3.save()


ticket4 = Ticket.new(
  {
    'film_id' => film2.id,
    'customer_id' => customer3.id
  }
)
ticket4.save()


ticket5 = Ticket.new(
  {
    'film_id' => film2.id,
    'customer_id' => customer2.id
  }
)
ticket5.save()


ticket6 = Ticket.new(
  {
    'film_id' => film3.id,
    'customer_id' => customer1.id
  }
)
ticket6.save()


ticket7 = Ticket.new(
  {
    'film_id' => film3.id,
    'customer_id' => customer2.id
  }
)
ticket7.save()

screening1 = Screening.new(
  {
    'screening_time' => '1800'
    'movie_id' => movie1.id
  }
)


screening2 = Screening.new(
  {
    'screening_time' => '2000'
    'movie_id' => movie1.id
  }
)


screening3 = Screening.new(
  {
    'screening_time' => '1900'
    'movie_id' => movie2.id
  }
)


screening4 = Screening.new(
  {
    'screening_time' => '2100'
    'movie_id' => movie2.id
  }
)


screening5 = Screening.new(
  {
    'screening_time' => '1700'
    'movie_id' => movie2.id
  }
)


screening6 = Screening.new(
  {
    'screening_time' => '1600'
    'movie_id' => movie3.id
  }
)



film2.title = 'Huge Disaster'
film2.update()

# customer3.name = 'Voldemort'
# customer3.update()

# ticket1.film_id = film2.id
# ticket1.update()

binding.pry
nil
