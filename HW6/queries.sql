-- триггеры на таблицу товаров `goods`, которые будут при создании товара,
-- изменении его цены или удалении заполнять таблицу `gc_history`

DELIMITER //
-- на создание товара
CREATE TRIGGER
  `new_good`
AFTER INSERT ON `goods`
FOR EACH ROW
BEGIN
INSERT INTO `gc_history` (`good_id`, `event`, `oldprice`, `newprice`)
VALUES (NEW.id, 'create', NEW.oldprice, NEW.price);
END;//

-- на изменение цены товара
CREATE TRIGGER
  `change_price`
AFTER UPDATE ON `goods`
FOR EACH ROW
BEGIN
INSERT INTO `gc_history` (`good_id`, `event`, `oldprice`, `newprice`)
VALUES (NEW.id, 'price', OLD.price, NEW.price);
END;//

-- на удаление товара
CREATE TRIGGER
  `delete_good`
AFTER DELETE ON `goods`
FOR EACH ROW
BEGIN
INSERT INTO `gc_history` (`good_id`, `event`, `oldprice`, `newprice`)
VALUES (OLD.id, 'delete', OLD.oldprice, OLD.price);
END;//
DELIMITER ;

-- Создайте функцию "размер скидки", которая по ID товара будет вычислять - сколько составило
-- последнее изменение цены на него в процентах, используя запрос к таблице `gc_history`.
DELIMITER //
CREATE FUNCTION discount(gid BIGINT)
RETURNS FLOAT(20,2)
BEGIN
RETURN (
  SELECT (newprice - oldprice) / oldprice * 100
  FROM gc_history WHERE good_id = gid
  ORDER BY dt DESC LIMIT 1);
END;//
DELIMITER ;

-- Пример использования
SELECT `id`, `title`, `oldprice`, `price`, discount(`id`) as discount
FROM `goods` WHERE `cat_id` = 1;
