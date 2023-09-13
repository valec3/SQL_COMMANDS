/* CREATE USERS */

CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'password';
/* DAR PRIVILEGIOS EN UNA BASE DE DATOS */

GRANT ALL PRIVILEGES ON 'name' . * TO 'usuario'@'localhost';

/* CONNECT DATABASE */
mysql -u root -p

mysql - u 'user' -p 'password'
mysql -u 'user' -p

/* CREATE DATA BASE */

CREATE DATABASE 'name';

/* SELECT DATABASE */

USE 'name';

/*

CREATE TABLE
example:

*/

CREATE TABLE 'name' (
    'id' INT(11) NOT NULL AUTO_INCREMENT,
    'name' VARCHAR(255) NOT NULL,
    'email' VARCHAR(255) NOT NULL,
    'password' VARCHAR(255) NOT NULL,
    'created_at' DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ('id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* INSERT RECORDS */

INSERT INTO 'name' ('name', 'email', 'password') VALUES ('name', 'email', 'password');

/* SELECT RECORDS */

SELECT * FROM 'name';