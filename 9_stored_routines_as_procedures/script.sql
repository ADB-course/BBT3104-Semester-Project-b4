-- Write your SQL code here
DELIMITER $$

CREATE PROCEDURE AddProduct (
    IN p_ProductName VARCHAR(100),
    IN p_Price DECIMAL(10, 2),
    IN p_SupplierID INT
)
BEGIN
    INSERT INTO Product (ProductName, Price, SupplierID)
    VALUES (p_ProductName, p_Price, p_SupplierID);
END $$

DELIMITER ;
