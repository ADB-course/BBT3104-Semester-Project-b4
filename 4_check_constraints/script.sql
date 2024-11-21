-- Write your SQL code here
CREATE TABLE Product (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100),
    supplierId INT,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stockQuantity INT,
    CHECK (price > 0),
    CHECK (stockQuantity >= 0),
    INDEX (category),
    INDEX (price)
) ENGINE=InnoDB;

CREATE TABLE Supplier (
    supplierId INT AUTO_INCREMENT PRIMARY KEY,
    companyName VARCHAR(100),
    contactInfo VARCHAR(50),
    city VARCHAR(50),
    INDEX (city)
) ENGINE=InnoDB;

