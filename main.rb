require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

params = {price: 300, balance: 10}

film = Film.new(params)

puts "Фильм Леон стоит #{film.price}$"
