-- Write your SQL code here
-- Insert dummy data into Product table
INSERT INTO Product (product_id, product_name, price, stock, supplier_id)
VALUES 
    (1, 'Laptop', 800.00, 50, 1),
    (2, 'Smartphone', 500.00, 200, 2),
    (3, 'Headphones', 100.00, 150, 3);

-- Insert dummy data into Customer table
INSERT INTO Customer (customer_id, customer_name, email, phone)
VALUES 
    (1, 'Alice Johnson', 'alice.johnson@example.com', '1234567890'),
    (2, 'Bob Smith', 'bob.smith@example.com', '9876543210'),
    (3, 'Cathy Brown', 'cathy.brown@example.com', '4567891230');

-- Insert dummy data into Supplier table
INSERT INTO Supplier (supplier_id, supplier_name, contact_number, address)
VALUES 
    (1, 'Tech Supply Co.', '1234567890', '123 Tech Street'),
    (2, 'Mobile Distributors Ltd.', '9876543210', '456 Mobile Ave'),
    (3, 'Gadget World', '4567891230', '789 Gadget Blvd');

-- Insert dummy data into Orders table
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES 
    (1, 1, '2024-11-20', 1300.00),
    (2, 2, '2024-11-21', 500.00),
    (3, 3, '2024-11-22', 300.00);

-- Insert dummy data into OrderDetails table
INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity, price)
VALUES 
    (1, 1, 1, 1, 800.00),
    (2, 1, 3, 5, 500.00),
    (3, 2, 2, 1, 500.00),
    (4, 3, 3, 3, 300.00);

-- Insert dummy data into ProductLog table
INSERT INTO ProductLog (log_id, product_id, old_price, new_price, change_date)
VALUES 
    (1, 1, 800.00, 850.00, '2024-11-01'),
    (2, 2, 500.00, 550.00, '2024-11-10');
