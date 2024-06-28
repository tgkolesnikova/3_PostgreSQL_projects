CREATE TABLE IF NOT EXISTS person_discounts
( id 			bigint primary key ,
  person_id 	bigint ,
  pizzeria_id 	bigint ,
  discount    	numeric,
 
  CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
  CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
);


-- создать новую реляционную таблицу (задайте имя person_discounts)