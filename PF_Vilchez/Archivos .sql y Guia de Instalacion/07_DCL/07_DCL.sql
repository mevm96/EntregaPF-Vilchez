USE pf_vilchez;

CREATE USER 'read_only_user1'@'localhost' IDENTIFIED BY 'passReadOnly';
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'passAllButDelete';

GRANT SELECT ON pf_vilchez.* TO 'read_only_user1'@'localhost'; -- con solo select nada mas puede leer la informacion en las tablas
GRANT SELECT, UPDATE, INSERT ON pf_vilchez.* TO 'user2'@'localhost'; -- con select, update e insert puede leer, insertar y actualizar registros.

-- Es necesario utilizar el siguiente command para aplicar los cambios inmediatamente.
FLUSH PRIVILEGES;
