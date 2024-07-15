Delimiter $$
CREATE PROCEDURE CreatePerson()
BEGIN
DROP table if EXISTS persons;

create table persons(
id int auto_increment PRIMARY key,
first_name VARCHAR(255) not null,
last_name VARCHAR(255) not null
);

insert into persons(first_name,last_name)
VALUES
('sandeep','rao'),
('basil','ahamed'),
('siva','lingam'),
('steve','smith');

select id,CONCAT(first_name,'',last_name) as "pesron Name" from persons;

end$$
Delimiter ;

call CreatePerson();

+----+-------------+
| id | pesron Name |
+----+-------------+
|  1 | sandeeprao  |
|  2 | basilahamed |
|  3 | sivalingam  |
|  4 | stevesmith  |
+----+-------------+
4 rows in set (0.22 sec)

DROP PROCEDURE CreatePerson;