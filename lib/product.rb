class Product
  attr_accessor :price, :balance

  def initialize(params)
    @price = params[:price]
    @balance = params[:balance]
  end
end
