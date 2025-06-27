SELECT * FROM Accounts WHERE AccountType = 'Savings';
INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (101, 1, 'Savings', 10000, SYSDATE);
COMMIT;
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    FOR rec IN (
        SELECT AccountID, Balance
        FROM Accounts
        WHERE AccountType = 'Savings'
    )
    LOOP
        UPDATE Accounts
        SET Balance = rec.Balance + (rec.Balance * 0.01),
            LastModified = SYSDATE
        WHERE AccountID = rec.AccountID;

        DBMS_OUTPUT.PUT_LINE('Interest applied to Account ID: ' || rec.AccountID);
    END LOOP;

    COMMIT;
END;
/
SET SERVEROUTPUT ON;
EXEC ProcessMonthlyInterest;
