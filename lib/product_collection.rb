# Класс Коллекция продуктов, который может считывать все нужные продукты из
# подкатегорий films, books, discs и т.д.
class ProductCollection
  # Создадим константу со всеми возможными типами продуктов. Это ассоциативный
  # массив, где ключем является символ, а значением — другой ассоциативный
  # массив с название папки (где лежат файлы этого типа) и ссылкой на класс.
  PRODUCT_TYPES = [
    { dir: 'films', class: Film },
    { dir: 'books', class: Book },
    { dir: 'discs', class: Disc }
  ].freeze

  # Конструктор коллекции принимает на вход массив продуктов, но если ничего не
  # передали на вход, то он записывает в переменную экземпляра @products пустой
  # массив.
  def initialize(products = [])
    @products = products
  end

  # Метод класса (статический метод) from_dir считывает из указанной в
  # параметрах папки все файлы:
  #
  # фильмы — из dir_path + '/films';
  # книги — из dir_path + '/books';
  # диски — из dir_discs + '/books'.
  def self.from_dir(dir_path)
    # Создаем пустой массив, куда будем складывать все найденные продукты
    products = []

    # Пройдемся по каждой паре ключ-значение из константы PRODUCT_TYPES и
    # поочередно запишем эту пару соответственно в переменную hash.

    PRODUCT_TYPES.each do |hash|
      # Получим из хэша путь к директории с файлами нужного типа, например,
      # строку 'films'
      product_dir = hash[:dir]

      # Получим из хэша объект нужного класса, например класс Film. Обратите
      # внимание, мы оперируем сейчас классом, как объектом. Передаем его по
      # ссылки и вызываем у него методы. Такова природа руби: все — объекты.
      product_class = hash[:class]

      # Для каждого текстового файла из директории, например '/data/films/'
      # берем путь к файлу и передаем его в метод класса from_file, вызывая его
      # у объекта нужного класса.

      # path = Dir[dir_path + '/' + product_dir + '/*.txt']
      # path = Dir[File.join(dir_path, product_dir, '*.txt')]
      path = Dir["#{dir_path}/#{product_dir}/*.txt"]
      products << product_class.from_file(path)
    end

    # Вызываем конструктор этого же класса (ProductCollection) и передаем ему
    # заполненный массив продуктов
    new(products.flatten!) # новый экземпляр класса ProductCollection
  end

  # Простой метод, чтобы достать все продукты коллекции
  def to_a
    @products
  end

  # Метод sort! меняет экземпляр класса ProductCollection (меняет порядок)
  # продуктов в коллекции, поэтому он назвал с восклицательным знаком. Этот
  # метод принимает на вход ассоциативный массив, в котором могут быть два
  # ключа: :by и :order. Например, чтобы отсортировать продукты по возрастанию
  # цены, можно вызвать этот метод так:
  #
  # collection.sort!(by: :price, order: :asc)
  def sort!(params)
    # Делает выбор по параметру by
    case params[:by]
    when :title
      # Если запросили сортировку по наименованию
      @products.sort_by!(&:to_s)
    when :price
      # Если запросили сортировку по цене
      @products.sort_by!(&:price)
    when :amount
      # Если запросили сортировку по количеству
      @products.sort_by!(&:amount)
    end

    # Если запросили сортировку по возрастанию
    # asc - ascending - по возрастанию
    # desc - descenging - по убыванию
    @products.reverse! if params[:order] == :desc

    self
  end

  # цены на товары
  def price_products
    @products.map { |product, _amount| product.price }
  end
end
