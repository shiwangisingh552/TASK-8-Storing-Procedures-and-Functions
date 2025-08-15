1.CREATE Customers table:

    CREATE TABLE Customers (
        CustomerID INTEGER PRIMARY KEY,
        Name TEXT,
        City TEXT,
    );


--Insert into Customers:

    INSERT INTO Customers (CustomerID, Name, City) VALUES(1, 'Alice', 'Delhi');
    INSERT INTO Customers (CustomerID, Name, City) VALUES(2, 'Bob', 'Mumbai');
    INSERT INTO Customers (CustomerID, Name, City) VALUES(3, 'Charlie', 'Chennai');
    INSERT INTO Customers (CustomerID, Name, City) VALUES(4, 'Diana', 'Kolkata');

2. Stored Procedure: Get Customers by City:

    DELIMITER //

    CREATE PROCEDURE GetCustomersByCity(IN cityName TEXT)
    BEGIN
        SELECT * FROM Customers WHERE City = cityName;
    END //

    DELIMITER ;

--Usage:

    CALL GetCustomersByCity('Mumbai');


3. Function: Count Customers in a City:

    DELIMITER //

    CREATE FUNCTION CountCustomers(cityName TEXT)
    RETURNS INTEGER
    DETERMINISTIC
    BEGIN
        DECLARE customerCount INTEGER;
        SELECT COUNT(*) INTO customerCount FROM Customers WHERE City = cityName;
        RETURN customerCount;
    END //

    DELIMITER ;

--Usage:

    SELECT CountCustomers('Delhi');

