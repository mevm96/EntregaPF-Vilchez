USE ch_pf_vilchez;

-- /// CREACION DE USUARIOS /// 
-- Se le asigna un nombre de usuario para que se reconozca facilmente en la base de datos y una contraseña.
CREATE USER 'read_only_usuario1'@'localhost' IDENTIFIED BY 'passReadOnly';
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY 'passAllButDelete';

-- con el Grant seguido por la accion especifica para la cual se le dara permiso, seguido del nombre de la base de datos y 
-- el * comodin para indicar que es a todas las tablas, por ultimo va el nombre de usuario al que se le asigna el permiso.
GRANT SELECT ON ch_pf_vilchez.* TO 'read_only_usuario1'@'localhost'; -- con solo select nada mas puede leer la info en las tablas
GRANT SELECT, UPDATE, INSERT ON ch_pf_vilchez.* TO 'usuario2'@'localhost'; -- con select, update e insert puede leer, insertar y actualizar registros.

-- Es necesario utilizar el siguiente command para aplicar los cambios inmediatamente.
FLUSH PRIVILEGES;
