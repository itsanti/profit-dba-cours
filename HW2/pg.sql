CREATE TABLE "goods" (
  "id"    SERIAL,
  "title" VARCHAR(255), -- Наименование
  "productid"  CHAR(8) NOT NULL, -- Артикул (внутренний код)
  "image" VARCHAR(100), -- Изображение
  "price" NUMERIC(8, 2), -- Цена
  "saledate" DATE, -- Дата появления в продаже
  "amount" SMALLINT -- Количество на складе
);

INSERT INTO "goods"
  ("title", "productid", "image", "price", "saledate", "amount")
VALUES
  ('Samsung SM-G925F Galaxy S6 Edge (32 GB), Black Sapphire',
   'Y5WUW9GC', 'images/Y5/1001.jpg', 35790, '2015-05-20', 20),
  ('Apple iPad mini 4 Wi-Fi + Cellular 16GB, Gold',
   'L2VCUX8Z', 'images/L2/1002.jpg', 41990, '2015-01-12', 320),
  ('Sony DAV-TZ140 домашний кинотеатр',
   'U7HNJW5R', 'images/U7/1003.jpg', 10290, '2014-07-07', 100),
  ('Gmini MagicEye HDS4000, Black экшн-камера',
   '9RZJUYSP', 'images/9R/1004.jpg', 4739, '2015-05-14', 17),
  ('HP Scanjet 300 (L2733A) сканер',
   'BGB9FWP7', 'images/BG/1005.jpg', 5790, '2014-02-27', 125);
