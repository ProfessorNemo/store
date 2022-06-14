=======
# Консольное приложение `store`
###### Язык написания - Ruby

## Описание приложения:
Программа с функционалом покупки для небольшого магазинчика, 
который торгует фильмами, дисками и книгами. 
Пользователь может выбрать несколько товаров и программа напишет ему,
какая потребуется сумма. Также пользователь может выбрать категорию товара
и программа напишет ему, что из выбранной категории есть в наличии.

## Установка и запуск:

**Примечание:** Это ruby-приложение, поэтому необходимо
чтобы на вашем компьютере был установлен интерпретатор Ruby.

1. Перенесите содержимое данного репозитория на свой компьютер
```
git clone git@github.com:ProfessorNemo/store.git
```
2. Чтобы запустить приложение в этой же директории
следует воспользоваться следующими командами:
```
ruby main_1.rb
ruby main_1.rb
```
## Пример работы программы:
```
ruby main_1.rb

        0. Film
        1. Book
        2. Disc
1

Книга «Идиот», роман, автор — Федор Достоевский, 1500.0 руб.
Книга «Безнадега», роман, автор — Стивен Кинг, 1000.0 руб.
Книга «Сонная Лощина», новелла, автор — Вашингтон Ирвинг, 1900.0 руб.
```

```
ruby main_2.rb

Что хотите купить?
1. Фильм «Титаник», 1997, реж. Джеймс Кэмерон, 2500.0 руб. (осталось 7)
2. Книга «Сонная Лощина», новелла, автор — Вашингтон Ирвинг, 1900.0 руб. (осталось 23)
3. Книга «Идиот», роман, автор — Федор Достоевский, 1500.0 руб. (осталось 10)
4. Фильм «Леон», 1994, реж. Люк Бессон, 990.0 руб. (осталось 5)
5. Фильм «Терминатор-2», 1991, реж. Джеймс Кэмерон, 600.0 руб. (осталось 15)
6. Альбом «Metallica» - «Ride the Lightning», трэш-металл, 1984, 350.0 руб. (осталось 8)
7. Альбом «АлисА» - «Черная метка», русский рок, 1994, 250.0 руб. (осталось 10)
8. Альбом «Iron Maiden» - «Killers», хэви-металл, 1981, 220.0 руб. (осталось 4)

0. Выход

> 0

Вы купили:

Фильм «Титаник», 1997, реж. Джеймс Кэмерон, 2500.0 руб. 1 x 2500.0 шт.
Книга «Сонная Лощина», новелла, автор — Вашингтон Ирвинг, 1900.0 руб. 2 x 3800.0 шт.
Книга «Безнадега», роман, автор — Стивен Кинг, 1000.0 руб. 3 x 3000.0 шт.

С Вас — 9300.0 руб. Спасибо за покупки!
```

