SELECT * FROM Members
WHERE join_date = (SELECT MAX(join_date) FROM Members);

SELECT *FROM Books b
WHERE (
    SELECT COUNT(*)
    FROM Loans l
    WHERE l.book_id = b.book_id)>1;

SELECT name FROM Members
WHERE member_id IN (SELECT DISTINCT member_id FROM Loans);

SELECT * FROM Members m
WHERE EXISTS (SELECT 1 FROM Loans l
    WHERE l.member_id =m.member_id);

SELECT title FROM Books
WHERE book_id = (SELECT book_id FROM Loans
    ORDER BY loan_date DESC LIMIT 1);