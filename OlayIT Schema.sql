-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Clinical_Organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clinical_Organization` (
  `Org_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Size` VARCHAR(45) NULL,
  PRIMARY KEY (`Org_ID`));


-- -----------------------------------------------------
-- Table `mydb`.`Clinical_User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clinical_User` (
  `User_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Org_ID` INT NULL,
  `Role` VARCHAR(45) NULL,
  PRIMARY KEY (`User_ID`),
  INDEX `Organazation_idx` (`Org_ID` ASC),
  CONSTRAINT `Organazation`
    FOREIGN KEY (`Org_ID`)
    REFERENCES `mydb`.`Clinical_Organization` (`Org_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Vendor_Organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendor_Organization` (
  `Org_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Org_ID`));


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `Product_ID` INT NOT NULL,
  `Vendor_ID` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Product_Type` VARCHAR(45) NULL,
  `Desc` VARCHAR(500) NULL,
  PRIMARY KEY (`Product_ID`),
  INDEX `Vendor_ID_idx` (`Vendor_ID` ASC),
  CONSTRAINT `Vendor_ID`
    FOREIGN KEY (`Vendor_ID`)
    REFERENCES `mydb`.`Vendor_Organization` (`Org_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Vendor_Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendor_Users` (
  `User_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Org_ID` INT NULL,
  PRIMARY KEY (`User_ID`),
  INDEX `Vendor_ID_idx` (`Org_ID` ASC),
  CONSTRAINT `Vendor_ID`
    FOREIGN KEY (`Org_ID`)
    REFERENCES `mydb`.`Vendor_Organization` (`Org_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reviews` (
  `Clinical_ID` INT NOT NULL,
  `Product_ID` INT NOT NULL,
  `Rating` INT NULL,
  `Review` VARCHAR(500) NULL,
  PRIMARY KEY (`Clinical_ID`, `Product_ID`),
  INDEX `Product_ID_idx` (`Product_ID` ASC),
  CONSTRAINT `ClinicalID`
    FOREIGN KEY (`Clinical_ID`)
    REFERENCES `mydb`.`Clinical_User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Product_ID`
    FOREIGN KEY (`Product_ID`)
    REFERENCES `mydb`.`Products` (`Product_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mydb`.`Favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Favorites` (
  `Clinical_ID` INT NOT NULL,
  `Product_ID` INT NOT NULL,
  PRIMARY KEY (`Clinical_ID`, `Product_ID`),
  INDEX `ProductID_idx` (`Product_ID` ASC),
  CONSTRAINT `ProductID`
    FOREIGN KEY (`Product_ID`)
    REFERENCES `mydb`.`Products` (`Product_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Clinical_ID`
    FOREIGN KEY (`Clinical_ID`)
    REFERENCES `mydb`.`Clinical_User` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);