--
-- тестирование на запросах
-- RESET QUERY CACHE;
-- полезно почитать https://habrahabr.ru/post/203320/
--
-- MySQL
-- 10 самых новых товаров
SELECT * FROM `goods` ORDER BY `saledate` DESC LIMIT 10
-- EXPLAIN: была просканирована вся таблица, использовалась дополнитьльная
-- файловая сортировка для ORDER BY ... DESC. Запрос занял 0.0010 сек.
-- Добавляем индекс на поле даты поступления в продажу:
-- ALTER TABLE `goods` ADD INDEX(`saledate`);
-- EXPLAIN: сканировались все записи, т.к. индекс хранится в порядке ASC

-- 10 самых дешевых товаров
SELECT * FROM `goods` ORDER BY `price` LIMIT 10
-- EXPLAIN: была просканирована вся таблица, использовалась дополнитьльная
-- файловая сортировка для ORDER BY. Запрос занял 0.0010 сек.
-- Добавляем индекс на поле цены
-- ALTER TABLE `goods` ADD INDEX(`price`);
-- EXPLAIN: индекс не использовался

-- 10 товаров, цена на которых была максимально снижена (в абсолютном или относительном смысле)
SELECT *, (`oldprice` - `price`)
FROM `goods`
WHERE `oldprice` IS NOT NULL
ORDER BY (`oldprice` - `price`) DESC LIMIT 10
-- EXPLAIN: была просканирована вся таблица, использовалась дополнитьльная
-- файловая сортировка для ORDER BY. Запрос занял 0.0010 сек.
-- Добавляем индекс на поле старой цены
-- ALTER TABLE `goods` ADD INDEX(`oldprice`);
-- EXPLAIN: индекс не использовался, в качестве возможного индекса был выбран индекс oldprice

-- Товары, чей артикул начинается с символов "TEST", используя оператор LIKE
SELECT * FROM `goods`
WHERE `productid` LIKE 'TEST%'
-- EXPLAIN: была просканирована вся таблица. Запрос занял 0.0030 сек.
-- Добавляем уникальный индекс на поле артикула:
-- ALTER TABLE `goods` ADD UNIQUE(`productid`);
-- EXPLAIN: было отобрано ровно 135 записей, используя уникальный индекс. Запрос занял 0.0010 сек.

--
-- PostgreSQL
-- EXPLAIN (FORMAT TEXT, ANALYZE)
-- 10 самых новых товаров
SELECT * FROM "goods" ORDER BY "saledate" DESC LIMIT 10
-- EXPLAIN: была просканирована вся таблица. Total query runtime: 11 msec
-- Добавляем индекс на поле даты поступления в продажу:
-- CREATE INDEX salesate_indx ON public.goods USING btree (saledate DESC NULLS LAST);
-- EXPLAIN: сканировалась вся таблица
-- CREATE INDEX saledate_indx ON public.goods USING btree (saledate);
-- EXPLAIN: для выбора использовался индекс - Index Scan Backward using saledate on goods

-- 10 самых дешевых товаров
SELECT * FROM "goods" ORDER BY "price" LIMIT 10
-- EXPLAIN: была просканирована вся таблица, Total query runtime: 10 msec
-- Добавляем индекс на поле цены
-- CREATE INDEX price_indx ON public.goods USING btree (price);
-- EXPLAIN: как и в случае с "saledate" использовался индекс Index Scan using price on goods

-- 10 товаров, цена на которых была максимально снижена (в абсолютном или относительном смысле)
SELECT *, ("oldprice" - "price")
FROM "goods"
WHERE "oldprice" IS NOT NULL
ORDER BY ("oldprice" - "price") DESC LIMIT 10
-- EXPLAIN: была просканирована вся таблица, Total query runtime: 10 msec
-- Добавляем индекс на поле старой цены
-- CREATE INDEX oldprice_indx ON public.goods USING btree (oldprice);
-- EXPLAIN: индекс не использовался

-- Товары, чей артикул начинается с символов "TEST", используя оператор LIKE
SELECT * FROM "goods"
WHERE "productid" LIKE 'TEST%'
-- EXPLAIN: была просканирована вся таблица. Total query runtime: 11 msec
-- Добавляем уникальный индекс на поле артикула:
-- CREATE UNIQUE INDEX productid_indx ON public.goods USING btree (productid COLLATE pg_catalog."default" bpchar_pattern_ops);
-- EXPLAIN: индекс использовался только с параметром bpchar_pattern_ops
