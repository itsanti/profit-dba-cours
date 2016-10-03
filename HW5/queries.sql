-- Запрос, который выберет категории и среднюю цену товаров в каждой категории,
-- при условии, что эта средняя цена менее 1000 рублей (выбираем "бюджетные" категории товаров)
SELECT categories.*, AVG(goods.price) AS avg_price
FROM categories
LEFT JOIN goods ON categories.id = goods.cat_id
GROUP BY categories.id
HAVING avg_price < 1000

-- Улучшите предыдущий запрос таким образом, чтобы в расчет средней цены включались только товары, имеющиеся на складе.
SELECT categories.*, AVG(IF(goods.amount > 0, goods.price, NULL)) AS avg_price
FROM categories
LEFT JOIN goods ON categories.id = goods.cat_id
GROUP BY categories.id
HAVING avg_price < 1000

-- или с помощью фильтра WHERE. В частности для PostgreSQL
SELECT categories.*, AVG(goods.price) AS avg_price
FROM categories
LEFT JOIN goods ON categories.id = goods.cat_id
WHERE goods.amount > 0
GROUP BY categories.id
HAVING avg_price < 1000

-- запрос, который для каждой категории и класса брендов, представленных в категории выберет среднюю цену товаров.
SELECT categories.*, brands.class, AVG(goods.price) AS avg_price
FROM categories
LEFT JOIN goods ON goods.cat_id = categories.id
LEFT JOIN brands ON goods.brand_id = brands.id
GROUP BY categories.id, brands.class

-- запрос, который выведет таблицу с полями "дата", "число заказов за дату", "сумма заказов за дату"
SELECT DATE(orders.dt) AS order_date, COUNT(orders.oid) AS amount, SUM(goods.price) AS total_price
FROM orders
LEFT JOIN goods ON orders.good_id = goods.id
GROUP BY DATE(orders.dt)
