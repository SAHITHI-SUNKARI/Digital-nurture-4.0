CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Balance DECIMAL(12,2),
    LastModified DATE,
    VIPStatus CHAR(1) DEFAULT 'N'
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(12,2),
    LastModified DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanAmount DECIMAL(12,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
DELIMITER //

CREATE PROCEDURE ApplyInterestDiscount()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_customer_id INT;
    DECLARE v_loan_id INT;
    DECLARE v_interest_rate DECIMAL(5,2);
    DECLARE age INT;

    DECLARE cur CURSOR FOR
        SELECT c.CustomerID, l.LoanID, l.InterestRate,
               TIMESTAMPDIFF(YEAR, c.DOB, CURDATE()) AS age
        FROM Customers c
        JOIN Loans l ON c.CustomerID = l.CustomerID
        WHERE TIMESTAMPDIFF(YEAR, c.DOB, CURDATE()) > 60;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_customer_id, v_loan_id, v_interest_rate, age;
        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE Loans
        SET InterestRate = InterestRate - (InterestRate * 0.01)
        WHERE LoanID = v_loan_id;

    END LOOP;

    CLOSE cur;
END;
//

DELIMITER ;
CALL ApplyInterestDiscount();
