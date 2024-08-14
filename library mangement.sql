CREATE DATABASE  db_LibraryManagement;
USE db_LibraryManagement;
CREATE TABLE tbl_publisher (
    publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
    publisher_PublisherAddress VARCHAR(200) NOT NULL,
    publisher_PublisherPhone VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_book (
    book_BookID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    book_Title VARCHAR(100) NOT NULL,
    book_PublisherName VARCHAR(100) NOT NULL,
    FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName)
);
CREATE TABLE tbl_library_branch (
    library_branch_BranchID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    library_branch_BranchName VARCHAR(100) NOT NULL,
    library_branch_BranchAddress VARCHAR(200) NOT NULL
);
CREATE TABLE tbl_borrower (
    borrower_CardNo INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    borrower_BorrowerName VARCHAR(100) NOT NULL,
    borrower_BorrowerAddress VARCHAR(200) NOT NULL,
    borrower_BorrowerPhone VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_book_loans (
    book_loans_LoansID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    book_loans_BookID INT NOT NULL,
    book_loans_BranchID INT NOT NULL,
    book_loans_CardNo INT NOT NULL,
    book_loans_DateOut VARCHAR(50) NOT NULL,
    book_loans_DueDate VARCHAR(50) NOT NULL,
    FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID),
    FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo)
);
CREATE TABLE tbl_book_copies (
    book_copies_CopiesID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    book_copies_BookID INT NOT NULL,
    book_copies_BranchID INT NOT NULL,
    book_copies_No_Of_Copies INT NOT NULL,
    FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID)
);

