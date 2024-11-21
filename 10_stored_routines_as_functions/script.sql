-- Write your SQL code here
DELIMITER $$

CREATE FUNCTION GetTotalStockValue()
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(Price * Stock) INTO total FROM Product;
    RETURN total;
END $$

DELIMITER ;
