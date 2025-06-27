CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    LastModified DATE,
    VIPStatus CHAR(1) DEFAULT 'Y'
);

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER,
    LastModified DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Customers
INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, VIPStatus)
VALUES (3, 'John Doe', TO_DATE('1985-05-15', 'YYYY-MM-DD'), 1000, SYSDATE, 'N');

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, VIPStatus)
VALUES (4, 'Jane Smith', TO_DATE('1970-07-20', 'YYYY-MM-DD'), 5000, SYSDATE, 'Y');

-- Accounts (total for customer 2 will be 12,000, so should become VIP)
INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (2, 1, 'Savings', 4000, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (3, 2, 'Savings', 7000, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (4, 2, 'Checking', 5000, SYSDATE);

COMMIT;
SET SERVEROUTPUT ON;

BEGIN
    FOR rec IN (
        SELECT c.CustomerID
        FROM Customers c
        JOIN Accounts a ON c.CustomerID = a.CustomerID
        GROUP BY c.CustomerID
        HAVING SUM(a.Balance) > 10000
    )
    LOOP
        UPDATE Customers
        SET VIPStatus = 'Y',
            LastModified = SYSDATE
        WHERE CustomerID = rec.CustomerID;

        DBMS_OUTPUT.PUT_LINE('Customer ID ' || rec.CustomerID || ' promoted to VIP.');
    END LOOP;
    COMMIT;
END;
SELECT CustomerID, Name, VIPStatus FROM Customers;


