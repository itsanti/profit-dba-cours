CREATE TABLE "goods" (
  "id"    SERIAL,
  "title" VARCHAR(255), -- Наименование
  "productid"  CHAR(8) NOT NULL, -- Артикул (внутренний код)
  "image" VARCHAR(100), -- Изображение
  "price" NUMERIC(8, 2), -- Цена
  "oldprice" NUMERIC(8, 2) DEFAULT NULL, -- Старая цена
  "saledate" DATE, -- Дата появления в продаже
  "amount" SMALLINT, -- Количество на складе
   PRIMARY KEY ("id")
);
