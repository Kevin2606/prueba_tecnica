-- Active: 1687979892591@@localhost@3306@prueba_tecnica_db
CREATE DATABASE IF NOT EXISTS prueba_tecnica_db;
use prueba_tecnica_db;

CREATE TABLE users(
    id BIGINT(20) UNSIGNED PRIMARY KEY ,
    nombre VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    email_verified_at TIMESTAMP,
    estado TINYINT(4) NOT NULL,
    created_by BIGINT(20) UNSIGNED ,
    update_by BIGINT(20) UNSIGNED,
    foto VARCHAR(255),
    password VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bodegas(
    id BIGINT(20) UNSIGNED PRIMARY KEY,
    nombre VARCHAR(255),
    id_responsable BIGINT(20) UNSIGNED ,
    estado TINYINT(4) ,
    created_by BIGINT(20) UNSIGNED ,
    update_by BIGINT(20) UNSIGNED ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_responsable) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (update_by) REFERENCES users(id)
);

CREATE TABLE historiales(
    id BIGINT(20) UNSIGNED PRIMARY KEY,
    cantidad INT(11),
    id_bodega_origen BIGINT(20) UNSIGNED ,
    id_bodega_destino BIGINT(20) UNSIGNED ,
    id_inventario BIGINT(20) UNSIGNED ,
    created_by BIGINT(20) UNSIGNED ,
    update_by BIGINT(20) UNSIGNED ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_bodega_origen) REFERENCES bodegas(id),
    FOREIGN KEY (id_bodega_destino) REFERENCES bodegas(id),
    FOREIGN KEY (id_inventario) REFERENCES inventarios(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (update_by) REFERENCES users(id)
);

CREATE TABLE inventarios(
    id BIGINT(20) UNSIGNED PRIMARY KEY,
    id_bodega BIGINT(20) UNSIGNED,
    id_producto BIGINT(20) UNSIGNED,
    cantidad INT(11) ,
    created_by BIGINT(20) UNSIGNED ,
    update_by BIGINT(20) UNSIGNED ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_bodega) REFERENCES bodegas(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (update_by) REFERENCES users(id)
);

CREATE TABLE productos(
    id BIGINT(20) UNSIGNED PRIMARY KEY,
    nombre VARCHAR(255) ,
    descripcion VARCHAR(255) ,
    estado TINYINT(4) ,
    created_by BIGINT(20) UNSIGNED ,
    update_by BIGINT(20) UNSIGNED ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (update_by) REFERENCES users(id)
);
