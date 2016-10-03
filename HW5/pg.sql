ALTER TABLE "brands" ADD COLUMN "class" CHAR(1);

CREATE TABLE "orders" (
  "id" SERIAL,
  "oid" INTEGER NOT NULL, -- Номер заказа
  "dt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Дата и время
  "good_id" BIGINT NOT NULL, -- ID Товара
  PRIMARY KEY ("id")
);
