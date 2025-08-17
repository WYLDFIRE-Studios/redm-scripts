
CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` longtext DEFAULT NULL,
  `playername` longtext DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `charidentifier` int(11) DEFAULT NULL,
  `issuer` longtext DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;



CREATE TABLE IF NOT EXISTS `container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext DEFAULT NULL,
  `items` longtext NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO `container` (`id`, `name`, `items`) VALUES
	(1, 'police', '[]'),
	(2, 'miner', '[]'),
	(3, 'horsetrainer', '[]'),
	(4, 'doctor', '[]');

CREATE TABLE IF NOT EXISTS `society` (
  `job` longtext DEFAULT NULL,
  `jobgrade` int(11) DEFAULT NULL,
  `salary` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `society` (`job`, `jobgrade`, `salary`) VALUES
	('police', 0, 0),
	('police', 1, 0),
	('police', 2, 0),
	('police', 3, 0),
	('police', 4, 0),
	('police', 5, 0),
	('police', 6, 30),
	('miner', 1, 0),
	('miner', 2, 0),
	('miner', 3, 0),
	('miner', 4, 0),
	('miner', 0, 0),
	('doctor', 0, 0),
	('doctor', 1, 0),
	('doctor', 2, 0),
	('doctor', 3, 0),
	('horsetrainer', 0, 0),
	('horsetrainer', 1, 0),
	('horsetrainer', 2, 0),
	('horsetrainer', 3, 0),
	('horsetrainer', 4, 0);


CREATE TABLE IF NOT EXISTS `society_ledger` (
  `job` longtext DEFAULT NULL,
  `ledger` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `society_ledger` (`job`, `ledger`) VALUES
	('police', 150),
	('miner', 0),
	('doctor', 50),
	('horsetrainer', 0);

