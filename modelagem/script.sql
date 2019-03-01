-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema holoagile
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema holoagile
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `holoagile` DEFAULT CHARACTER SET utf8 ;
USE `holoagile` ;

-- -----------------------------------------------------
-- Table `holoagile`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`role` (
  `idrole` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `date_created` DATETIME NOT NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`idrole`, `name`, `description`, `date_created`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`terms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`terms` (
  `idterms` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(1000) NOT NULL,
  `hash_description` VARCHAR(256) NOT NULL,
  `address_transaction` VARCHAR(100) NOT NULL,
  `date_created` VARCHAR(45) NOT NULL,
  `date_updated` VARCHAR(45) NULL,
  PRIMARY KEY (`idterms`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `email_confirmed` VARCHAR(1) NOT NULL,
  `active` VARCHAR(1) NOT NULL,
  `data_created` DATETIME NOT NULL,
  `data_updated` DATETIME NULL,
  `role_idrole` INT NOT NULL,
  `terms_idterms` INT NOT NULL,
  PRIMARY KEY (`iduser`, `role_idrole`, `terms_idterms`),
  INDEX `fk_user_role1_idx` (`role_idrole` ASC) VISIBLE,
  INDEX `fk_user_terms1_idx` (`terms_idterms` ASC) VISIBLE,
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_idrole`)
    REFERENCES `holoagile`.`role` (`idrole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_terms1`
    FOREIGN KEY (`terms_idterms`)
    REFERENCES `holoagile`.`terms` (`idterms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`profile` (
  `idprofile` INT NOT NULL AUTO_INCREMENT,
  `linkedin` VARCHAR(100) NULL,
  `picture` VARCHAR(100) NULL,
  `date_created` DATETIME NOT NULL,
  `date_updated` DATETIME NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`idprofile`, `user_iduser`),
  INDEX `fk_profile_user_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_profile_user`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `holoagile`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`skill` (
  `idskill` INT NOT NULL AUTO_INCREMENT,
  `skill` VARCHAR(100) NOT NULL,
  `profile_idprofile` INT NOT NULL,
  PRIMARY KEY (`idskill`),
  INDEX `fk_skill_profile1_idx` (`profile_idprofile` ASC) VISIBLE,
  CONSTRAINT `fk_skill_profile1`
    FOREIGN KEY (`profile_idprofile`)
    REFERENCES `holoagile`.`profile` (`idprofile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`alerts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`alerts` (
  `idsubscription` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `iduser` INT NULL,
  `active` VARCHAR(1) NULL,
  `date_created` DATETIME NOT NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`idsubscription`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`product` (
  `idproject` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `wallet` VARCHAR(100) NULL,
  `trello` VARCHAR(100) NULL,
  `active` VARCHAR(1) NOT NULL,
  `site` VARCHAR(100) NULL,
  `description` VARCHAR(100) NOT NULL,
  `date_created` DATETIME NOT NULL,
  `date_updated` DATETIME NULL,
  `date_started` DATETIME NULL,
  `date_finish` DATETIME NULL,
  `isEducation` VARCHAR(1) NOT NULL,
  `isLabs` VARCHAR(1) NOT NULL,
  `isSolutions` VARCHAR(1) NOT NULL,
  `user_iduser` INT NOT NULL,
  `github` VARCHAR(100) NULL,
  `nda` VARCHAR(1) NOT NULL,
  `public` VARCHAR(1) NOT NULL,
  `details` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idproject`, `user_iduser`),
  INDEX `fk_project_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_project_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `holoagile`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`wallet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`wallet` (
  `idwallet` INT NOT NULL AUTO_INCREMENT,
  `data_created` DATETIME NOT NULL,
  `address` VARCHAR(100) NULL,
  `data_updated` DATETIME NULL,
  `profile_idprofile` INT NOT NULL,
  `project_idproject` INT NOT NULL,
  PRIMARY KEY (`idwallet`, `data_created`),
  INDEX `fk_wallet_profile1_idx` (`profile_idprofile` ASC) VISIBLE,
  INDEX `fk_wallet_project1_idx` (`project_idproject` ASC) VISIBLE,
  CONSTRAINT `fk_wallet_profile1`
    FOREIGN KEY (`profile_idprofile`)
    REFERENCES `holoagile`.`profile` (`idprofile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wallet_project1`
    FOREIGN KEY (`project_idproject`)
    REFERENCES `holoagile`.`product` (`idproject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`colabs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`colabs` (
  `idcolabs` INT NOT NULL AUTO_INCREMENT,
  `project_idproject` INT NOT NULL,
  `user_iduser` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `date_updated` DATETIME NULL,
  `status` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idcolabs`),
  INDEX `fk_colabs_project1_idx` (`project_idproject` ASC, `user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_colabs_project1`
    FOREIGN KEY (`project_idproject` , `user_iduser`)
    REFERENCES `holoagile`.`product` (`idproject` , `user_iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`points`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`points` (
  `idpoints` INT NOT NULL AUTO_INCREMENT,
  `qtd` INT NOT NULL,
  `date_created` DATETIME NOT NULL,
  `date_updated` DATETIME NULL,
  `colabs_idcolabs` INT NOT NULL,
  PRIMARY KEY (`idpoints`, `colabs_idcolabs`),
  INDEX `fk_points_colabs1_idx` (`colabs_idcolabs` ASC) VISIBLE,
  CONSTRAINT `fk_points_colabs1`
    FOREIGN KEY (`colabs_idcolabs`)
    REFERENCES `holoagile`.`colabs` (`idcolabs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`documents` (
  `iddocuments` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `data_created` DATETIME NOT NULL,
  `date_updated` DATETIME NULL,
  `document_hash` VARCHAR(100) NOT NULL,
  `address_file` VARCHAR(200) NOT NULL,
  `product_idproject` INT NOT NULL,
  PRIMARY KEY (`iddocuments`),
  INDEX `fk_documents_product1_idx` (`product_idproject` ASC) VISIBLE,
  CONSTRAINT `fk_documents_product1`
    FOREIGN KEY (`product_idproject`)
    REFERENCES `holoagile`.`product` (`idproject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holoagile`.`user_alert`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holoagile`.`user_alert` (
  `iduser_alert` INT NOT NULL AUTO_INCREMENT,
  `user_iduser` INT NOT NULL,
  `alerts_idsubscription` INT NOT NULL,
  PRIMARY KEY (`iduser_alert`),
  INDEX `fk_user_alert_user1_idx` (`user_iduser` ASC) VISIBLE,
  INDEX `fk_user_alert_alerts1_idx` (`alerts_idsubscription` ASC) VISIBLE,
  CONSTRAINT `fk_user_alert_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `holoagile`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_alert_alerts1`
    FOREIGN KEY (`alerts_idsubscription`)
    REFERENCES `holoagile`.`alerts` (`idsubscription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
