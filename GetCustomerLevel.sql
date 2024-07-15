use classicmodels;
drop PROCEDURE if EXISTS GetCustomerLevel;

delimiter $$
create PROCEDURE GetCustomerLevel(
IN pcustomernumber int,
OUT pcustomerlevel VARCHAR(20)
)
BEGIN
  declare credit DECIMAL(10,2) DEFAULT 0;
  select creditlimit into credit
  from customers where customernumber = pcustomernumber;
  
  if credit > 50000 THEN
	set pcustomerlevel = 'PLATINUM';
  ELSEIF credit <=50000 and credit > 10000 THEN
	set pcustomerlevel='Gold';
  Else
	set pcustomerlevel='Silver';
  END IF;
  
end$$
delimiter ;

call GetCustomerLevel(484,@level);

 select @level;
+----------+
| @level   |
+----------+
| PLATINUM |
+----------+
1 row in set (0.00 sec)

----------------using Function-----------------------------------------------------
use classicmodels;
drop FUNCTION if EXISTS CustomerLevel;

delimiter $$
create FUNCTION CustomerLevel(
credit DECIMAL(10,2)
)
RETURNS VARCHAR(20)
deterministic
BEGIN
  declare customerLevel VARCHAR(20);
  
  
  if credit > 50000 THEN
	set customerlevel = 'PLATINUM';
  ELSEIF credit <=50000 and credit > 10000 THEN
	set customerlevel='Gold';
  Else
	set customerlevel='Silver';
  END IF;
  RETURN(customerLevel);
  
