CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
) IS
    v_from_balance NUMBER;
    v_to_exists    NUMBER;
BEGIN
    -- Check if source account exists
    SELECT Balance INTO v_from_balance
    FROM Accounts
    WHERE AccountID = p_from_account;

    -- Check if destination account exists
    SELECT COUNT(*) INTO v_to_exists
    FROM Accounts
    WHERE AccountID = p_to_account;

    IF v_to_exists = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Destination account does not exist.');
        RETURN;
    END IF;

    -- Check for sufficient balance
    IF v_from_balance < p_amount THEN
        DBMS_OUTPUT.PUT_LINE('Insufficient funds in Account ID: ' || p_from_account);
        RETURN;
    END IF;

    -- Transfer funds
    UPDATE Accounts
    SET Balance = Balance - p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_from_account;

    UPDATE Accounts
    SET Balance = Balance + p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_to_account;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Transferred ' || p_amount || ' from Account ID ' || p_from_account || ' to Account ID ' || p_to_account);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Source account not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
        ROLLBACK;
END;
/
INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (101, 1, 'Savings', 5000, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (102, 1, 'Checking', 1000, SYSDATE);

COMMIT;
SET SERVEROUTPUT ON;
EXEC TransferFunds(101, 102, 1000);
