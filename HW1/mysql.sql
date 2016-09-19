CREATE DATABASE `dbacourse`;

CREATE TABLE `books` (
  `id` SERIAL,
  `title` VARCHAR(255),
  `published` NUMERIC(4, 0),
  `author` VARCHAR(100),
  `price` NUMERIC(8, 2)
);

CREATE TABLE `publishers` (
  `id` SERIAL,
  `title` VARCHAR(255),
  `country` VARCHAR(60),
  `founded` NUMERIC(4, 0),
  `city` VARCHAR(60),
  `address` VARCHAR(255),
  `link` VARCHAR(100)
);

INSERT INTO `books`
  (`title`, `published`, `author`, `price`)
VALUES
  ('Так хочется жить', 1996, 'Виктор Астафьев', 380),
  ('Девушка из Золотого Рога', 2016, 'Курбан Саид', 298),
  ('Черты характера', 1993, 'Всеволод Кочетов', 315),
  ('Дни Турбиных', 2006, 'Михаил Булгаков', 216),
  ('Ветры поющие', 1927, 'Конрад Берковичи', 1330),
  ('Гармонист Суворов. Рассказы', 1928, 'Василий Андреев', 2660),
  ('Белая гвардия', 2011, 'Михаил Булгаков', 101),
  ('Собачье сердце', 2014, 'Михаил Булгаков', 170);

INSERT INTO `publishers`
  (`title`, `country`, `founded`, `city`, `address`, `link`)
VALUES
  ('Издательский дом «Питер»', 'Россия', 1991, 'Санкт-Петербург', 'Б.Сампсониевский пр., 29а', 'www.piter.com'),
  ('Манн, Иванов и Фербер', 'Россия', 2005, 'Москва', 'Большой Козихинский переулок, д. 7, стр. 2', 'www.mann-ivanov-ferber.ru'),
  ('Группа компаний «ЛитРес»', 'Россия', 2006, 'Москва', 'ул.2-я Звенигородская д.13 стр.41', 'www.litres.ru');
