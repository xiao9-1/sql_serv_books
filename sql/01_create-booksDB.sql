-- Проверка и создание базы данных
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'BookList')
BEGIN
    CREATE DATABASE BookList;
END
GO

-- Переключение на созданную базу данных
USE BookList;
GO

-- Проверка и создание таблицы Authors
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Authors]') AND type = N'U')
BEGIN
    CREATE TABLE Authors (
        AuthorID INT PRIMARY KEY IDENTITY(1,1),
        FullName NVARCHAR(255) NOT NULL
    );
END
GO

-- Проверка и создание таблицы Books
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type = N'U')
BEGIN
    CREATE TABLE Books (
        BookID INT PRIMARY KEY IDENTITY(1,1),
        Title NVARCHAR(255) NOT NULL
    );
END
GO

-- Проверка и создание таблицы BookAuthors
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookAuthors]') AND type = N'U')
BEGIN
    CREATE TABLE BookAuthors (
        BookID INT,
        AuthorID INT,
        PRIMARY KEY (BookID, AuthorID),
        FOREIGN KEY (BookID) REFERENCES Books(BookID),
        FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
    );
END
GO


