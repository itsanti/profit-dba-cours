-- 1. ограничения на таблицу товаров
ALTER TABLE goods
ADD CONSTRAINT unsigned_price CHECK (price >= 0);

ALTER TABLE goods
ADD CONSTRAINT unsigned_oldprice CHECK (oldprice >= 0);

ALTER TABLE goods
ADD CONSTRAINT artcul_chk CHECK (char_length(productid) = 8);

ALTER TABLE goods
ADD CONSTRAINT unsigned_amount CHECK (amount >= 0);

-- 2. дополнительные ограничения
ALTER TABLE brands
ADD CONSTRAINT class_chk CHECK (class ~ '^[A-Z]$')

ALTER TABLE categories
ADD CONSTRAINT name_chk CHECK (char_length(name) >= 3);

-- 3. добавляем возможность хранить массив категорий
-- и специальный индекс для них. (ELEMENT REFERENCES для FK не сработал)
ALTER TABLE goods ADD COLUMN categories bigint[];

CREATE INDEX categories_idx ON goods USING gin (categories);