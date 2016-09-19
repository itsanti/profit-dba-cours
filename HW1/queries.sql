-- Все книги определенного автора
SELECT * FROM `books`
WHERE `author` = 'Михаил Булгаков';

-- Все книги ценой не более 500 рублей
SELECT * FROM `books`
WHERE `price` <= 500.00;

-- Заглавия книг (и год издания) определенного автора, отсортированные по году их издания
SELECT `title`, `published`
FROM `books`
WHERE `author` = 'Михаил Булгаков'
ORDER BY `published`;

-- Имена авторов книг, вышедших в 1990-е годы
SELECT `author`
FROM `books`
WHERE `published` >= 1990 AND `published` < 2000;

-- или с помощью оператора сравнения BETWEEN ... AND ...
SELECT `author`
FROM `books`
WHERE `published` BETWEEN 1990 AND 1999;
