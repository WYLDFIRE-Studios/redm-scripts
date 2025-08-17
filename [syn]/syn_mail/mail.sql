DELIMITER //
CREATE PROCEDURE AlterTableMail()
BEGIN
    DECLARE table_exists INT DEFAULT 0;
    DECLARE adress_exists INT DEFAULT 0;
    DECLARE adressbook_exists INT DEFAULT 0;
    DECLARE identifier_exists INT DEFAULT 0;

    -- Check if the table exists
    SELECT COUNT(*) INTO table_exists
    FROM information_schema.TABLES
    WHERE TABLE_NAME = 'mail';
    
    -- If table exists, check if columns exist
    IF table_exists = 1 THEN
        SELECT COUNT(*) INTO adress_exists
        FROM information_schema.COLUMNS
        WHERE TABLE_NAME = 'mail' AND COLUMN_NAME = 'adress';

        SELECT COUNT(*) INTO adressbook_exists
        FROM information_schema.COLUMNS
        WHERE TABLE_NAME = 'mail' AND COLUMN_NAME = 'adressbook';

        SELECT COUNT(*) INTO identifier_exists
        FROM information_schema.COLUMNS
        WHERE TABLE_NAME = 'mail' AND COLUMN_NAME = 'identifier';

        -- Conditional altering
        IF adress_exists = 1 THEN
            SET @sql = 'ALTER TABLE mail CHANGE `adress` `address` int(11) NOT NULL AUTO_INCREMENT;';
            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;

        IF adressbook_exists = 1 THEN
            SET @sql = 'ALTER TABLE mail DROP COLUMN adressbook;';
            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;

        IF identifier_exists = 1 THEN
            SET @sql = 'ALTER TABLE mail DROP COLUMN identifier;';
            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;
    END IF;
END;
//
DELIMITER ;

-- Call the stored procedure
CALL AlterTableMail();



CREATE TABLE IF NOT EXISTS `mail` (
  `address` int(11) NOT NULL AUTO_INCREMENT,
  `charidentifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`address`)
); 

CREATE TABLE IF NOT EXISTS `mail_addressbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `poBox` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address` (`address`),
  CONSTRAINT `mail_addressbook_ibfk_1` FOREIGN KEY (`address`) REFERENCES `mail` (`address`)
); 

CREATE TABLE IF NOT EXISTS `mails` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `anon` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `from` longtext DEFAULT NULL,
  `to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `subject` longtext DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `folder` longtext DEFAULT NULL,
  `fromName` longtext DEFAULT NULL,
  `toNames` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `date` longtext DEFAULT NULL,
  `hidesent` tinyint(4) DEFAULT 0,
  `copyTo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS mail_editableFolders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address INT,
    folderName VARCHAR(255),
    FOREIGN KEY (address) REFERENCES mail(address)
);

