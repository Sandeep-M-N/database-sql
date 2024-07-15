use classicmodels;
drop PROCEDURE if EXISTS GetCustomerShipping;

delimiter $$
create PROCEDURE GetCustomerShipping(
IN pcustomernumber int,
OUT pshipping VARCHAR(250)
)
BEGIN
  declare customercountry VARCHAR(100);
  select country into customercountry
  from customers where customernumber = pcustomernumber;
  
  case customercountry
	WHEN 'USA' THEN
		SET pshipping = '2_day shipping';
	WHEN 'CANADA' THEN
		SET pshipping = '3-day shipping';
	WHEN 'Belgium' or 'Italy' THEN
		SET pshipping = '4-day shipping';
	ELSE
		SET pshipping = '5-day shipping'; 
  END case;
  
end$$
delimiter ;

call GetCustomerShipping(202,@shippingduration);
select @shippingduration;
+-------------------+
| @shippingduration |
+-------------------+
| 3-day shipping    |
+-------------------+
1 row in set (0.00 sec)

-------------------------------------------------------------------------------------------
Assignment 
use classicmodels;
drop PROCEDURE if EXISTS DeliveryDate;

delimiter $$
Create PROCEDURE DeliveryDate(
IN porderNumber int,
OUT Expected_delivery VARCHAR(255)
)
BEGIN
	declare deliverDate int DEFAULT 0;
	SELECT DATEDIFF(requiredDate,shippedDate) into deliverDate
	from orders where orderNumber = porderNumber;
	
	insert into temp values(deliverDate);
	
	CASE 
		WHEN deliverDate < 0 THEN
			SET Expected_delivery = 'before time';
		WHEN deliverDate = 0 THEN
			SET Expected_delivery = 'on-time';
		WHEN deliverDate >=1 and deliverDate <=3 THEN
			SET Expected_delivery = 'late-time';
		ELSE
			SET Expected_delivery='too-late';
	END CASE;
	
end$$
delimiter ;
call DeliveryDate(10100,@delivery);
select @delivery;

//NOTE: when using string only we use variable name near case; 
	