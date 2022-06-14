# Программа-магазин книг, фильмов и дисков с классом ProductCollection,
# который умеет хранить и сортировать коллекцию любых продуктов.
PW = 'lib/'.freeze
%W[#{PW}product #{PW}book #{PW}film #{PW}disc #{PW}product_collection #{PW}basket].each do |file|
  require_relative file
end

# Создаем коллекцию продуктов, передавая методу класса from_dir путь к папке
# с подпапками films, books и discs. ProductCollection сам знает, как там внутри лежат
# эти файлы, и сам разберется, как их оттуда считать.

# collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection = ProductCollection.from_dir("#{__dir__}/data")

basket = Basket.new

# Сортируем продукты по возрастанию цены с помощью метода sort! экземпляра
# класса ProductCollection
collection.sort!(by: :price, order: :desc)

# массив цен на товары
# price = collection.price_products

price_buy = []

loop do
  if collection.to_a.empty?
    puts 'Вы скупили весь товар. Магазин закрывается на переучет!'
    break
  end

  puts "\nЧто хотите купить?\n"

  # Получаем массив продуктов методом to_a и выводим каждый на экран
  collection.to_a.each.with_index(1) do |product, index|
    puts "#{index}. #{product} (осталось #{product.amount})"
  end

  puts
  puts '0. Выход'
  puts
  print '> '
  choice_user = $stdin.gets.to_i

  # Пока юзер не выбрал правильно (от 0 до максимального индекса), спрашиваем
  # у него число и выводим список возможных вариантов для записи.
  until choice_user.between?(0, collection.to_a.size)
    print 'Введите номер товара из списка: '
    choice_user = $stdin.gets.to_i
  end

  break if choice_user.zero?

  choice_user -= 1

  # то, что выбрали
  product = collection.to_a[choice_user]

  if product.amount.positive?

    # добавим выбранный продукт в корзину
    basket << product

    product.amount -= 1

    # накопленная цена того, что выбрали
    price_buy = basket.total_price

  end

  if product.amount.zero?
    puts 'Товар закончился'
    collection.to_a.delete(product)
  end

  puts <<~HERE
    \nВы быбрали:\n#{product}
    В вашей корзине сейчас:\n#{basket}
    \nВсего товаров на сумму: #{price_buy} руб.
  HERE
end

puts <<~HERE
  \nВы купили:\n\n#{basket}\n
  С Вас — #{price_buy} руб. Спасибо за покупки!
HERE
