require('pry-byebug')
require_relative('./models/ticket.rb')
require_relative('./models/film.rb')
require_relative('./models/customer.rb')

film1 = Film.new(
  {
    'title' => 'Happy Unicorns',
    'price' => 5
  }
)

film2 = Film.new(
  {
    'title' => 'Big Disaster',
    'price' => 10
  }
)

film3 = Film.new(
  {
    'title' => 'Totally In Love',
    'price' => 6
  }
)

binding.pry
nil
