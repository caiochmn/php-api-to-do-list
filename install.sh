#!/bin/bash

#
sudo apt-get update
sudo apt-get install -y apache2 php libapache2-mod-php php-mysql -y

# Instala o PHP e o Composer
sudo apt-get install php composer -y

# Instala o servidor MySQL
sudo apt-get install mysql-server -y

# Instala git
sudo apt install git

# Inicia o serviço do MySQL
sudo service mysql start

# Cria o usuário e o banco de dados para a API
sudo mysql -u root   <<EOF
CREATE DATABASE IF NOT EXISTS todolistls;
USE todolistls;
CREATE TABLE IF NOT EXISTS users (
    id       INT(3)         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(50)    NOT NULL,
    email    VARCHAR(50)    NOT NULL,
    username VARCHAR(32)    NOT NULL,
    password VARCHAR(32)    NOT NULL,
    token    VARCHAR(20)    NOT NULL,
    picture  TEXT           DEFAULT NULL
);
CREATE TABLE IF NOT EXISTS tasks (
    id       INT(3)         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    userId   INT(3)         NOT NULL,
    name     VARCHAR(50)    NOT NULL,
    date     DATE           NOT NULL,
    realized INT(1)         NOT NULL,
    FOREIGN KEY (userId)
        REFERENCES users(id)
        ON DELETE CASCADE
);
CREATE USER 'todolistuser'@'localhost' IDENTIFIED BY 'nbJichnm7lU=';
GRANT ALL PRIVILEGES ON todolistls.* TO 'todolistuser'@'localhost';

EOF

# Clona o repositório da API do GitHub
git clone https://github.com/EdsonMSouza/php-api-to-do-list.git

# Copia a API para o diretório do Apache
sudo cp -r php-api-to-do-list /var/www/html/

# Acessa a pasta da API
cd /var/www/html/php-api-to-do-list

# Altera permissão de escrita no diretório 
chmod 775 -R  /var/www/html/php-api-to-do-list

# Alterar permissão do usuário apache  no diretório 
chmod www-data:ww-data -R  /var/www/html/php-api-to-do-list

# Instala as dependências do Composer
composer install

# Copia o arquivo de configuração do banco de dados
#sudo sudo touch  .env

# Atualiza as informações de configuração do banco de dados no arquivo Database.php
sed -i "s/db_name = 'api'/db_name = 'todolistls'/g; s/db_user = 'admin'/db_user = 'todolistuser'/g; s/db_password = 'admin'/db_password = 'nbJichnm7lU='/g"  /var/www/html/php-api-to-do-list/src/Database/Database.php
