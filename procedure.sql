-- Stored procedure created in the order-directory database ->
CREATE PROCEDURE `new_procedure` ()
BEGIN
SELECT supplier.SUPP_ID,supplier.SUPP_NAME,rating.RAT_RATSTARS,
CASE
WHEN rating.RAT_RATSTARS > 4 THEN 'Genuine Supplier'
WHEN rating.RAT_RATSTARS > 2 THEN 'Average Supplier'
ELSE 'Supplier should not be considered'
END AS VERDICT FROM rating 
INNER JOIN supplier ON supplier.SUPP_ID = rating.SUPP_ID;
END
