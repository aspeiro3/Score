# класс который хранит в себе все товары
class ProductCollection

  PRODUCT_TYPES = {
    film: {dir: 'films', class: Film},
    book: {dir: 'books', class: Book}
  }

  # Cтатический метод from_dir, который считывает продукты из папки data, сам понимая, какие товары в какой папке лежат.
  def self.from_dir(dir_path)

    products = []

    PRODUCT_TYPES.each do |kay, valve|
      path_folder = valve[:dir]
      class_product = valve[:class]

      Dir["#{dir_path}/#{path_folder}/*.txt"].each do |path|
        products << class_product.from_file(path)
      end
    end

    # Создает на каждый элемент массива свой экземпляр класса (передается в конструктор)
    self.new(products)
  end

  # Если не чего в конструктор не передали, конструктор принимает пустой массив
  def initialize(products = [])
    @products = products
  end

  # Метод экземпляра to_a, который возвращает массив товаров.
  def to_a
    @products
  end

  # Метод sort, который сортирует товары по цене, остатку на складе или по названию (как по возрастанию, так и по убыванию):
  def sort!(params)

    case params[:by]
    when :price then @products.sort_by!(&:price)
    when :title then @products.sort_by!(&:title)
    when :balance then @products.sort_by!(&:balance)
    end

    @products.reverse! if params[:order] == :asc
    
    self
  end
end
