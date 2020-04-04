class Disk < Product
  attr_accessor :title, :creator, :genre, :year

  def self.from_file(path)

    unless File.exist?(path)
      abort "Файл #{path} не найден"
    end

    file = File.readlines(path, chomp: true)

    self.new(
      title:    file[0],
      creator:  file[1],
      genre:    file[2],
      year:     file[3].to_i,
      price:    file[4].to_i,
      balance:  file[5].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @creator = params[:creator]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом «#{@title}», #{@year}, исп. «#{@creator}», «#{@genre}», #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @creator = params[:creator] if params[:creator]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end
