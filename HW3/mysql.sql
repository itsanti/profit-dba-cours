CREATE TABLE `goods` (
  `id`    SERIAL,
  `title` VARCHAR(255), -- Наименование
  `productid`   CHAR(8) NOT NULL, -- Артикул (внутренний код)
  `image` VARCHAR(100), -- Изображение
  `price` DECIMAL(8, 2) UNSIGNED, -- Цена
  `oldprice` DECIMAL(8, 2) UNSIGNED DEFAULT NULL, -- Старая цена
  `saledate` DATE, -- Дата появления в продаже
  `amount` SMALLINT UNSIGNED, -- Количество на складе
  PRIMARY KEY (`id`)
);
