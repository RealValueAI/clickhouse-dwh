CREATE DATABASE IF NOT EXISTS dwh;

DROP TABLE IF EXISTS dwh.listings;
CREATE TABLE IF NOT EXISTS dwh.listings (
    uid UUID,                      -- Уникальный идентификатор записи, отличный от listing_id
    listing_id UInt64,             -- Уникальный идентификатор объявления (Object ID)
    platform_id UInt32,            -- Идентификатор платформы, на которой размещено объявление (DomClick, Avito и т.д.)
    listing_url String,            -- URL объявления
    price Decimal(18, 2),          -- Стоимость объекта недвижимости (Price)
    price_per_sqm Decimal(18, 2),  -- Цена за квадратный метр (Price per sqm)
    mortgage_rate Float32 DEFAULT 0,  -- Ставка ипотеки (Mortgage Rate)
    address String,                -- Адрес недвижимости (Address)
    address_id UInt64,             -- Идентификатор адреса (Address ID)
    area Float32,                  -- Площадь недвижимости в квадратных метрах (Area)
    rooms UInt8,                   -- Количество комнат (Rooms)
    floor UInt8,                   -- Этаж недвижимости (Floor)
    description String DEFAULT '', -- Описание недвижимости (Description)
    published_date Date DEFAULT '1970-01-01',  -- Дата публикации (Published Date)
    updated_date Date DEFAULT '1970-01-01',    -- Дата обновления (Updated Date)
    seller_id UInt64,              -- Идентификатор продавца (Seller ID)
    seller_name_hash String,       -- Хэш имени продавца (Seller Name Hash)
    company_name String DEFAULT '',-- Название компании (Company Name)
    company_id UInt64,             -- Идентификатор компании (Company ID)
    property_type Enum('Unknown' = 0, 'Apartment' = 1, 'House' = 2, 'Commercial' = 3) DEFAULT 'Unknown',  -- Тип недвижимости
    category Enum('Unknown' = 0, 'Sale' = 1, 'Rent' = 2) DEFAULT 'Unknown',  -- Категория недвижимости
    house_floors UInt8,            -- Количество этажей в доме (House Floors)
    deal_type Enum('Unknown' = 0, 'Sale' = 1, 'Lease' = 2) DEFAULT 'Unknown', -- Тип сделки
    discount_status Enum('Unknown' = 0, 'None' = 1, 'Active' = 2, 'Expired' = 3) DEFAULT 'Unknown',  -- Статус скидки
    discount_value Float32 DEFAULT 0, -- Значение скидки (Discount Value)
    placement_paid UInt8 DEFAULT 0,  -- Платное размещение (Placement Paid)
    big_card UInt8 DEFAULT 0,        -- Флаг большого карточного размещения (Big Card)
    pin_color Enum('Unknown' = 0, 'Red' = 1, 'Blue' = 2, 'Green' = 3, 'Yellow' = 4) DEFAULT 'Unknown',  -- Цвет пина
    longitude Float64,               -- Долгота объекта (Longitude)
    latitude Float64,                -- Широта объекта (Latitude)
    subway_distances Array(Float32), -- Расстояния до ближайших станций метро (Subway Distances)
    subway_names Array(String),      -- Названия станций метро (Subway Names)
    photo_urls Array(String),        -- Массив ссылок на фотографии (Photos URLs)
    monthly_payment Decimal(18, 2) DEFAULT 0, -- Ежемесячный платеж (Monthly Payment)
    advance_payment Decimal(18, 2) DEFAULT 0, -- Авансовый платеж (Advance Payment)
    auction_status Enum('Unknown' = 0, 'None' = 1, 'Active' = 2, 'Finished' = 3) DEFAULT 'Unknown', -- Статус аукциона
    created_at DateTime DEFAULT now() -- Время создания записи (временная метка)
)
ENGINE = MergeTree()
ORDER BY listing_id;
