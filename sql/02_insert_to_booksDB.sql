-- Переключение на базу данных
USE BookList;
GO

-- Вставка данных в таблицу Authors
INSERT INTO Authors (FullName)
VALUES 
(N'Лев Толстой'),
(N'Фёдор Достоевский'),
(N'Александр Пушкин'),
(N'Антон Чехов'),
(N'Карл Маркс'),
(N'Фридрих Энгельс'),
(N'Жан-Поль Сартр'),
(N'Фридрих Ницше'),
(N'Сигмунд Фрейд'),
(N'Жак Деррида');
GO

-- Вставка данных в таблицу Books
INSERT INTO Books (Title)
VALUES 
(N'Война и мир'),
(N'Преступление и наказание'),
(N'Евгений Онегин'),
(N'Чеховские рассказы'),
(N'Капитал'),
(N'Манифест Коммунистической партии'),
(N'Бытие и время'),
(N'Так говорил Заратустра'),
(N'Психоанализ'),
(N'О положении женщины в обществе');
GO

-- Вставка связей между книгами и авторами
-- Для примера, добавляем несколько связей
-- Вставка данных в таблицу BookAuthors для установления связей между книгами и авторами
INSERT INTO BookAuthors (BookID, AuthorID)
VALUES 
-- Связь книг с авторами
(1, 1), -- 'Война и мир' - 'Лев Толстой'
(2, 2), -- 'Преступление и наказание' - 'Фёдор Достоевский'
(3, 3), -- 'Евгений Онегин' - 'Александр Пушкин'
(4, 4), -- 'Чеховские рассказы' - 'Антон Чехов'
(5, 5), -- 'Капитал' - 'Карл Маркс'
(6, 5), -- 'Манифест Коммунистической партии' - 'Карл Маркс'
(6, 6), -- 'Манифест Коммунистической партии' - 'Фридрих Энгельс'
(7, 7), -- 'Бытие и время' - 'Жан-Поль Сартр'
(8, 8), -- 'Так говорил Заратустра' - 'Фридрих Ницше'
(9, 9), -- 'Психоанализ' - 'Сигмунд Фрейд'
(10, 10) -- 'О положении женщины в обществе' - 'Жак Деррида'
GO
