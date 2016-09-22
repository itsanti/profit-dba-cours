--
-- тестирование на запросах
--

-- MySQL
INSERT INTO `goods`
  (`title`, `productid`, `image`, `price`, `saledate`, `amount`)
VALUES
  -- ошибка вставки #1264 - Out of range value for column 'price' at row 1
  ('test', 'AABBCCDD', 'images/AA/1000.jpg', -20, '2017-01-01', 1),
  -- ошибка вставки #1264 - Out of range value for column 'amount' at row 1
  -- 70000 не помещается в 2 байта
  ('test', 'AABBCCDD', 'images/AA/1000.jpg', 20, '2017-01-01', 70000),
  -- ошибка вставки #1048 - Column 'productid' cannot be null
  ('test', NULL, 'images/AA/1000.jpg', 20, '2017-01-01', 11),
  -- ошибка вставки #1406 - Data too long for column 'productid' at row 1
  -- пытаемся вставить товар с артиклом больше 8 символов
  ('test', 'dddfffeee', 'images/AA/1000.jpg', 20, '2017-01-01', 11),
  -- ошибка вставки #1406 - Data too long for column 'image' at row 1
  ('test', 'dddfffee', REPEAT('A', 101), 20, '2017-01-01', 11),
  -- значение цены будет округлено до 20.35
  ('test', 'dddfffee', REPEAT('A', 2), 20.345, '2017-01-01', 11),
  -- ошибка вставки #1292 - Incorrect date value: '2017-12-32' for column 'saledate' at row 1
  ('test', 'dddfffee', REPEAT('A', 2), 20.345, '2017-12-32', 11);

-- PostgreSQL
INSERT INTO "goods"
  ("title", "productid", "image", "price", "saledate", "amount")
VALUES
  -- вставка без ошибки, т.к. нет UNSIGNED
  ('test', 'AABBCCDD', 'images/AA/1000.jpg', -20, '2017-01-01', 1),
  -- ошибка вставки ERROR 22003: smallint out of range
  ('test', 'AABBCCDD', 'images/AA/1000.jpg', 20, '2017-01-01', 70000),
  -- ошибка вставки ERROR 23502: null value in column "productid" violates not-null constraint
  ('test', NULL, 'images/AA/1000.jpg', 20, '2017-01-01', 11),
  -- ошибка вставки ERROR 22001: value too long for type character(8)
  ('test', 'dddfffeee', 'images/AA/1000.jpg', 20, '2017-01-01', 11),
  -- ошибка вставки ERROR 22001: value too long for type character varying(100)
  ('test', 'dddfffee', REPEAT('A', 101), 20, '2017-01-01', 11),
  -- значение цены будет округлено до 20.35
  ('test', 'dddfffee', REPEAT('A', 2), 20.345, '2017-01-01', 11),
  -- ошибка вставки ERROR 22008: date/time field value out of range: "2017-12-32"
  ('test', 'dddfffee', REPEAT('A', 2), 20.345, '2017-12-32', 11);

-- SQLite
INSERT INTO `goods`
  (`title`, `productid`, `image`, `price`, `saledate`, `amount`)
VALUES
  -- вставка без ошибки
  ('test', 'AABBCCDD', 'images/AA/1000.jpg', -20, '2017-01-01', 1),
  -- вставка без ошибки т.к. объем памяти для хранения зависит от величины значения
  ('test', 'AABBCCDD', 'images/AA/1000.jpg', 20, '2017-01-01', 70000),
  -- ошибка вставки NOT NULL constraint failed: goods.productid: INSERT INTO `goods`
  ('test', NULL, 'images/AA/1000.jpg', 20, '2017-01-01', 11),
  -- вставка без ошибки, т.к. всё хранится в TEXT без ограничения по размеру строки
  ('test', 'dddfffeee', 'images/AA/1000.jpg', 20, '2017-01-01', 11),
  -- вставка без ошибки т.к. DATE хранится как текст
  ('test', 'dddfffee', 'images/AA/1000.jpg', 20, '2017-12-32', 11),
  -- вместо даты будет вставлено значение NULL
  -- поэтому для поля нужно поставить NOT NULL, чтобы в случае неправильной даты возникла ошибка вставки
  ('test', 'dddfffee', 'images/AA/1000.jpg', 20, DATE('2017-12-32'), 11);
