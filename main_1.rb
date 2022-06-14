# Подключаем классы товара и классов-детей: книги и фильма
PW = 'lib/'.freeze
%W[#{PW}product #{PW}book #{PW}film #{PW}disc].each do |file|
  require_relative file
end

# Запишем в переменную choices массив типов записей, которые можно создать,
# вызвав у класса Product метод product_types (статический метод).
choices = Product.product_types

# Для начала цикла запишем в переменную choice (куда позже будем складывать
# выбор пользователя) значение -1.
choice = -1

# Пока юзер не выбрал правильно (от 0 до длины массива вариантов), спрашиваем
# у него число и выводим список возможных вариантов для записи.
until choice.between?(0, 3)
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  # Запишем выбор пользователя в переменную choice
  choice = $stdin.gets.to_i
end

# Как только выбор сделан, мы можем создать запись нужного типа, передав выбор
# пользователя в статический метод create класса Product, который мы фактически
# используем как конструктор.
entry = Product.create_from_file(choice)

case choice
when 0
  file_films = Dir[File.join(__dir__, 'data/films', '*.txt')]
  puts entry.from_file(file_films)
when 1
  file_books = Dir[File.join(__dir__, 'data/books', '*.txt')]
  puts entry.from_file(file_books)
when 2
  file_discs = Dir[File.join(__dir__, 'data/discs', '*.txt')]
  puts entry.from_file(file_discs)
end

# Пытаемся вызвать метод from_file у класса Product и ловим ошибку
# begin
#   Product.from_file(Dir[File.join(__dir__, 'data/films', '*.txt')])
# rescue NotImplementedError
#   puts 'Метод класса Product.from_file не реализован'
# end