end$$
delimiter ;
select customerName, customerlevel(creditlimit) from customers;
+------------------------------------+----------------------------+
| customerName                       | customerlevel(creditlimit) |
+------------------------------------+----------------------------+
| Atelier graphique                  | Gold                       |
| Signal Gift Stores                 | PLATINUM                   |
| Australian Collectors, Co.         | PLATINUM                   |
| La Rochelle Gifts                  | PLATINUM                   |
| Baane Mini Imports                 | PLATINUM                   |
| Mini Gifts Distributors Ltd.       | PLATINUM                   |
| Havel & Zbyszek Co                 | Silver                     |
| Blauer See Auto, Co.               | PLATINUM                   |
| Mini Wheels Co.                    | PLATINUM                   |
| Land of Toys Inc.                  | PLATINUM                   |
| Euro+ Shopping Channel             | PLATINUM                   |
| Volvo Model Replicas, Co           | PLATINUM                   |
| Danish Wholesale Imports           | PLATINUM                   |
| Saveley & Henriot, Co.             | PLATINUM                   |
| Dragon Souveniers, Ltd.            | PLATINUM                   |
| Muscle Machine Inc                 | PLATINUM                   |
| Diecast Classics Inc.              | PLATINUM                   |
| Technics Stores Inc.               | PLATINUM                   |
| Handji Gifts& Co                   | PLATINUM                   |
| Herkku Gifts                       | PLATINUM                   |
| American Souvenirs Inc             | Silver                     |
| Porto Imports Co.                  | Silver                     |
| Daedalus Designs Imports           | PLATINUM                   |
| La Corne D'abondance, Co.          | PLATINUM                   |
| Cambridge Collectables Co.         | Gold                       |
| Gift Depot Inc.                    | PLATINUM                   |
| Osaka Souveniers Co.               | PLATINUM                   |
| Vitachrome Inc.                    | PLATINUM                   |
| Toys of Finland, Co.               | PLATINUM                   |
| AV Stores, Co.                     | PLATINUM                   |
| Clover Collections, Co.            | PLATINUM                   |
| Auto-Moto Classics Inc.            | Gold                       |
| UK Collectables, Ltd.              | PLATINUM                   |
| Canadian Gift Exchange Network     | PLATINUM                   |
| Online Mini Collectables           | PLATINUM                   |
| Toys4GrownUps.com                  | PLATINUM                   |
| Asian Shopping Network, Co         | Silver                     |
| Mini Caravy                        | PLATINUM                   |
| King Kong Collectables, Co.        | PLATINUM                   |
| Enaco Distributors                 | PLATINUM                   |
| Boards & Toys Co.                  | Gold                       |
| Nat├╝rlich Autos                   | Silver                     |
| Heintze Collectables               | PLATINUM                   |
| Qu├®bec Home Shopping Network      | Gold                       |
| ANG Resellers                      | Silver                     |
| Collectable Mini Designs Co.       | PLATINUM                   |
| giftsbymail.co.uk                  | PLATINUM                   |
| Alpha Cognac                       | PLATINUM                   |
| Messner Shopping Network           | Silver                     |
| Amica Models & Co.                 | PLATINUM                   |
| Lyon Souveniers                    | PLATINUM                   |
| Auto Associ├®s & Cie.              | PLATINUM                   |
| Toms Spezialit├ñten, Ltd           | PLATINUM                   |
| Royal Canadian Collectables, Ltd.  | PLATINUM                   |
| Franken Gifts, Co                  | Silver                     |
| Anna's Decorations, Ltd            | PLATINUM                   |
| Rovelli Gifts                      | PLATINUM                   |
| Souveniers And Things Co.          | PLATINUM                   |
| Marta's Replicas Co.               | PLATINUM                   |
| BG&E Collectables                  | Silver                     |
| Vida Sport, Ltd                    | PLATINUM                   |
| Norway Gifts By Mail, Co.          | PLATINUM                   |
| Schuyler Imports                   | Silver                     |
| Der Hund Imports                   | Silver                     |
| Oulu Toy Supplies, Inc.            | PLATINUM                   |
| Petit Auto                         | PLATINUM                   |
| Mini Classics                      | PLATINUM                   |
| Mini Creations Ltd.                | PLATINUM                   |
| Corporate Gift Ideas Co.           | PLATINUM                   |
| Down Under Souveniers, Inc         | PLATINUM                   |
| Stylish Desk Decors, Co.           | PLATINUM                   |
| Tekni Collectables Inc.            | Gold                       |
| Australian Gift Network, Co        | PLATINUM                   |
| Suominen Souveniers                | PLATINUM                   |
| Cramer Spezialit├ñten, Ltd         | Silver                     |
| Classic Gift Ideas, Inc            | PLATINUM                   |
| CAF Imports                        | PLATINUM                   |
| Men 'R' US Retailers, Ltd.         | PLATINUM                   |
| Asian Treasures, Inc.              | Silver                     |
| Marseille Mini Autos               | PLATINUM                   |
| Reims Collectables                 | PLATINUM                   |
| SAR Distributors, Co               | Silver                     |
| GiftsForHim.com                    | PLATINUM                   |
| Kommission Auto                    | Silver                     |
| Gifts4AllAges.com                  | Gold                       |
| Online Diecast Creations Co.       | PLATINUM                   |
| Lisboa Souveniers, Inc             | Silver                     |
| Precious Collectables              | Silver                     |
| Collectables For Less Inc.         | PLATINUM                   |
| Royale Belge                       | Gold                       |
| Salzburg Collectables              | PLATINUM                   |
| Cruz & Sons Co.                    | PLATINUM                   |
| L'ordine Souveniers                | PLATINUM                   |
| Tokyo Collectables, Ltd            | PLATINUM                   |
| Auto Canal+ Petit                  | PLATINUM                   |
| Stuttgart Collectable Exchange     | Silver                     |
| Extreme Desk Decorations, Ltd      | PLATINUM                   |
| Bavarian Collectables Imports, Co. | PLATINUM                   |
| Classic Legends Inc.               | PLATINUM                   |
| Feuer Online Stores, Inc           | Silver                     |
| Gift Ideas Corp.                   | Gold                       |
| Scandinavian Gift Ideas            | PLATINUM                   |
| The Sharp Gifts Warehouse          | PLATINUM                   |
| Mini Auto Werke                    | Gold                       |
| Super Scale Inc.                   | PLATINUM                   |
| Microscale Inc.                    | Gold                       |
| Corrida Auto Replicas, Ltd         | PLATINUM                   |
| Warburg Exchange                   | Silver                     |
| FunGiftIdeas.com                   | PLATINUM                   |
| Anton Designs, Ltd.                | Silver                     |
| Australian Collectables, Ltd       | PLATINUM                   |
| Frau da Collezione                 | Gold                       |
| West Coast Collectables Co.        | PLATINUM                   |
| Mit Vergn├╝gen & Co.               | Silver                     |
| Kremlin Collectables, Co.          | Silver                     |
| Raanan Stores, Inc                 | Silver                     |
| Iberia Gift Imports, Corp.         | PLATINUM                   |
| Motor Mint Distributors Inc.       | PLATINUM                   |
| Signal Collectibles Ltd.           | PLATINUM                   |
| Double Decker Gift Stores, Ltd     | Gold                       |
| Diecast Collectables               | PLATINUM                   |
| Kelly's Gift Shop                  | PLATINUM                   |
+------------------------------------+----------------------------+
122 rows in set (0.08 sec)