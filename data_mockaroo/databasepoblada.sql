USE rscamino;
SET FOREIGN_KEY_CHECKS=0;
CREATE TABLE usuarios
(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	fechacreacion DATE NOT NULL,
    username VARCHAR(30) UNIQUE NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fotoperfil MEDIUMBLOB, 
    email VARCHAR(50),
    contraseña VARCHAR(20) NOT NULL,
    verificado BOOLEAN NOT NULL
);

CREATE TABLE establecimientos
(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre TINYTEXT NOT NULL,
    descripcion TINYTEXT NOT NULL,
    longitud DECIMAL(11,8) signed NOT NULL,
    latitud DECIMAL(10,8) signed NOT NULL,
    imagen MEDIUMBLOB
);

CREATE TABLE imagenes
(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fechasubida DATETIME NOT NULL,
    descripcion TINYTEXT,
    imagen MEDIUMBLOB,
    likes int unsigned,
	id_establecimiento INT UNSIGNED, 
    FOREIGN KEY (id_establecimiento)
    REFERENCES establecimientos(id)
    );

CREATE TABLE valoraciones
(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fechavaloracion DATETIME NOT NULL,
    comentario TINYTEXT,
	puntaje varchar(1),
    id_usuario INT UNSIGNED,
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios(id),
    id_establecimiento INT UNSIGNED,
    FOREIGN KEY (id_establecimiento)
    REFERENCES establecimientos(id)
);

CREATE TABLE usuarios_imagenes
(
	id_usuario INT unsigned,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    id_imagen INT unsigned,
    FOREIGN KEY (id_imagen) REFERENCES imagenes(id),
    likes BOOLEAN,
	comentario TEXT,
    PRIMARY KEY (id_usuario, id_imagen)
);


 
 
 SET FOREIGN_KEY_CHECKS=1;