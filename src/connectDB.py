import pyodbc

# Параметры подключения
server = 'localhost'
database = 'BookList'
username = 'sa'
password = 'YourStrong!Passw0rd'

# Строка подключения
conn_str = (
    r'DRIVER={ODBC Driver 17 for SQL Server};'
    f'SERVER={server};'
    f'DATABASE={database};'
    f'UID={username};'
    f'PWD={password}'
)

# Подключение к базе данных
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

# Выполнение запроса для получения книг и их авторов
query = """
SELECT 
    b.Title AS BookTitle,
    a.FullName AS AuthorName
FROM 
    Books b
INNER JOIN 
    BookAuthors ba ON b.BookID = ba.BookID
INNER JOIN 
    Authors a ON ba.AuthorID = a.AuthorID
ORDER BY 
    b.Title, a.FullName;
"""

cursor.execute(query)

# Создание словаря для хранения информации о книгах и их авторах
books_authors = {}

# Обработка результатов запроса
for row in cursor.fetchall():
    book_title = row.BookTitle
    author_name = row.AuthorName
    
    if book_title not in books_authors:
        books_authors[book_title] = []
    
    books_authors[book_title].append(author_name)

# Закрытие подключения
cursor.close()
conn.close()

with open('books_authors.txt', 'w', encoding='utf-8') as file:
    for book_title, authors in books_authors.items():
        authors_list = ', '.join(authors)
        file.write(f'{book_title} - {authors_list}\n')

print("Информация о книгах и их авторах успешно записана в файл 'books_authors.txt'.")
