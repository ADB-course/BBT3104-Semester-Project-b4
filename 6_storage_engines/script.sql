-- Write your SQL code here
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock >= 0),
    supplier_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
) ENGINE=InnoDB;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15) CHECK (CHAR_LENGTH(phone) BETWEEN 10 AND 15)
) ENGINE=InnoDB;

CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
) ENGINE=InnoDB;

CREATE TABLE OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
) ENGINE=InnoDB;

CREATE TABLE ProductLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    old_price DECIMAL(10, 2),
    new_price DECIMAL(10, 2),
    change_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
) ENGINE=InnoDB;
