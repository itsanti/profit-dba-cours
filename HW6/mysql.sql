CREATE TABLE `gc_history` (
  `id` SERIAL,
  `good_id` BIGINT(20) NOT NULL, -- ID Товара
  `event` ENUM('create', 'price', 'delete'), -- Событие, случившееся с товаром
  `oldprice` DECIMAL(8, 2) UNSIGNED, -- Старая цена по событию price
  `newprice` DECIMAL(8, 2) UNSIGNED, -- Новая цена по событию price
  `dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Дата и время изменения
  PRIMARY KEY (`id`)
);
