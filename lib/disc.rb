class Disc < Product
  attr_accessor :title, :year, :executor, :style

  # Метод класса from_file считывает данные о фильме из файла, путь к которому
  # ему передали в качестве параметра и передает их на вход своему же
  # конструктору с нужными ключами.
  def self.from_file(file_discs)
    file_discs.map do |file_names|
      lines = File.readlines(file_names, chomp: true)
      new(
        title: lines[0],
        executor: lines[1],
        style: lines[2],
        year: lines[3].to_i,
        price: lines[4].to_f,
        amount: lines[5].to_i
      )
    end
  end

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @executor = params[:executor]
    @style = params[:style]
  end

  def to_s
    "Альбом «#{@executor}» - «#{@title}», #{@style}, #{@year}, #{super}"
  end

  # Метод update у ребенка обновляет специфичные для ребенка поля и вызывает
  # метод родителя, чтобы тот обновил цену и остаток.
  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @executor = params[:executor] if params[:executor]
    @style = params[:style] if params[:style]
  end
end
