-- Write your SQL code here
START TRANSACTION;

-- Step 1: Insert the order into the Orders table
INSERT INTO Orders (customer_id, order_date, total_amount, status) 
VALUES (1, NOW(), 250.00, 'Pending Payment');

-- Retrieve the auto-generated order_id for the inserted order
SET @last_order_id = LAST_INSERT_ID();

-- Step 2: Insert order details into the OrderDetails table
INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price) 
VALUES 
    (@last_order_id, 101, 2, 100.00), -- Product ID 101, quantity 2
    (@last_order_id, 102, 1, 50.00); -- Product ID 102, quantity 1

-- Step 3: Update the product inventory
UPDATE Product 
SET stock_quantity = stock_quantity - 2 
WHERE product_id = 101;

UPDATE Product 
SET stock_quantity = stock_quantity - 1 
WHERE product_id = 102;

-- If everything is successful, commit the transaction
COMMIT;


START TRANSACTION;

BEGIN TRY
    -- Step 1: Insert a new customer
    INSERT INTO Customer (first_name, last_name, email, contact_info, address) 
    VALUES ('John', 'Doe', 'johndoe@example.com', '123-456-7890', '123 Main Street');

    -- Retrieve the customer_id for the inserted customer
    SET @last_customer_id = LAST_INSERT_ID();

    -- Step 2: Add a new order for the customer
    INSERT INTO Orders (customer_id, order_date, total_amount, status) 
    VALUES (@last_customer_id, NOW(), 100.00, 'Pending Payment');

    -- Commit if all operations succeed
    COMMIT;

EXCEPTION
    -- Rollback if any operation fails
    ROLLBACK;
END TRY;


START TRANSACTION;

-- Step 1: Deduct payment from the customer's account balance
UPDATE Customer 
SET account_balance = account_balance - 200 
WHERE customer_id = 1;

-- Step 2: Update the order status to "Paid"
UPDATE Orders 
SET status = 'Paid' 
WHERE order_id = 1;

-- Check if both updates were successful
IF ROW_COUNT() > 0 THEN
    COMMIT;
ELSE
    ROLLBACK;
END IF;