INSERT INTO tbl_publisher
    (publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
VALUES
    ('DAW Books', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
    ('Viking', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
    ('Signet Books', '375 Hudson Street, New York, NY 10014', '212-366-2000'),
    ('Chilton Books','Not Available','Not Available'),
	('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
	('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
	('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
    ('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
	('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
	('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
	('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
	('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
	('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
	('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745')		
	;

	INSERT INTO tbl_book
    (book_Title, book_PublisherName)
VALUES 
        ('The Name of the Wind', 'DAW Books'),
        ('It', 'Viking'),
        ('The Green Mile', 'Signet Books'),
        ('Dune', 'Chilton Books'),
		('The Hobbit', 'George Allen & Unwin'),
		('Eragon', 'Alfred A. Knopf'),
		('A Wise Mans Fear', 'DAW Books'),
		('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		('The Giving Tree', 'Harper and Row'),
		('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		('Brave New World', 'Chalto & Windus'),
		('The Princess Bride', 'Harcourt Brace Jovanovich'),
		('Fight Club', 'W.W. Norton'),
		('Holes', 'Scholastic'),
		('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('The Fellowship of the Ring', 'George Allen & Unwin'),
		('A Game of Thrones', 'Bantam'),
		('The Lost Tribe', 'Picador USA');
        
        INSERT INTO tbl_library_branch
    (library_branch_BranchName, library_branch_BranchAddress)
VALUES
    ('Sharpstown', '32 Corner Road, New York, NY 10012'),
    ('Central', '491 3rd Street, New York, NY 10014'),
    ('Saline','40 State Street, Saline, MI 48176'),
    ('Ann Arbor','101 South University, Ann Arbor, MI 48104');
    ;

INSERT INTO tbl_borrower
    ( borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
VALUES
    ('Joe Smith', '1321 4th Street, New York, NY 10014', '212-312-1234'),
    ('Jane Smith', '1321 4th Street, New York, NY 10014', '212-931-4124'),
    ('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
	('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
	('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
	('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
	('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
	('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
    
INSERT INTO tbl_book_loans
    (book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)
VALUES
      ('1','1','100','1/1/23','2/2/23'),
		('2','1','100','1/10/23','2/12/23'),
		('3','1','100','1/1/23','2/2/23'),
		('4','1','100','1/1/23','2/2/23'),
		('5','1','102','1/3/23','2/3/23'),
		('6','1','102','1/3/23','2/3/23'),
		('7','1','102','1/3/23','2/3/23'),
		('8','1','102','1/3/23','2/3/23'),
		('9','1','102','1/3/23','2/3/23'),
		('11','1','102','1/3/23','2/3/23'),
		('12','2','105','12/12/23','1/12/23'),
		('10','2','105','1/12/23','12/12/23'),
		('20','2','105','2/3/23','3/3/23'),
		('18','2','105','1/5/23','2/5/23'),
		('19','2','105','1/5/23','2/5/23'),
		('19','2','100','1/3/23','2/3/23'),
		('11','2','106','1/7/23','2/7/23'),
		('1','2','106','1/7/23','2/7/23'),
		('2','2','100','1/7/23','2/7/23'),
		('3','2','100','1/7/23','2/7/23'),
		('5','2','105','12/12/23','1/12/24'),
		('4','3','103','1/9/23','2/9/23'),
		('7','3','102','1/3/23','2/3/23'),
		('17','3','102','1/3/23','2/3/23'),
		('16','3','104','1/3/23','2/3/23'),
		('15','3','104','1/3/23','2/3/23'),
		('15','3','107','1/3/23','2/3/23'),
		('14','3','104','1/3/23','2/3/23'),
		('13','3','107','1/3/23','2/3/23'),
		('13','3','102','1/3/23','2/3/23'),
		('19','3','102','12/12/23','1/2/23'),
		('20','4','103','1/3/23','2/3/23'),
		('1','4','102','1/12/23','2/12/23'),
		('3','4','107','1/3/23','2/3/23'),
		('18','4','107','1/3/23','2/3/23'),
		('12','4','102','1/4/23','2/4/23'),
		('11','4','103','1/5/23','2/5/23'),
		('9','4','103','1/5/23','2/5/23'),
		('7','4','107','1/1/23','2/2/23'),
		('4','4','103','1/1/23','2/2/23'),
		('1','4','103','2/2/23','3/2/23'),
		('20','4','103','1/3/23','2/3/23'),
		('1','4','102','1/12/23','2/12/23'),
		('3','4','107','1/3/23','2/3/23'),
		('18','4','107','1/3/23','2/3/23'),
		('12','4','102','1/4/23','2/4/23'),
		('11','4','103','1/5/23','2/5/23'),
		('9','4','103','1/5/23','2/5/23'),
		('7','4','107','1/1/23','2/1/23'),
		('4','4','103','1/9/23','2/9/23'),
		('1','4','103','1/2/23','2/2/23');
        
  
INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
VALUES
        ('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5'),
		('20','1','5'),
		('1','2','5'),
		('2','2','5'),
		('3','2','5'),
		('4','2','5'),
		('5','2','5'),
		('6','2','5'),
		('7','2','5'),
		('8','2','5'),
		('9','2','5'),
		('10','2','5'),
		('11','2','5'),
		('12','2','5'),
		('13','2','5'),
		('14','2','5'),
		('15','2','5'),
		('16','2','5'),
		('17','2','5'),
		('18','2','5'),
		('19','2','5'),
		('20','2','5'),
		('1','3','5'),
		('2','3','5'),
		('3','3','5'),
		('4','3','5'),
		('5','3','5'),
		('6','3','5'),
		('7','3','5'),
		('8','3','5'),
		('9','3','5'),
		('10','3','5'),
		('11','3','5'),
		('12','3','5'),
		('13','3','5'),
		('14','3','5'),
		('15','3','5'),
		('16','3','5'),
		('17','3','5'),
		('18','3','5'),
		('19','3','5'),
		('20','3','5'),
		('1','4','5'),
		('2','4','5'),
		('3','4','5'),
		('4','4','5'),
		('5','4','5'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','5'),
		('10','4','5'),
		('11','4','5'),
		('12','4','5'),
		('13','4','5'),
		('14','4','5'),
		('15','4','5'),
		('16','4','5'),
		('17','4','5'),
		('18','4','5'),
		('19','4','5'),
		('20','4','5');
        
-- QUESTION --> 1.)Show the books published by George Allen & Unwin.

 SELECT * FROM tbl_book WHERE book_PublisherName = 'George Allen & Unwin'

        
        
-- QUESTION? --> /* 2.)- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */
DELIMITER //

CREATE PROCEDURE bookCopiesAtAllSharpstown (
  IN bookTitle VARCHAR(70),
  IN branchName VARCHAR(70)
)

BEGIN
  SELECT 
    bc.book_copies_BranchID AS `Branch ID`,
    lb.library_branch_BranchName AS `Branch Name`,
    bc.book_copies_No_Of_Copies AS `Number of Copies`,
    b.book_Title AS `Book Title`
  FROM tbl_book_copies AS bc
  INNER JOIN tbl_book AS b ON bc.book_copies_BookID = b.book_BookID
  INNER JOIN tbl_library_branch AS lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
  WHERE b.book_Title = bookTitle AND lb.library_branch_BranchName = branchName;
END;
//
DELIMITER ;

 bookCopiesAtAllSharpstown('The Lost Tribe', 'SharpstowCALLn');


-- QUESTION --> /* 3.)- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
 
 
DELIMITER //

CREATE PROCEDURE bookCopies(IN bookTitle VARCHAR(70))
BEGIN
   SELECT 
     bc.book_copies_BranchID AS `Branch ID`,
     lb.library_branch_BranchName AS `Branch Name`,
     bc.book_copies_No_Of_Copies AS `Number of Copies`,
     b.book_Title AS `Book Title`
   FROM tbl_book_copies AS bc
   INNER JOIN tbl_book AS b ON bc.book_copies_BookID = b.book_BookID
   INNER JOIN tbl_library_branch AS lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
   WHERE b.book_Title = bookTitle;
END;
//
DELIMITER ;
CALL bookCopies('The Lost Tribe');

-- QUESTION --> /* 4.)- Retrieve the names of all borrowers who do not have any books checked out. */

DELIMITER $$

CREATE PROCEDURE NoLoans()
BEGIN
   SELECT borrower_BorrowerName FROM tbl_borrower
   WHERE NOT EXISTS (
      SELECT * FROM tbl_book_loans
      WHERE book_loans_CardNo = borrower_CardNo
   );
END $$

DELIMITER ;
CALL NoLoans();


-- QUESTION --> 6.) List all borrowers and their addresses.
SELECT borrower_BorrowerName AS Borrower, borrower_BorrowerAddress AS Address
FROM tbl_borrower;


-- QUESTION --> 7.)List all book copies available at each library branch 
SELECT lb.library_branch_BranchName AS Branch, b.book_Title AS Book, bc.book_copies_No_Of_Copies AS AvailableCopies
FROM tbl_book_copies AS bc
JOIN tbl_book AS b ON bc.book_copies_BookID = b.book_BookID
JOIN tbl_library_branch AS lb ON bc.book_copies_BranchID = lb.library_branch_BranchID;


-- QUESTION -->8.) List all borrowers who have not borrowed any books
SELECT borrower_BorrowerName AS Borrower
FROM tbl_borrower
WHERE borrower_CardNo NOT IN (SELECT DISTINCT book_loans_CardNo FROM tbl_book_loans);


UPDATE tbl_library_branch
	SET library_branch_BranchName = 'Central'
	WHERE library_branch_BranchID = 2;
    
    

CREATE VIEW George_Allen_Unwin AS
SELECT book_BookID, book_Title
FROM tbl_book
WHERE book_PublisherName = 'George Allen & Unwin';

SELECT * FROM George_Allen_Unwin;



CREATE VIEW book_availability AS
SELECT
    b.book_BookID AS BookID,
    b.book_Title AS Title,
    p.publisher_PublisherName AS Publisher,
    lb.library_branch_BranchName AS Branch,
    bc.book_copies_No_Of_Copies AS Copies,
    CASE
        WHEN bl.book_loans_LoansID IS NULL THEN 'Available'
        ELSE 'Not Available'
    END AS Availability
FROM
    tbl_book AS b
JOIN tbl_publisher AS p ON b.book_PublisherName = p.publisher_PublisherName
JOIN tbl_book_copies AS bc ON b.book_BookID = bc.book_copies_BookID
JOIN tbl_library_branch AS lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
LEFT JOIN tbl_book_loans AS bl ON b.book_BookID = bl.book_loans_BookID AND lb.library_branch_BranchID = bl.book_loans_BranchID;

SELECT * FROM book_availability;



DELIMITER //
CREATE TRIGGER update_copies_count AFTER INSERT ON tbl_book_copies FOR EACH ROW
BEGIN
    UPDATE tbl_book_copies
    SET book_copies_No_Of_Copies = book_copies_No_Of_Copies + 1
    WHERE book_copies_CopiesID = NEW.book_copies_CopiesID;
END;
//
DELIMITER ;


-- Insert a new record
UPDATE tbl_book_copies
SET book_copies_BookID = 10, book_copies_BranchID = 4, book_copies_No_Of_Copies = 3
WHERE book_copies_CopiesID = 21;



-- Query the table to see the updated value
SELECT * FROM tbl_book_copies WHERE book_copies_CopiesID = 21 LIMIT 0, 400;



DELIMITER $$

CREATE PROCEDURE print_numbers()
BEGIN
    DECLARE k INT DEFAULT 1;
    WHILE k <= 20 DO
        SELECT k;
        SET k = k + 1;
    END WHILE;
END $$

DELIMITER ;

CALL print_numbers();









        
        


    


    
    




