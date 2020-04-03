require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/product_collection'

collection = ProductCollection.from_dir("#{__dir__}/data")

#collection.sort!(by: :balance, order: :asc)

collection.to_a.each do |product|
  puts product
end
