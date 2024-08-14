# Library Management Database System

This project is a MySQL-based Library Management Database System. The system includes tables for publishers, books, library branches, borrowers, book loans, and book copies. It also includes several stored procedures and views for managing and querying the data.

## Database Schema

### Tables
- **tbl_publisher**: Stores publisher information including publisher name, address, and phone number.
- **tbl_book**: Contains details about books, including book ID, title, and publisher name.
- **tbl_library_branch**: Stores information about library branches, including branch ID, name, and address.
- **tbl_borrower**: Contains details about borrowers, including card number, name, address, and phone number.
- **tbl_book_loans**: Tracks book loans, including loan ID, book ID, branch ID, card number, date out, and due date.
- **tbl_book_copies**: Stores information about the number of copies of each book available at each branch.

### Views
- **George_Allen_Unwin**: Lists all books published by George Allen & Unwin.
- **book_availability**: Shows the availability of each book at each library branch, including whether the book is currently available or not.

### Stored Procedures
- **bookCopiesAtAllSharpstown(bookTitle, branchName)**: Retrieves the number of copies of a specific book available at the Sharpstown branch.
- **bookCopies(bookTitle)**: Retrieves the number of copies of a specific book available at each library branch.
- **NoLoans()**: Lists all borrowers who do not have any books checked out.
- **print_numbers()**: A simple procedure that prints numbers from 1 to 20.

### Triggers
- **update_copies_count**: Trigger that updates the number of copies of a book after a new record is inserted into the `tbl_book_copies` table.
 
