CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    LastModified DATE,
    VIPStatus CHAR(1) DEFAULT 'N'
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    LoanAmount NUMBER,
    InterestRate NUMBER,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Insert sample customer and loan
INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, VIPStatus)
VALUES (3, 'Remind Me', TO_DATE('1980-01-01', 'YYYY-MM-DD'), 8000, SYSDATE, 'N');

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (2, 3, 7000, 5.5, SYSDATE, SYSDATE + 10); -- Due in 10 days

COMMIT;
SET SERVEROUTPUT ON;

BEGIN
    FOR rec IN (
        SELECT l.LoanID, c.Name, l.EndDate
        FROM Loans l
        JOIN Customers c ON l.CustomerID = c.CustomerID
        WHERE l.EndDate BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || rec.LoanID ||
                             ' for ' || rec.Name ||
                             ' is due on ' || TO_CHAR(rec.EndDate, 'DD-MON-YYYY'));
    END LOOP;
END;
