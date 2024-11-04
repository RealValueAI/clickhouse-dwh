CREATE DATABASE IF NOT EXISTS dwh;

CREATE TABLE IF NOT EXISTS dwh.listings (
    listing_id UInt64,                -- Уникальный идентификатор объявления
    platform_id UInt32,               -- Идентификатор платформы, на которой размещено объявление
    listing_url String,               -- URL объявления
    photo_urls Array(String),         -- Массив ссылок на фотографии
    price Float64,                    -- Стоимость объекта недвижимости
    property_type_id UInt32,          -- Идентификатор Типа недвижимости (квартира, дом и т.д.)
    area Float32,                     -- Площадь недвижимости в квадратных метрах
    rooms UInt8,                      -- Количество комнат
    bathrooms UInt8,                  -- Количество ванных комнат
    address String,                  -- адрес недвижимости
    description String,               -- Описание недвижимости
    created_at DateTime DEFAULT now() -- Время создания записи (временная метка)
)
ENGINE = MergeTree()
ORDER BY listing_id;
