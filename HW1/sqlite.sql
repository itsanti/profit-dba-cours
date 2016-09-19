CREATE DATABASE `dbacourse`;

CREATE TABLE `books` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `title` TEXT,
  `published` INTEGER,
  `author` TEXT,
  `price` INTEGER -- для SQLite храним цену в копейках
);

CREATE TABLE `publishers` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `title` TEXT,
  `country` TEXT,
  `founded` INTEGER,
  `city` TEXT,
  `address` TEXT,
  `link` TEXT
);

INSERT INTO `books`
  (`title`, `published`, `author`, `price`)
VALUES
  ('Так хочется жить', 1996, 'Виктор Астафьев', 38000),
  ('Девушка из Золотого Рога', 2016, 'Курбан Саид', 29800),
  ('Черты характера', 1993, 'Всеволод Кочетов', 31500),
  ('Дни Турбиных', 2006, 'Михаил Булгаков', 21600),
  ('Ветры поющие', 1927, 'Конрад Берковичи', 133000),
  ('Гармонист Суворов. Рассказы', 1928, 'Василий Андреев', 266000),
  ('Белая гвардия', 2011, 'Михаил Булгаков', 10100),
  ('Собачье сердце', 2014, 'Михаил Булгаков', 17000);

INSERT INTO `publishers`
  (`title`, `country`, `founded`, `city`, `address`, `link`)
VALUES
  ('Издательский дом «Питер»', 'Россия', 1991, 'Санкт-Петербург', 'Б.Сампсониевский пр., 29а', 'www.piter.com'),
  ('Манн, Иванов и Фербер', 'Россия', 2005, 'Москва', 'Большой Козихинский переулок, д. 7, стр. 2', 'www.mann-ivanov-ferber.ru'),
  ('Группа компаний «ЛитРес»', 'Россия', 2006, 'Москва', 'ул.2-я Звенигородская д.13 стр.41', 'www.litres.ru');
