-- Write your SQL code here 
CREATE VIEW CustomerOrders AS
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM 
    Customer c
INNER JOIN 
    Orders o ON c.customer_id = o.customer_id;

CREATE VIEW ProductInventory AS
SELECT 
    p.product_id,
    p.product_name,
    p.price,
    p.stock_quantity,
    s.supplier_name,
    p.category
FROM 
    Product p
LEFT JOIN 
    Supplier s ON p.supplier_id = s.supplier_id;


CREATE VIEW SupplierProducts AS
SELECT 
    s.supplier_id,
    s.supplier_name,
    p.product_name,
    p.stock_quantity
FROM 
    Supplier s
INNER JOIN 
    Product p ON s.supplier_id = p.supplier_id;

