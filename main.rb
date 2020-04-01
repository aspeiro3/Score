require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

film = Film.new(300, 10)

puts "Фильм Леон стоит #{film.price}$"
