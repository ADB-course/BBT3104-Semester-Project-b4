-- Write your SQL code here
CREATE TRIGGER before_insert_employee_performance
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF NEW.performanceRating > 5 OR NEW.performanceRating < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Performance rating must be between 0 and 5.';
    END IF;
END;

CREATE TRIGGER after_insert_order
AFTER INSERT ON `Order`
FOR EACH ROW
BEGIN
    UPDATE `Order` 
    SET status = 'Pending'
    WHERE orderId = NEW.orderId;
END;

