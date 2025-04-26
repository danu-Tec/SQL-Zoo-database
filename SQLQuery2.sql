CREATE DATABASE BookstoreDB;
GO

USE BookstoreDB;
GO

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),  
    FirstName NVARCHAR(50),                  
    LastName NVARCHAR(50),                   
    BirthYear INT                             
);
GO

CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),    
    Title NVARCHAR(100),                     
    Genre NVARCHAR(50),                      
    PublishYear INT,                         
    AuthorID INT,                            

    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
GO

INSERT INTO Authors (FirstName, LastName, BirthYear)
VALUES 
('George', 'Orwell', 1903),
('Jane', 'Austen', 1775),
('J.K.', 'Rowling', 1965),
('Chinua', 'Achebe', 1930),
('Mark', 'Twain', 1835);
GO

INSERT INTO Books (Title, Genre, PublishYear, AuthorID)
VALUES 
('1984', 'Dystopian', 1949, 1),                
('Animal Farm', 'Satire', 1945, 1),            
('Pride and Prejudice', 'Romance', 1813, 2),   
('Things Fall Apart', 'Historical', 1958, 4),  
('Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1997, 3); 
GO

SELECT 
    Books.Title AS BookTitle,
    Books.Genre,
    Books.PublishYear,
    Authors.FirstName + ' ' + Authors.LastName AS AuthorName
FROM Books
INNER JOIN Authors
    ON Books.AuthorID = Authors.AuthorID;
GO