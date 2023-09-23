--## Select

--0. Listar todos los registros de `staff` ordenado por `last_name`

select * from staff order by last_name ASC;


--1. Mostrar todos los pagos `payment` realizados en julio del 2005

select * from payment where strftime('%Y-%m',payment_date) = '2005-07';

--2. Identificar a que clientes `customer` se les alquilo `rental` la película "SILVERADO GOLDFINGER"

select c.customer_id, c.first_name, c.last_name, r.rental_date from customer as c join rental as r using(customer_id) join inventory as i using(inventory_id) join film as f using(film_id) where f.title = 'SILVERADO GOLDFINGER';

--## Insert

--0. Añadir diez miembros a `staff`

insert into staff
(staff_id,first_name,last_name,address_id,picture,email,store_id,active,username,password,last_update)
values
(3,'Staff3','Emply',3,23,'staff3@sakilastaff.com',1,1,'Staff3','abc1234','2023-09-13 00:27:12'),
(4,'Staff4','Hillyer',4,23,'staff4@sakilastaff.com',1,1,'Staff3','abc1234','2023-09-11 00:27:12'),
(5,'Staff3','Emply',3,23,'staff3@sakilastaff.com',1,1,'Staff3','abc1234','2023-09-13 00:27:12'),
(6,'Staff4','Hillyer',4,23,'staff4@sakilastaff.com',1,1,'Staff3','abc1234','2023-09-11 00:27:12'),
(7,'Staff3','Emply',3,23,'staff3@sakilastaff.com',1,1,'Staff3','abc1234','2023-09-13 00:27:12'),
(8,'Staff4','Hillyer',4,23,'staff4@sakilastaff.com',1,1,'Staff3','abc1234','2023-09-11 00:27:12'),
(9,'Staff3','Emply',3,23,'staff3@sakilastaff.com',1,1,'Staff3','abc1234','2023-09-13 00:27:12'),
(10,'Staff4','Hillyer',4,23,'staff4@sakilastaff.com',1,1,'Staff3','abc1234','2023-09-11 00:27:12');

--1. Dar de alta a una copia nueva de "SILVERADO GOLDFINGER" `inventory`

insert into inventory (inventory_id,film_id, store_id, last_update) values ((select max(inventory_id) from inventory) + 1, (select film_id from film where title = 'SILVERADO GOLDFINGER'),3, date('now'));

## Update

--0. Cambiar el nombre y el apellido de "ROCK" "DUKAKIS" a "PIEDRA" "DUKAKISS"

update actor set first_name = 'PIEDRA', last_name = 'DUKAKISS' where first_name = 'ROCK' and last_name = 'DUKAKIS';

-- 1. La dirección "544 Tarsus Boulevard" cambiar a "0x544 Tarsus Boulevard"

update address set address = "0x544 Tarsus Boulevard" where address = "544 Tarsus Boulevard";

--## Delete

--0. Eliminar los últimos 5 miembros nuevos de `staff`

delete from staff order by last_update DESC limit 5;