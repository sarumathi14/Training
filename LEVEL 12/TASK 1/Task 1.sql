CREATE TABLE Denormalized_Orders (
  order_id VARCHAR(10),
  order_date DATE,
  customer_id VARCHAR(10),
  customer_name VARCHAR(50),
  customer_address VARCHAR(100),
  product_id VARCHAR(10),
  product_name VARCHAR(50),
  quantity INT,
  price DECIMAL(10,2)
);
INSERT INTO Denormalized_Orders VALUES
('101', '2023-01-01', 'C1', 'Alice', '123 Main St', 'P1', 'Laptop', 2, 1000),
('101', '2023-01-01', 'C1', 'Alice', '123 Main St', 'P2', 'Mouse', 3, 20),
('102', '2023-01-02', 'C2', 'Bob', '456 Oak Ave', 'P3', 'Keyboard', 1, 50);
ALTER TABLE Denormalized_Orders
ADD PRIMARY KEY (order_id, product_id);
DESCRIBE Denormalized_Orders;
SELECT * FROM Denormalized_Orders;
CREATE VIEW Orders_1NF AS
SELECT * FROM Denormalized_Orders;



















