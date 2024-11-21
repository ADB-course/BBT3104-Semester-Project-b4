-- Write your SQL code here
CREATE TRIGGER after_order_dispatch
AFTER UPDATE ON `Order`
FOR EACH ROW
BEGIN
    IF NEW.status = 'Shipped' THEN
        UPDATE Product
        SET stockQuantity = stockQuantity - NEW.quantity
        WHERE productId = NEW.productId;
    END IF;
END;

CREATE TRIGGER before_delete_old_orders
BEFORE DELETE ON `Order`
FOR EACH ROW
BEGIN
    IF DATEDIFF(CURRENT_DATE, OLD.orderDate) > 365 THEN
        INSERT INTO ArchivedOrders SELECT * FROM `Order` WHERE orderId = OLD.orderId;
    END IF;
END;

