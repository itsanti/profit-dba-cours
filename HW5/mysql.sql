ALTER TABLE `brnads` ADD `class` CHAR(1) NOT NULL AFTER `name`;

CREATE TABLE `orders` (
  `id` SERIAL,
  `oid` INT(11) NOT NULL, -- Номер заказа
  `dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Дата и время
  `good_id` BIGINT(20) NOT NULL, -- ID Товара
  PRIMARY KEY (`id`)
);
