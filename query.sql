-- Active: 1687979892591@@localhost@3306@prueba_tecnica_db
CREATE DATABASE IF NOT EXISTS prueba_tecnica_db;
use prueba_tecnica_db;

CREATE TABLE bodegas(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT UNSIGNED,
    nombre VARCHAR(255) NOT NULL,
    id_responsable BIGINT(20) UNSIGNED NOT NULL, 
    estado TINYINT(4), 
    created_by BIGINT(20) UNSIGNED, 
    update_by BIGINT(20) UNSIGNED, 
    created_at TIMESTAMP, 
    updated_at TIMESTAMP, 
    deleted_at TIMESTAMP);
CREATE TABLE historiales(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT UNSIGNED,
    cantidad int(11),
    id_bodega_origen BIGINT(20) UNSIGNED NOT NULL,
    id_bodega_destino BIGINT(20) UNSIGNED NOT NULL,
    id_inventario BIGINT(20) UNSIGNED NOT NULL,
    created_by BIGINT(20) UNSIGNED,
    update_by BIGINT(20) UNSIGNED,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);
CREATE TABLE inventarios(
    id BIGINT(20) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_bodega BIGINT(20) UNSIGNED NOT NULL,
    id_producto BIGINT(20) UNSIGNED NOT NULL,
    cantidad int(11),
    created_by BIGINT(20) UNSIGNED,
    update_by BIGINT(20) UNSIGNED,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);
CREATE TABLE productos(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT UNSIGNED,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255),
    estado TINYINT(4),
    created_by BIGINT(20) UNSIGNED,
    update_by BIGINT(20) UNSIGNED,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);
CREATE TABLE users(
    id BIGINT(20) PRIMARY KEY AUTO_INCREMENT UNSIGNED,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    email_verified_at TIMESTAMP,
    password VARCHAR(255) NOT NULL,
    estado TINYINT(4),
    created_by BIGINT(20) UNSIGNED,
    update_by BIGINT(20) UNSIGNED,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);
/* bodegas */
ALTER TABLE bodegas ADD CONSTRAINT fk_id_responsable FOREIGN KEY (id_responsable) REFERENCES users(id);
ALTER TABLE bodegas ADD CONSTRAINT fk_created_by FOREIGN KEY (created_by) REFERENCES users(id);
ALTER TABLE bodegas ADD CONSTRAINT fk_update_by FOREIGN KEY (update_by) REFERENCES users(id);
/* historiales */
ALTER TABLE historiales ADD CONSTRAINT fk_id_bodega_origen FOREIGN KEY (id_bodega_origen) REFERENCES bodegas(id);
ALTER TABLE historiales ADD CONSTRAINT fk_id_bodega_destino FOREIGN KEY (id_bodega_destino) REFERENCES bodegas(id);
ALTER TABLE historiales ADD CONSTRAINT fk_id_inventario FOREIGN KEY (id_inventario) REFERENCES inventarios(id);
ALTER TABLE historiales ADD CONSTRAINT fk_created_by FOREIGN KEY (created_by) REFERENCES users(id);
ALTER TABLE historiales ADD CONSTRAINT fk_update_by FOREIGN KEY (update_by) REFERENCES users(id);
/* INVENTARIO*/