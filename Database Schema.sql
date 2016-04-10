-- -----------------------------------------------------
-- Schema OlayIT
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema OlayIT
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OlayIT` DEFAULT CHARACTER SET utf8 ;
USE `OlayIT` ;

-- -----------------------------------------------------
-- Table `OlayIT`.`Clinical_Organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OlayIT`.`Clinical_Organization` (
  `Org_ID` INT NOT NULL,
  `Size` VARCHAR(45) NULL,
  PRIMARY KEY (`Org_ID`));


-- -----------------------------------------------------
-- Table `OlayIT`.`Clinical_User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OlayIT`.`Clinical_User` (
  `User_ID` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Organazation_ID` INT NULL,
  `Role` VARCHAR(45) NULL,
  PRIMARY KEY (`User_ID`),
  INDEX `Organazation_idx` (`Organazation_ID` ASC),
  CONSTRAINT `Organazation`
    FOREIGN KEY (`Organazation_ID`)
    REFERENCES `OlayIT`.`Clinical_Organization` (`Org_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `OlayIT`.`Vendor_Organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OlayIT`.`Vendor_Organization` (
  `OrganazationID` INT NOT NULL,
  PRIMARY KEY (`OrganazationID`));


-- -----------------------------------------------------
-- Table `OlayIT`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OlayIT`.`Products` (
  `Product_ID` INT NOT NULL,
  `Vendor_ID` INT NULL,
  `Product_Type` VARCHAR(45) NULL,
  `Desc` VARCHAR(500) NULL,
  PRIMARY KEY (`Product_ID`),
  INDEX `Vendor_ID_idx` (`Vendor_ID` ASC),
  CONSTRAINT `Vendor_ID`
    FOREIGN KEY (`Vendor_ID`)
    REFERENCES `OlayIT`.`Vendor_Organization` (`OrganazationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `OlayIT`.`Vendor_Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OlayIT`.`Vendor_Users` (
  `UserID` INT NOT NULL,
  `Organazation_ID` INT NULL,
  PRIMARY KEY (`UserID`),
  INDEX `Vendor_ID_idx` (`Organazation_ID` ASC),
  CONSTRAINT `Vendor_ID`
    FOREIGN KEY (`Organazation_ID`)
    REFERENCES `OlayIT`.`Vendor_Organization` (`OrganazationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `OlayIT`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OlayIT`.`Reviews` (
  `Clinical_ID` INT NOT NULL,
  `Product_ID` INT NOT NULL,
  `Rating` INT NULL,
  `Review` VARCHAR(500) NULL,
  PRIMARY KEY (`Clinical_ID`, `Product_ID`),
  INDEX `Product_ID_idx` (`Product_ID` ASC),
  CONSTRAINT `ClinicalID`
    FOREIGN KEY (`Clinical_ID`)
    REFERENCES `OlayIT`.`Clinical_User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Product_ID`
    FOREIGN KEY (`Product_ID`)
    REFERENCES `OlayIT`.`Products` (`Product_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `OlayIT`.`Favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OlayIT`.`Favorites` (
  `Clinical_ID` INT NOT NULL,
  `Product_ID` INT NOT NULL,
  PRIMARY KEY (`Clinical_ID`, `Product_ID`),
  INDEX `ProductID_idx` (`Product_ID` ASC),
  CONSTRAINT `ProductID`
    FOREIGN KEY (`Product_ID`)
    REFERENCES `OlayIT`.`Products` (`Product_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Clinical_ID`
    FOREIGN KEY (`Clinical_ID`)
    REFERENCES `OlayIT`.`Clinical_User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
