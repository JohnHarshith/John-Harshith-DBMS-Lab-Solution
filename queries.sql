-- 3) Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000.
SELECT cust.CUS_GENDER,COUNT(cust.CUS_GENDER) AS COUNT FROM customer cust
INNER JOIN `order` ON cust.CUS_ID = `order`.CUS_ID 
WHERE `order`.ORD_AMOUNT >= 3000 GROUP BY cust.CUS_GENDER;

-- 4) Display all the orders along with the product name ordered by a customer having Customer_Id=2.
SELECT `order`.*,product.PRO_NAME FROM `order`,product_details,product
WHERE `order`.CUS_ID = 2 AND `order`.PROD_ID = product_details.PROD_ID
AND product_details.PROD_ID = product.PRO_ID;

-- 5) Display the Supplier details who can supply more than one product.
SELECT supplier.* FROM supplier,product_details WHERE supplier.SUPP_ID
IN (SELECT product_details.SUPP_ID FROM product_details 
GROUP BY product_details.SUPP_ID HAVING COUNT(product_details.SUPP_ID)>1) 
GROUP BY supplier.SUPP_ID;

-- 6) Find the category of the product whose order amount is minimum.
SELECT category.* from `order` INNER JOIN product_details 
ON `order`.PROD_ID = product_details.PROD_ID 
INNER JOIN product ON product.PRO_ID = product_details.PRO_ID 
INNER JOIN category ON category.CAT_ID = product.CAT_ID
ORDER BY `order`.ORD_AMOUNT limit 1;

-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.
SELECT product.PRO_ID,product.PRO_NAME FROM `order` 
INNER JOIN product_details ON `order`.PROD_ID = product_details.PROD_ID
INNER JOIN product ON product.PRO_ID = product_details.PRO_ID
WHERE `order`.ORD_DATE > '2021-10-05';

-- 8) Display customer name and gender whose names start or end with character 'A'.
SELECT cust.CUS_NAME,cust.CUS_GENDER FROM customer cust 
WHERE cust.CUS_NAME LIKE 'A%' OR cust.CUS_NAME LIKE '%A';

-- 9) Create a stored procedure to display the Rating for a Supplier if any along with the Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.
SELECT supplier.SUPP_ID,supplier.SUPP_NAME,rating.RAT_RATSTARS,
CASE
WHEN rating.RAT_RATSTARS > 4 THEN 'Genuine Supplier'
WHEN rating.RAT_RATSTARS > 2 THEN 'Average Supplier'
ELSE 'Supplier should not be considered'
END AS VERDICT FROM rating 
INNER JOIN supplier ON supplier.SUPP_ID = rating.SUPP_ID;
CALL new_procedure()