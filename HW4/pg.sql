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

CREATE TABLE "categories" (
  "id"    SERIAL,
  "name"  VARCHAR(255), -- Название категории
  PRIMARY KEY ("id")
);

CREATE TABLE "brands" (
  "id"    SERIAL,
  "name" VARCHAR(255), -- Название бренда
  PRIMARY KEY ("id")
);

ALTER TABLE "goods" ADD COLUMN "cat_id"   INTEGER DEFAULT NULL;
ALTER TABLE "goods" ADD COLUMN "brand_id" INTEGER DEFAULT NULL;

CREATE INDEX "fki_category" ON "goods" ("cat_id");
CREATE INDEX "fki_brand" ON "goods" ("brand_id");

ALTER TABLE "goods"
ADD CONSTRAINT "category" FOREIGN KEY ("cat_id") REFERENCES "categories" ("id")
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "goods"
ADD CONSTRAINT "brand" FOREIGN KEY ("brand_id") REFERENCES "brands" ("id")
ON UPDATE CASCADE ON DELETE RESTRICT;
