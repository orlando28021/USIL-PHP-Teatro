SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `teatrodb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `teatrodb` ;

-- -----------------------------------------------------
-- Table `teatrodb`.`Obras`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `teatrodb`.`Obras` (
  `idObra` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NOT NULL ,
  `autor` VARCHAR(30) NOT NULL ,
  `director` VARCHAR(30) NOT NULL ,
  `actores` VARCHAR(60) NOT NULL ,
  `sala` INT NOT NULL ,
  `precio` FLOAT NOT NULL ,
  `temporada` YEAR NOT NULL ,
  `afiche` LONGBLOB NOT NULL ,
  `reseña` VARCHAR(150) NOT NULL ,
  PRIMARY KEY (`idObra`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teatrodb`.`Horarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `teatrodb`.`Horarios` (
  `idHorario` INT NOT NULL AUTO_INCREMENT ,
  `fecha` DATE NOT NULL ,
  `hora` TIME NOT NULL ,
  PRIMARY KEY (`idHorario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teatrodb`.`Usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `teatrodb`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `apellido` VARCHAR(45) NOT NULL ,
  `correo` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idUsuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teatrodb`.`Comentarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `teatrodb`.`Comentarios` (
  `idComentario` INT NOT NULL AUTO_INCREMENT ,
  `publicado` BINARY NOT NULL ,
  `comentario` VARCHAR(1000) NOT NULL ,
  `fechaRegistro` DATETIME NOT NULL ,
  `idObra` INT NOT NULL ,
  `idUsuario` INT NOT NULL ,
  PRIMARY KEY (`idComentario`, `idObra`, `idUsuario`) ,
  INDEX `fk_Comentarios_Obras` (`idObra` ASC) ,
  INDEX `fk_Comentarios_Usuarios1` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Comentarios_Obras`
    FOREIGN KEY (`idObra` )
    REFERENCES `teatrodb`.`Obras` (`idObra` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentarios_Usuarios1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `teatrodb`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teatrodb`.`Votos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `teatrodb`.`Votos` (
  `idVoto` INT NOT NULL AUTO_INCREMENT ,
  `voto` INT NOT NULL ,
  `puntaje` INT NOT NULL ,
  `idUsuario` INT NOT NULL ,
  PRIMARY KEY (`idVoto`, `idUsuario`) ,
  INDEX `fk_Votos_Usuarios1` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Votos_Usuarios1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `teatrodb`.`Usuarios` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teatrodb`.`Obras_has_Horarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `teatrodb`.`Obras_has_Horarios` (
  `idObra` INT NOT NULL ,
  `idHorario` INT NOT NULL ,
  PRIMARY KEY (`idObra`, `idHorario`) ,
  INDEX `fk_Obras_has_Horarios_Horarios1` (`idHorario` ASC) ,
  INDEX `fk_Obras_has_Horarios_Obras1` (`idObra` ASC) ,
  CONSTRAINT `fk_Obras_has_Horarios_Obras1`
    FOREIGN KEY (`idObra` )
    REFERENCES `teatrodb`.`Obras` (`idObra` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Obras_has_Horarios_Horarios1`
    FOREIGN KEY (`idHorario` )
    REFERENCES `teatrodb`.`Horarios` (`idHorario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teatrodb`.`Obras_has_Votaciones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `teatrodb`.`Obras_has_Votaciones` (
  `idObra` INT NOT NULL ,
  `idVotacion` INT NOT NULL ,
  PRIMARY KEY (`idObra`, `idVotacion`) ,
  INDEX `fk_Obras_has_Votaciones_Votaciones1` (`idVotacion` ASC) ,
  INDEX `fk_Obras_has_Votaciones_Obras1` (`idObra` ASC) ,
  CONSTRAINT `fk_Obras_has_Votaciones_Obras1`
    FOREIGN KEY (`idObra` )
    REFERENCES `teatrodb`.`Obras` (`idObra` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Obras_has_Votaciones_Votaciones1`
    FOREIGN KEY (`idVotacion` )
    REFERENCES `teatrodb`.`Votos` (`idVoto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
