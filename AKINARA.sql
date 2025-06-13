create database if not exists AkihabaraDB;
use AkihabaraDB;
drop table productos;
CREATE TABLE productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  categoria VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL,
  descripcion TEXT NULL
);

select * from productos;
delete from productos where id=2;