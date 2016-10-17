-- 1. добавляем поле для данных типа jsonb
ALTER TABLE "goods" ADD COLUMN "features" jsonb;

-- 1.1. пример для вставки данных
UPDATE "goods" SET "features" = '{"color":"red", "weight":"500", "size":"XL"}'::jsonb WHERE "id" = 1;

-- 3. материализированное представление, которое поля jsonb превратит в столбцы (color, size, weight)
CREATE MATERIALIZED VIEW "features_mvew" AS
SELECT id, features->>'color' AS color, features->>'size' AS size, features->>'weight' AS weight
FROM goods WITH DATA;
