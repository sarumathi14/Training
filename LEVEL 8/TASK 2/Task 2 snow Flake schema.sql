CREATE TABLE `Product_Category_Dim` (
  `Category_ID` int PRIMARY KEY,
  `Category_Name` varchar(255)
);

CREATE TABLE `Customer_Location_Dim` (
  `Location_ID` int PRIMARY KEY,
  `City` varchar(255),
  `State` varchar(255),
  `Country` varchar(255)
);

CREATE TABLE `Store_Location_Dim` (
  `Location_ID` int PRIMARY KEY,
  `City` varchar(255),
  `State` varchar(255),
  `Country` varchar(255)
);

CREATE TABLE `Product_Dim` (
  `Product_ID` int PRIMARY KEY,
  `Product_Name` varchar(255),
  `Category_ID` int,
  `Brand` varchar(255),
  `Price` decimal
);

CREATE TABLE `Customer_Dim` (
  `Customer_ID` int PRIMARY KEY,
  `Name` varchar(255),
  `Email` varchar(255),
  `Location_ID` int
);

CREATE TABLE `Store_Dim` (
  `Store_ID` int PRIMARY KEY,
  `Store_Name` varchar(255),
  `Location_ID` int
);

CREATE TABLE `Time_Dim` (
  `Time_ID` int PRIMARY KEY,
  `Date` date,
  `Month` varchar(255),
  `Quarter` varchar(255),
  `Year` int
);

CREATE TABLE `Sales_Fact` (
  `Sales_ID` int PRIMARY KEY,
  `Product_ID` int,
  `Customer_ID` int,
  `Time_ID` int,
  `Store_ID` int,
  `Sales_Amount` decimal,
  `Quantity` int
);

ALTER TABLE `Product_Dim` ADD FOREIGN KEY (`Category_ID`) REFERENCES `Product_Category_Dim` (`Category_ID`);

ALTER TABLE `Customer_Dim` ADD FOREIGN KEY (`Location_ID`) REFERENCES `Customer_Location_Dim` (`Location_ID`);

ALTER TABLE `Store_Dim` ADD FOREIGN KEY (`Location_ID`) REFERENCES `Store_Location_Dim` (`Location_ID`);

ALTER TABLE `Sales_Fact` ADD FOREIGN KEY (`Product_ID`) REFERENCES `Product_Dim` (`Product_ID`);

ALTER TABLE `Sales_Fact` ADD FOREIGN KEY (`Customer_ID`) REFERENCES `Customer_Dim` (`Customer_ID`);

ALTER TABLE `Sales_Fact` ADD FOREIGN KEY (`Time_ID`) REFERENCES `Time_Dim` (`Time_ID`);

ALTER TABLE `Sales_Fact` ADD FOREIGN KEY (`Store_ID`) REFERENCES `Store_Dim` (`Store_ID`);
