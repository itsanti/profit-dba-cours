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

CREATE TABLE `categories` (
  `id`    SERIAL,
  `name`  VARCHAR(255), -- Название категории
  PRIMARY KEY (`id`)
);

CREATE TABLE `brands` (
  `id`    SERIAL,
  `name` VARCHAR(255), -- Название бренда
  PRIMARY KEY (`id`)
);

ALTER TABLE `goods` ADD `cat_id` `cat_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `goods` ADD `brand_id` `brand_id` BIGINT(20) UNSIGNED NULL DEFAULT NULL;

ALTER TABLE `goods` ADD INDEX(`cat_id`);
ALTER TABLE `goods` ADD INDEX(`brand_id`);

ALTER TABLE `goods` ADD CONSTRAINT `category`
FOREIGN KEY (`cat_id`) REFERENCES `categories`(`id`)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE `goods` ADD CONSTRAINT `brand`
FOREIGN KEY (`brand_id`) REFERENCES `brands`(`id`)
ON DELETE RESTRICT ON UPDATE CASCADE;
