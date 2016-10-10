-- все товары из заданной категории (category id = 2)
SELECT * FROM goods WHERE 2 = ANY(categories);

-- все категории и количество товаров в каждой из них
SELECT categories.*, SUM(goods.amount) FROM categories
LEFT JOIN goods ON categories.id = ANY(goods.categories)
GROUP BY categories.id ORDER BY categories.id;

-- добавляющий определенный товар в определенную категорию
-- (добавляем товар с id = 1 в категорию с id = 6)
UPDATE goods
SET categories = array_append(categories, 6)
WHERE id = 1;
