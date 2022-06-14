# Класс-родитель Товар, у которого есть цена и остаток на складе. От этого
# класса мы будем наследовать все другие товары.
class Product
  # У любого экземпляра класса Товар будут как минимум две переменные — цена
  # и количество единиц товара на складе
  attr_accessor :price, :amount

  class << self
    def product_types
      [Film, Book, Disc]
    end

    def create_from_file(type_index)
      product_types[type_index]
    end
  end

  # Конструктор товара записывает, сколько стоит товар и сколько осталось
  def initialize(params)
    @price = params[:price].to_f
    @amount = params[:amount].to_i
  end

  # Родительский метод to_s возвращает строку с ценой и остатком
  def to_s
    "#{@price} руб."
  end

  # Метод update у родителя обновляет только цену и количество товара, если эти
  # ключи были переданы в ассоциативном массиве на вход
  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end

  # Абстрактный метод from_file для продукта не имеет смысла, т.к. абстрактный
  # продукт из файла мы прочитать не сможем (мы не знаем, например, формат),
  # поэтому если он не определен у родителя, он будет возвращать ошибку. Класс
  # ошибки так и называется «ошибка отсутствия имплементации».
  def self.from_file(file_path)
    raise NotImplementedError
  end
end
