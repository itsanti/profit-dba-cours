-- 2.1 товары, у которых есть характеристика цвет, но нет размера
SELECT * FROM goods WHERE features ? 'color' AND features->'size' IS NULL;

-- 2.2 товары, у которых вес не более килограмма
SELECT * FROM goods WHERE (features->>'weight')::int <= 1000;

-- 2.3 товары красного цвета и размера XXL
-- через обычное сравнение
SELECT * FROM goods WHERE features->>'color' = 'red' AND features->>'size' = 'XXL';
-- через вхождение массива {"color":"red", "size":"XXL"}
SELECT * FROM goods WHERE features @> '{"color":"red", "size":"XXL"}'::jsonb;

-- 4 Используя оконные функции напишите запрос, который вернет все товары
-- и для каждого - его долю в процентах в общей стоимости товаров такого же цвета
SELECT *, ROUND(price*amount/total * 100, 2) FROM (
  SELECT *, SUM(price*amount) OVER (PARTITION BY features->'color') AS total FROM goods
) AS w;
