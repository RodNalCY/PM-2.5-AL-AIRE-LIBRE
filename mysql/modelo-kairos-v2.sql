-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbhackutecv2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbhackutecv2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbhackutecv2` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `dbhackutecv2` ;

-- -----------------------------------------------------
-- Table `dbhackutecv2`.`tbusuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhackutecv2`.`tbusuarios` (
  `id_usuarios` INT(11) NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(8) CHARACTER SET 'utf8' NOT NULL,
  `nombres` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  `apellidos` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `password` VARCHAR(60) CHARACTER SET 'utf8' NOT NULL,
  `token` VARCHAR(80) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id_usuarios`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbhackutecv2`.`tbestacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhackutecv2`.`tbestacion` (
  `id_estacion` INT(11) NOT NULL,
  `estacion` VARCHAR(45) NULL DEFAULT NULL,
  `latitud` DECIMAL(20,15) NULL DEFAULT NULL,
  `longitud` DECIMAL(20,15) NULL DEFAULT NULL,
  `ciudad` VARCHAR(45) NULL DEFAULT NULL,
  `tbusuarios_id_usuarios` INT(11) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `delete_at` TIMESTAMP NULL,
  PRIMARY KEY (`id_estacion`),
  INDEX `fk_tbestacion_tbusuarios_idx` (`tbusuarios_id_usuarios` ASC) ,
  CONSTRAINT `fk_tbestacion_tbusuarios`
    FOREIGN KEY (`tbusuarios_id_usuarios`)
    REFERENCES `dbhackutecv2`.`tbusuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbhackutecv2`.`tbsensor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhackutecv2`.`tbsensor` (
  `cod_sensor` VARCHAR(45) NOT NULL,
  `sensor` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(256) NULL DEFAULT NULL,
  `tbestacion_id_estacion` INT(11) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`cod_sensor`),
  UNIQUE INDEX `modelo_UNIQUE` (`cod_sensor` ASC),
  INDEX `fk_tbsensor_tbestacion1_idx` (`tbestacion_id_estacion` ASC),
  CONSTRAINT `fk_tbsensor_tbestacion1`
    FOREIGN KEY (`tbestacion_id_estacion`)
    REFERENCES `dbhackutecv2`.`tbestacion` (`id_estacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbhackutecv2`.`tbmedidas_amoniaco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhackutecv2`.`tbmedidas_amoniaco` (
  `id_medidas` INT(11) NOT NULL,
  `medida` VARCHAR(45) NULL,
  `estado` INT(11) NULL,
  `tbsensor_cod_sensor` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id_medidas`),
  INDEX `fk_tbmedidas_amoniaco_tbsensor1_idx` (`tbsensor_cod_sensor` ASC) ,
  CONSTRAINT `fk_tbmedidas_amoniaco_tbsensor1`
    FOREIGN KEY (`tbsensor_cod_sensor`)
    REFERENCES `dbhackutecv2`.`tbsensor` (`cod_sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbhackutecv2`.`tbmedidas_co`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhackutecv2`.`tbmedidas_co` (
  `id_medidas` INT(11) NOT NULL,
  `medida` DOUBLE(8,2) NULL,
  `estado` INT(11) NULL,
  `tbsensor_cod_sensor` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_medidas`),
  INDEX `fk_tbmedidas_co_tbsensor1_idx` (`tbsensor_cod_sensor` ASC) ,
  CONSTRAINT `fk_tbmedidas_co_tbsensor1`
    FOREIGN KEY (`tbsensor_cod_sensor`)
    REFERENCES `dbhackutecv2`.`tbsensor` (`cod_sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbhackutecv2`.`tbmedidas_humedad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhackutecv2`.`tbmedidas_humedad` (
  `id_tbmedidas` INT(11) NOT NULL,
  `medida` DOUBLE(8,2) NULL,
  `estado` INT(11) NULL,
  `tbsensor_cod_sensor` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tbmedidas`),
  INDEX `fk_tbmedidas_humedad_tbsensor1_idx` (`tbsensor_cod_sensor` ASC) ,
  CONSTRAINT `fk_tbmedidas_humedad_tbsensor1`
    FOREIGN KEY (`tbsensor_cod_sensor`)
    REFERENCES `dbhackutecv2`.`tbsensor` (`cod_sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbhackutecv2`.`tbmedidas_ph`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhackutecv2`.`tbmedidas_ph` (
  `id_medidas` INT(11) NOT NULL,
  `medida` VARCHAR(45) NULL,
  `estado` INT(11) NULL,
  `tbsensor_cod_sensor` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id_medidas`),
  INDEX `fk_tbmedidas_ph_tbsensor1_idx` (`tbsensor_cod_sensor` ASC) ,
  CONSTRAINT `fk_tbmedidas_ph_tbsensor1`
    FOREIGN KEY (`tbsensor_cod_sensor`)
    REFERENCES `dbhackutecv2`.`tbsensor` (`cod_sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbhackutecv2`.`tbmedidas_pm10`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhackutecv2`.`tbmedidas_pm10` (
  `id_medidas` INT(11) NOT NULL,
  `medida` VARCHAR(45) NULL,
  `estado` INT(11) NULL,
  `tbsensor_cod_sensor` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id_medidas`),
  INDEX `fk_tbmedidas_pm10_tbsensor1_idx` (`tbsensor_cod_sensor` ASC) ,
  CONSTRAINT `fk_tbmedidas_pm10_tbsensor1`
    FOREIGN KEY (`tbsensor_cod_sensor`)
    REFERENCES `dbhackutecv2`.`tbsensor` (`cod_sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbhackutecv2`.`tbmedidas_pm25`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhackutecv2`.`tbmedidas_pm25` (
  `id_medidas` INT(11) NOT NULL AUTO_INCREMENT,
  `medida` DOUBLE(8,2) NULL,
  `estado` INT(11) NULL,
  `tbsensor_cod_sensor` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_medidas`),
  INDEX `fk_tbmedidas_pm25_tbsensor1_idx` (`tbsensor_cod_sensor` ASC) ,
  CONSTRAINT `fk_tbmedidas_pm25_tbsensor1`
    FOREIGN KEY (`tbsensor_cod_sensor`)
    REFERENCES `dbhackutecv2`.`tbsensor` (`cod_sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbhackutecv2`.`tbmedidas_temperatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhackutecv2`.`tbmedidas_temperatura` (
  `id_medidas` INT(11) NOT NULL AUTO_INCREMENT,
  `medida` DOUBLE(8,2) NULL,
  `estado` INT(11) NULL,
  `tbsensor_cod_sensor` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_medidas`),
  INDEX `fk_tbmedidas_temperatura_tbsensor1_idx` (`tbsensor_cod_sensor` ASC) ,
  CONSTRAINT `fk_tbmedidas_temperatura_tbsensor1`
    FOREIGN KEY (`tbsensor_cod_sensor`)
    REFERENCES `dbhackutecv2`.`tbsensor` (`cod_sensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;

USE `dbhackutecv2` ;

-- -----------------------------------------------------
-- procedure megaconsulta
-- -----------------------------------------------------

DELIMITER $$
USE `dbhackutecv2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `megaconsulta`()
BEGIN
set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
SELECT * FROM ((SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 co.tbsensor_cod_sensor, 
 co.medida,
 co.f_registro,
 co.estado
FROM
tbmedidas_co AS co
INNER JOIN tbsensor ON co.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
co.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)
UNION
(SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 t.tbsensor_cod_sensor, 
 t.medida,
 t.f_registro,
 t.estado
FROM
tbmedidas_temperatura AS t
INNER JOIN tbsensor ON t.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
t.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)
UNION
(SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 h.tbsensor_cod_sensor, 
 h.medida,
 h.f_registro,
 h.estado
FROM
tbmedidas_humedad AS h
INNER JOIN tbsensor ON h.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
h.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)
UNION
(SELECT * FROM(SELECT
 tbestacion.estacion,
 tbestacion.latitud,
 tbestacion.longitud,
 tbestacion.ciudad,
 tbsensor.sensor,
 tbsensor.modelo,
 tbsensor.marca,
 pm.tbsensor_cod_sensor, 
 pm.medida,
 pm.f_registro,
 pm.estado
FROM
tbmedidas_pm25 AS pm
INNER JOIN tbsensor ON pm.tbsensor_cod_sensor = tbsensor.cod_sensor
INNER JOIN tbestacion ON tbsensor.tbestacion_id_estacion = tbestacion.id_estacion
ORDER BY
pm.f_registro DESC) as c GROUP BY c.tbsensor_cod_sensor)

) as cy ORDER BY cy.ciudad ASC;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
