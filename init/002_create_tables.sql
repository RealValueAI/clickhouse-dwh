DROP TABLE IF EXISTS dwh.platforms;
CREATE TABLE IF NOT EXISTS dwh.platforms (
    platform_id UInt32,          -- Уникальный идентификатор платформы
    platform_name String,        -- Название платформы (DomClick, Avito, Cian, Yandex Realty)
    platform_url String DEFAULT ''
)
ENGINE = MergeTree()
ORDER BY platform_id;

-- Заполняем справочник источников данными
INSERT INTO dwh.platforms (platform_id, platform_name, platform_url) VALUES (1, 'DomClick', 'https://www.domclick.ru');
INSERT INTO dwh.platforms (platform_id, platform_name, platform_url) VALUES (2, 'Avito', 'https://www.avito.ru');
INSERT INTO dwh.platforms (platform_id, platform_name, platform_url) VALUES (3, 'Cian', 'https://www.cian.ru');
INSERT INTO dwh.platforms (platform_id, platform_name, platform_url) VALUES (4, 'Yandex Realty', 'https://realty.yandex.ru');
