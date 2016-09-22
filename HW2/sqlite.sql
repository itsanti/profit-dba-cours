CREATE TABLE `goods` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `title` TEXT, -- Наименование
  `productid` TEXT NOT NULL, -- Артикул (внутренний код)
  `image` TEXT, -- Изображение
  `price` INTEGER, -- Цена
  `saledate` TEXT NOT NULL, -- Дата появления в продаже
  `amount` INTEGER -- Количество на складе
);

INSERT INTO `goods`
  (`title`, `productid`, `image`, `price`, `saledate`, `amount`)
VALUES
  ('Samsung SM-G925F Galaxy S6 Edge (32 GB), Black Sapphire',
   'Y5WUW9GC', 'images/Y5/1001.jpg', 3579000, DATE('2015-05-20'), 20),
  ('Apple iPad mini 4 Wi-Fi + Cellular 16GB, Gold',
   'L2VCUX8Z', 'images/L2/1002.jpg', 4199000, DATE('2015-01-12'), 320),
  ('Sony DAV-TZ140 домашний кинотеатр',
   'U7HNJW5R', 'images/U7/1003.jpg', 1029000, DATE('2014-07-07'), 100),
  ('Gmini MagicEye HDS4000, Black экшн-камера',
   '9RZJUYSP', 'images/9R/1004.jpg', 473900, DATE('2015-05-14'), 17),
  ('HP Scanjet 300 (L2733A) сканер',
   'BGB9FWP7', 'images/BG/1005.jpg', 579000, DATE('2014-02-27'), 125);
