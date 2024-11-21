-- Write your SQL code here
CREATE TABLE Employee (
    employeeId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    departmentId INT,
    hireDate DATE,
    performanceRating DECIMAL(3, 2),
    INDEX (lastName),
    INDEX (departmentId),
    INDEX (hireDate)
) ENGINE=InnoDB;

CREATE TABLE `Order` (
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    customerId INT,
    employeeId INT,
    orderDate DATE,
    status ENUM('Pending', 'Shipped', 'Completed', 'Cancelled'),
    totalAmount DECIMAL(10, 2),
    INDEX (customerId),
    INDEX (orderDate),
    INDEX (status)
) ENGINE=InnoDB;
