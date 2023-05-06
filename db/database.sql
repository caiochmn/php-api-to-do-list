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
CREATE USER 'todolistuser'@'%' IDENTIFIED BY 'nbJichnm7lU=';
GRANT ALL PRIVILEGES ON todolistls.* TO 'todolistuser'@'%';