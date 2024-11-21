-- Write your SQL code 
-- Add a unique index for the email column in the Customer table
CREATE UNIQUE INDEX idx_customer_email 
ON Customer (email);

-- Add a foreign key index for the supplier_id column in the Product table
CREATE INDEX idx_product_supplier_id 
ON Product (supplier_id);

-- Add a foreign key index for the customer_id column in the Orders table
CREATE INDEX idx_orders_customer_id 
ON Orders (customer_id);

-- Add a foreign key index for the order_id and product_id columns in the OrderDetails table
CREATE INDEX idx_orderdetails_order_id 
ON OrderDetails (order_id);

CREATE INDEX idx_orderdetails_product_id 
ON OrderDetails (product_id);

-- Add an index for the price column in the Product table to speed up price-related queries
CREATE INDEX idx_product_price 
ON Product (price);

-- Add an index for the change_date column in the ProductLog table to optimize date-based queries
CREATE INDEX idx_productlog_change_date 
ON ProductLog (change_date);
