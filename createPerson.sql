Delimiter $$
CREATE PROCEDURE CreatePerson()
BEGIN
DROP table if EXISTS persons;
create table persons(
id int auto_increment PRIMARY key,
first_name VARCHAR(255) not null,
last_name VARCHAR(255) nit null,
);

insert into persons(first_name,last_name)
VALUES
('sandeep','rao'),
('basil','ahamed'),
('siva','lingam'),
('steve','smith');

select id,CONCAT(first_name,'',second_name) as "pesron Name" from persons;

end$$;
Delimiter ;

