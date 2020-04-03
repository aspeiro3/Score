class Film < Product
  attr_accessor :year, :creator, :title

  def self.from_file(path)

    unless File.exist?(path)
      abort "Файл #{path} не найден"
    end

    file = File.readlines(path, chomp: true)

    self.new(
      title:    file[0],
      creator:  file[1],
      year:     file[2].to_i,
      price:    file[3].to_i,
      balance:  file[4].to_i
    )
  end

  def initialize(params)
    super

    @year = params[:year]
    @creator = params[:creator]
    @title = params[:title]
  end

  def to_s
    "Фильм «#{@title}», #{@year}, реж. #{@creator}, #{super}"
  end

  def update(params)
    super

    @year = params[:year] if params[:year]
    @creator = params[:creator] if params[:creator]
    @title = params[:title] if params[:title]
  end
end
