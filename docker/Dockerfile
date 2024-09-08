# Используем официальный образ Microsoft SQL Server 2019
FROM mcr.microsoft.com/mssql/server:2019-latest

# Устанавливаем переменные окружения для SQL Server
ENV SA_PASSWORD=YourStrong!Passw0rd
ENV ACCEPT_EULA=Y

# Открываем порт для SQL Server
EXPOSE 1433

USER root

# Обновляем индекс пакетов и устанавливаем утилиты
RUN mkdir -p /var/lib/apt/lists/partial && \
    apt-get update && \
    apt-get install -y curl apt-transport-https gnupg python3 python3-pip && \
    # Устанавливаем ключи и репозиторий Microsoft
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y mssql-tools unixodbc-dev && \
    # Устанавливаем pyodbc и другие зависимости для Python
    pip3 install pyodbc

# Копируем SQL-скрипты в контейнер
COPY ../sql/01_create-booksDB.sql /tmp/01_create-booksDB.sql
COPY ../sql/02_insert_to_booksDB.sql /tmp/02_insert_to_booksDB.sql

# Копируем Python-скрипт в контейнер
COPY ../src/connectDB.py /tmp/connectDB.py

# Запускаем процесс SQL Server, затем выполняем SQL-скрипты и Python-скрипт
CMD /bin/bash -c "/opt/mssql/bin/sqlservr & sleep 30; \
    if /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -Q 'IF DB_ID(N'BookList') IS NULL CREATE DATABASE BookList'; then \
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i /tmp/01_create-booksDB.sql; \
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i /tmp/02_insert_to_booksDB.sql; \
    fi; \
    sleep 10; \
    python3 /tmp/connectDB.py; \
    wait"



















