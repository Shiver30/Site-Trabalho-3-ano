-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema banco
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema banco
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `banco` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `banco` ;

-- -----------------------------------------------------
-- Table `banco`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`usuarios` (
  `usuarios_id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_nome` VARCHAR(255) NOT NULL,
  `usuarios_idade` DATE NOT NULL,
  `usuarios_cpf` CHAR(15) NOT NULL,
  `usuarios_sexo` VARCHAR(45) NOT NULL,
  `usuarios_email` VARCHAR(255) NOT NULL,
  `usuarios_senha` VARCHAR(255) NOT NULL,
  `usuario_img` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`usuarios_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `banco`.`avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`avaliacao` (
  `avaliacao_id` INT NOT NULL AUTO_INCREMENT,
  `avaliacao_nota` TINYINT NOT NULL,
  `avaliacao_descricao` VARCHAR(255) NULL DEFAULT NULL,
  `avaliacao_usuarios_id` INT NOT NULL,
  PRIMARY KEY (`avaliacao_id`),
  INDEX `fk_avaliacao_usuarios1_idx` (`avaliacao_usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_avaliacao_usuarios1`
    FOREIGN KEY (`avaliacao_usuarios_id`)
    REFERENCES `banco`.`usuarios` (`usuarios_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `banco`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`estado` (
  `estado_id` INT NOT NULL AUTO_INCREMENT,
  `estado_nome` VARCHAR(45) NOT NULL,
  `estado_uf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`estado_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `banco`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`cidade` (
  `cidade_id` INT NOT NULL AUTO_INCREMENT,
  `cidade_nome` VARCHAR(45) NOT NULL,
  `estado_estado_id` INT NOT NULL,
  PRIMARY KEY (`cidade_id`),
  INDEX `fk_cidade_estado1_idx` (`estado_estado_id` ASC) VISIBLE,
  CONSTRAINT `fk_cidade_estado1`
    FOREIGN KEY (`estado_estado_id`)
    REFERENCES `banco`.`estado` (`estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `banco`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`endereco` (
  `endereco-id` INT NOT NULL AUTO_INCREMENT,
  `endereco_usuarios_id` INT NOT NULL,
  `cidade_cidade_id` INT NOT NULL,
  PRIMARY KEY (`endereco-id`),
  INDEX `fk_endereco_usuarios_idx` (`endereco_usuarios_id` ASC) VISIBLE,
  INDEX `fk_endereco_cidade1_idx` (`cidade_cidade_id` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_usuarios`
    FOREIGN KEY (`endereco_usuarios_id`)
    REFERENCES `banco`.`usuarios` (`usuarios_id`),
  CONSTRAINT `fk_endereco_cidade1`
    FOREIGN KEY (`cidade_cidade_id`)
    REFERENCES `banco`.`cidade` (`cidade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `banco`.`mensagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`mensagem` (
  `mensagem_id` INT NOT NULL AUTO_INCREMENT,
  `mensagem_texto` VARCHAR(255) NOT NULL,
  `mensagem_hora` TIMESTAMP NOT NULL,
  `mensagem_usuarios_id` INT NOT NULL,
  PRIMARY KEY (`mensagem_id`),
  INDEX `fk_mensagem_usuarios1_idx` (`mensagem_usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_mensagem_usuarios1`
    FOREIGN KEY (`mensagem_usuarios_id`)
    REFERENCES `banco`.`usuarios` (`usuarios_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `banco`.`servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`servico` (
  `servico_id` INT NOT NULL AUTO_INCREMENT,
  `servico_nome` VARCHAR(100) NOT NULL,
  `servico_classe` VARCHAR(45) NOT NULL,
  `servico_descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`servico_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `banco`.`usn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`usn` (
  `usn_servico_id` INT NOT NULL,
  `usn_usuarios_id` INT NOT NULL,
  PRIMARY KEY (`usn_servico_id`, `usn_usuarios_id`),
  INDEX `fk_servico_has_usuarios_usuarios1_idx` (`usn_usuarios_id` ASC) VISIBLE,
  INDEX `fk_servico_has_usuarios_servico1_idx` (`usn_servico_id` ASC) VISIBLE,
  CONSTRAINT `fk_servico_has_usuarios_servico1`
    FOREIGN KEY (`usn_servico_id`)
    REFERENCES `banco`.`servico` (`servico_id`),
  CONSTRAINT `fk_servico_has_usuarios_usuarios1`
    FOREIGN KEY (`usn_usuarios_id`)
    REFERENCES `banco`.`usuarios` (`usuarios_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `banco` ;

-- -----------------------------------------------------
-- Placeholder table for view `banco`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `banco`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banco`.`view1`;
USE `banco`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
