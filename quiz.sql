CREATE TABLE Book
(
    BookID long NOT NULL,
    PRIMARY KEY(BookID),
    Title varchar(255) NOT NULL,
    PublisherName varchar(255) NOT NULL,
    CONSTRAINT FK_publishername FOREIGN KEY (PublisherName)
    REFERENCES Publisher(PublisherName) ON DELETE 
    SET NULL ON UPDATE CASCADE
);
CREATE TABLE Book_Authors
(
    BookID long NOT NULL,
    PRIMARY KEY(BookID),
    CONSTRAINT FK_BookID FOREIGN KEY(BookID)
    REFERENCES Book(BookID)ON DELETE 
    SET NULL ON UPDATE CASCADE,
    AuthorName varchar(255) NOT NULL
);
CREATE TABLE Publisher
(
    PublisherName varchar(255) NOT NULL,
    PRIMARY KEY(PublisherName),
    Addresss varchar(255) ,
    Phone long
);
CREATE TABLE Book_copies
(
    BookID long NOT NULL,
    PRIMARY KEY(BookID),
    CONSTRAINT FK_BookID FOREIGN KEY(BookID)
    REFERENCES Book(BookID)ON DELETE 
    SET NULL ON UPDATE CASCADE,
    BranchID long NOT NULL,
    CONSTRAINT FK_BranchID FOREIGN KEY(BranchID)
    REFERENCES Library_branch(BranchID)
    ON DELETE 
    SET NULL ON UPDATE CASCADE,
    NumOfCopies long DEFAULT 0
);
CREATE TABLE Book_loans
(
    BookID long NOT NULL,
    CONSTRAINT FK_BookID FOREIGN KEY(BookID)
    REFERENCES Book(BookID),
    BranchID long NOT NULL,
    CONSTRAINT FK_BranchID FOREIGN KEY(BranchID)
    REFERENCES Library_branch(BranchID),
    Card_no long NOT NULL,
    CONSTRAINT FK_card FOREIGN KEY(Card_no)
    REFERENCES Borrower(Card_no),
    Date_Out TIMESTAMP ,
    Due_in TIMESTAMP,
);
CREATE TABLE Library_branch
(
    BranchID long NOT NULL UNIQUE,
    PRIMARY KEY (BranchID), 
    BranchName varchar(255) NOT NULL,
    Address varchar(255)
);
CREATE TABLE Borrower
(
    Card_no long  NOT NULL UNIQUE,
    PRIMARY KEY(Card_no),
    B_Name varchar(255) NOT NULL,
    Address varchar(255),
    Phone long 

);

