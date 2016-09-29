-- все товары с указанием их категории и бренда
SELECT g.*, c.name AS category, b.name AS brand
FROM goods AS g
INNER JOIN categories AS c ON g.cat_id = c.id
INNER JOIN brands AS b ON g.brand_id = b.id;

-- все товары, бренд которых начинается на букву "А"
SELECT * FROM goods WHERE brand_id IN (
    SELECT id FROM brands WHERE LEFT(name, 1) = 'A'
);

-- список категорий и число товаров в каждой (используйте подзапросы и функцию COUNT(), использовать группировку нельзя)
SELECT c.name, (
  SELECT COUNT(*) FROM goods AS g
  WHERE g.cat_id = c.id) AS goods_count
FROM categories AS c;

-- для каждой категории список брендов товаров, входящих в нее
-- TODO: пока придумал как выбрать список брендов для конкретной категории
-- через UNION решение явно неверное
SELECT DISTINCT brand_id FROM goods WHERE cat_id = 1
