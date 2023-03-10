-- MySQL Script generated by MySQL Workbench
-- Mon Jan  2 19:18:03 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `foto` LONGTEXT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `logo` LONGTEXT NULL,
  `portada` LONGTEXT NULL,
  `presentacion` LONGTEXT NOT NULL,
  `linkedin` LONGTEXT NULL,
  `github` LONGTEXT NULL,
  `codepen` LONGTEXT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `usuario_id`),
  INDEX `fk_persona_usuario_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_persona_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`experiencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `puesto` VARCHAR(255) NOT NULL,
  `logo` LONGTEXT NULL,
  `persona_id` INT NOT NULL,
  `persona_usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`, `persona_usuario_id`),
  INDEX `fk_experiencia_persona1_idx` (`persona_id` ASC, `persona_usuario_id` ASC),
  CONSTRAINT `fk_experiencia_persona1`
    FOREIGN KEY (`persona_id` , `persona_usuario_id`)
    REFERENCES `mydb`.`persona` (`id` , `usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`educacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `certificado` LONGTEXT NULL,
  `persona_id` INT NOT NULL,
  `persona_usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`, `persona_usuario_id`),
  INDEX `fk_educacion_persona1_idx` (`persona_id` ASC, `persona_usuario_id` ASC),
  CONSTRAINT `fk_educacion_persona1`
    FOREIGN KEY (`persona_id` , `persona_usuario_id`)
    REFERENCES `mydb`.`persona` (`id` , `usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`habilidad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `porcentaje` INT UNSIGNED NOT NULL,
  `persona_id` INT NOT NULL,
  `persona_usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`, `persona_usuario_id`),
  INDEX `fk_habilidad_persona1_idx` (`persona_id` ASC, `persona_usuario_id` ASC),
  CONSTRAINT `fk_habilidad_persona1`
    FOREIGN KEY (`persona_id` , `persona_usuario_id`)
    REFERENCES `mydb`.`persona` (`id` , `usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proyecto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` LONGTEXT NULL,
  `img` LONGTEXT NULL,
  `detalle` LONGTEXT NULL,
  `url` LONGTEXT NOT NULL,
  `persona_id` INT NOT NULL,
  `persona_usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`, `persona_usuario_id`),
  INDEX `fk_proyecto_persona1_idx` (`persona_id` ASC, `persona_usuario_id` ASC),
  CONSTRAINT `fk_proyecto_persona1`
    FOREIGN KEY (`persona_id` , `persona_usuario_id`)
    REFERENCES `mydb`.`persona` (`id` , `usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
