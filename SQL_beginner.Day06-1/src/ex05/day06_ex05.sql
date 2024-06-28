COMMENT ON TABLE person_discounts IS 'Таблица персональных скидок клиентов в каждой пиццерии';
COMMENT ON COLUMN person_discounts.id IS 'ID скидки';
COMMENT ON COLUMN person_discounts.person_id IS 'ID клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки (% от цены)';


-- Чтобы соответствовать политике управления данными,
-- добавьте комментарии на английском или русском языке (на ваше усмотрение), 
-- объясняющие, какова бизнес-цель таблицы person_discounts и всех ее атрибутов.