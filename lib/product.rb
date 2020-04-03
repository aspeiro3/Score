class Product
  attr_accessor :price, :balance

  def self.from_file(path)
    #raise NotImplementedError
  end

  def initialize(params)
    @price = params[:price]
    @balance = params[:balance]
  end

  def to_s
    "#{@price} руб. (осталось #{@balance})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @balance = params[:balance] if params[:balance]
  end
end
