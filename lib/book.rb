class Book < Product
  attr_accessor :genre, :creator, :title

  def self.from_file(path)

    unless File.exist?(path)
      abort "Файл #{path} не найден"
    end

    file = File.readlines(path, chomp: true)

    self.new(
      title:    file[0],
      creator:  file[1],
      genre:    file[2],
      price:    file[3].to_i,
      balance:  file[4].to_i
    )
  end

  def initialize(params)
    super

    @genre = params[:genre]
    @creator = params[:creator]
    @title = params[:title]
  end

  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@creator}, #{super}"
  end

  def update(params)
    super

    @genre = params[:genre] if params[:genre]
    @creator = params[:creator] if params[:creator]
    @title = params[:title] if params[:title]
  end
end
