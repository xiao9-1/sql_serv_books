# MS SQL Server 2019 в Docker

## Описание проекта

Этот проект нацелен на развёртывание MS SQL Server 2019 с помощью Docker. Проект включает:

- Dockerfile для создания контейнера с MS SQL Server 2019.
- SQL-скрипты для создания базы данных и её заполнения.
- Python-скрипт, который подключается к базе данных, выгружает данные и сохраняет их в текстовый файл.

## Структура проекта

```bash
sql_serv_books/
├── docker/
│   └── Dockerfile            # Dockerfile для создания сервера и выполнения скриптов
├── sql/
│   ├── 01_create-booksDB.sql # SQL-скрипт для создания базы данных и необходимых таблиц
│   └── 02_insert_to_booksDB.sql # SQL-скрипт для вставки данных в таблицы базы данных
└── src/
    └── connectDB.py          # Python-скрипт для подключения к базе данных и выгрузки данных
```

## Требования

- Docker

## Установка и запуск

### 1. Клонирование репозитория

```bash
git clone https://github.com/xiao9-1/sql_serv_books.git
cd sql_serv_books
```

### 2. Сборка Docker-образа

Перейдите в директорию проекта и выполните команду для сборки Docker-образа:

```bash
docker build -f docker/Dockerfile -t sql_serv_books .
```

Эта команда создаст Docker-образ с установленным MS SQL Server 2019 и выполнит SQL-скрипты для создания базы данных и её заполнения.

### 3. Запуск контейнера

Запустите контейнер с MS SQL Server 2019 с указанными переменными окружения (например, для пароля):

```bash
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=YourStrong!Passw0rd' -p 1433:1433 --name msql_serv_books_cont sql_serv_books
```

- `ACCEPT_EULA=Y` — соглашение с лицензионным соглашением MS SQL Server.
- `SA_PASSWORD=YourStrong!Passw0rd` — пароль для учётной записи администратора `SA`.
- `-p 1433:1433` — проброс порта для доступа к серверу.

### 4. Выгрузка файла books_authors.txt

Чтобы выгрузить файл books_authors.txt из контейнера на ваш локальный компьютер, используйте следующую команду:

```bash
docker cp msql_serv_books_cont:/books_authors.txt ./books_authors.txt
```

Эта команда скопирует файл books_authors.txt из корневой директории контейнера my-sqlserv_test1 в текущую директорию вашего компьютера.

### 5. Остановка и удаление контейнера

Для остановки контейнера выполните:

```bash
docker stop msql_serv_books_cont
```

Для удаления контейнера:

```bash
docker rm msql_serv_books_cont
```

## Полезные команды

 Посмотреть логи контейнера:

  ```bash
  docker logs msql_serv_books_cont
  ```

 Зайти в контейнер:

  ```bash
  docker exec -it msql_serv_books_cont /bin/bash
  ```

## Примечания

- Убедитесь, что Docker установлен и настроен на вашем компьютере.
- Убедитесь, что переменные окружения и параметры безопасности настроены правильно.
