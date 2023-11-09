-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restaurante
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restaurante
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET utf8 ;
USE `restaurante` ;

-- -----------------------------------------------------
-- Table `restaurante`.`domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`domicilio` (
  `domicilio_id` INT NOT NULL,
  `calle` VARCHAR(25) NOT NULL,
  `colonia` VARCHAR(15) NOT NULL,
  `numero` INT NOT NULL,
  `telefono` VARCHAR(20) NULL,
  PRIMARY KEY (`domicilio_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante`.`domicilio_fiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`domicilio_fiscal` (
  `idFiscalDomicilio` INT NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `cp` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFiscalDomicilio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante`.`datos_fiscales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`datos_fiscales` (
  `datos_fiscales_id` INT NOT NULL,
  `RFC` VARCHAR(15) NOT NULL,
  `situacion fiscal` VARCHAR(45) NOT NULL,
  `domicilio_fiscal_idFiscalDomicilio` INT NOT NULL,
  PRIMARY KEY (`datos_fiscales_id`, `domicilio_fiscal_idFiscalDomicilio`),
  INDEX `fk_datos_fiscales_domicilio_fiscal1_idx` (`domicilio_fiscal_idFiscalDomicilio` ASC) VISIBLE,
  CONSTRAINT `fk_datos_fiscales_domicilio_fiscal1`
    FOREIGN KEY (`domicilio_fiscal_idFiscalDomicilio`)
    REFERENCES `restaurante`.`domicilio_fiscal` (`idFiscalDomicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`cliente` (
  `nombre` VARCHAR(35) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `cliente_id` INT NOT NULL,
  `domicilio_id` INT NOT NULL,
  `datos_fiscales_id` INT NOT NULL,
  PRIMARY KEY (`cliente_id`, `domicilio_id`),
  INDEX `fk_cliente_domicilio1_idx` (`domicilio_id` ASC) VISIBLE,
  INDEX `fk_cliente_datos_fiscales1_idx` (`datos_fiscales_id` ASC) VISIBLE)
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `restaurante`.`cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`cuenta` (
  `cuenta_id` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `cliente_cliente_id` INT NOT NULL,
  `cliente_domicilio_domicilio_id` INT NOT NULL,
  `estado_cuenta` ENUM('iniciada', 'procesando', 'entregada', 'cancelada') NOT NULL,
  `tipo_entrega` ENUM('domicilio', 'sucursal') NOT NULL,
  PRIMARY KEY (`cuenta_id`),
  INDEX `fk_orden_cliente1_idx` (`cliente_cliente_id` ASC, `cliente_domicilio_domicilio_id` ASC) VISIBLE,
  CONSTRAINT `fk_orden_cliente1`
    FOREIGN KEY (`cliente_cliente_id` , `cliente_domicilio_domicilio_id`)
    REFERENCES `restaurante`.`cliente` (`cliente_id` , `domicilio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`menu` (
  `idmenu` INT NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `precio` FLOAT NOT NULL,
  `tipo` ENUM('bebida', 'acompanamiento', 'postre', 'entrada', 'alimento') NULL,
  PRIMARY KEY (`idmenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`producto` (
  `idproducto` INT NOT NULL,
  `menu_idmenu` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `nota` VARCHAR(200) NULL,
  `cuenta_cuenta_id` INT NOT NULL,
  PRIMARY KEY (`idproducto`, `menu_idmenu`),
  INDEX `fk_producto_menu1_idx` (`menu_idmenu` ASC) VISIBLE,
  INDEX `fk_producto_cuenta1_idx` (`cuenta_cuenta_id` ASC) VISIBLE,
  CONSTRAINT `fk_producto_menu1`
    FOREIGN KEY (`menu_idmenu`)
    REFERENCES `restaurante`.`menu` (`idmenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_cuenta1`
    FOREIGN KEY (`cuenta_cuenta_id`)
    REFERENCES `restaurante`.`cuenta` (`cuenta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante`.`login` (
  `idlogin` INT NOT NULL,
  `email` VARCHAR(80) NULL,
  `password` VARCHAR(45) NULL,
  `cliente_cliente_id` INT NOT NULL,
  `cliente_domicilio_domicilio_id` INT NOT NULL,
  PRIMARY KEY (`idlogin`, `cliente_cliente_id`, `cliente_domicilio_domicilio_id`),
  INDEX `fk_login_cliente1_idx` (`cliente_cliente_id` ASC, `cliente_domicilio_domicilio_id` ASC) VISIBLE,
  CONSTRAINT `fk_login_cliente1`
    FOREIGN KEY (`cliente_cliente_id` , `cliente_domicilio_domicilio_id`)
    REFERENCES `restaurante`.`cliente` (`cliente_id` , `domicilio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
