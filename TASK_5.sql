/*
Задание 5
Используя базу данных carsshop создайте функцию для нахождения минимального возраста клиента, 
затем сделайте выборку всех машин, которые он купил.
*/

drop database carsshop;
create database carsshop; 
use carsshop; 
create table marks(
   id_marks int not null auto_increment primary key,
   mark varchar(20) unique
);
create table cars(
  id_cars INT NOT NULL auto_increment primary key,
  mark_id INT NOT NULL,
  model varchar(20) NOT NULL,
  price INT NOT NULL,
  foreign key(mark_id) references marks(id_marks)
);
CREATE TABLE clients
(	
	 id_clients INT AUTO_INCREMENT NOT NULL,
     name VARCHAR(30),
     age TINYINT,
     phone VARCHAR(15),
     PRIMARY KEY (id_clients)
); 
create table orders(
     id_orders int not null primary key auto_increment,
     car_id int not null,
     client_id int not null,
     foreign key(car_id) references cars(id_cars),
     foreign key(client_id) references clients(id_clients)
); 

INSERT into marks(mark) values
('Audi'),
('Porsche');

insert into cars(mark_id, model, price) values 
(1, 'A5', 50000),
(2, 'panamera', 100000),
(2, 'caymen S', 88000);

insert into clients(name, age) values 
('petro', 20),
('vasya', 25),
('vitaly', 75);
SELECT * FROM  carsshop.clients;

insert into orders(car_id, client_id) values
(1, 1),
(2, 2), 
(1, 3);
-- SELECT * FROM  carsshop.orders;
-- drop table orders;

-- DELIMITER |
-- DROP FUNCTION miAge; |

DELIMITER |
CREATE FUNCTION miAge() 
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
   RETURN (SELECT  min(age) FROM clients );
END
|

select mark from marks where id_marks = 
(select mark_id from cars where id_cars = 
(SELECT car_id from orders where client_id = 
(SELECT id_clients FROM clients where age = miAge()) ));|



