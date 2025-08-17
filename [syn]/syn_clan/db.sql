
CREATE TABLE IF NOT EXISTS `clan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` longtext NOT NULL DEFAULT '[]',
  `cash` tinytext NOT NULL DEFAULT 0,
  `inventory` longtext NOT NULL DEFAULT '[]',
  `invlimit` int(11) DEFAULT 1000,
  `repo` int(11) DEFAULT 0,
  `taxmoney` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `coords` (`id`),
  KEY `container` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4;

ALTER TABLE `characters` ADD COLUMN `clan` INT(11) NULL DEFAULT 0;

INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('lockpick', 'Lockpick', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('flag', 'Camp Flag', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('chestc', 'Chest C', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('pokerset', 'Poker Table Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('hitchingpost', 'Hitching Post', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('butchertable3', 'Large Butcher Table', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('butchertable2', 'Medium Butcher Table', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('butchertable1', 'Small Butcher Table', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('nativedecor', 'Native Decor Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('gypsywagon', 'Gypsys Wagon Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('beerbox', 'Beer Box', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('waterbarrel', 'Water Barrel', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('tent2', 'Trader Tent', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('tent3', 'Simple Tent', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('tent4', 'Canvas Shade', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('dreamcatcher', 'Dream Catcher', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('nativepot', 'Native Pot', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('nativebasket1', 'Native Basket 1', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('nativebasket2', 'Native Basket 2', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('nativeskull', 'Native Decor 1', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('tipi', 'Native Tipi', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('skullpost', 'Skull Post', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('loungechair', 'Lounge Chair', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('loungechair2', 'Lounge Chair 2', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('decortent1', 'Decor Tent 1 Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('decortent2', 'Decor Tent 2 Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('decortent3', 'Decor Tent 3 Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('horsehitches', 'Horse Hitches Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('robberyplanning', 'Robbery Planning Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('naturalwagon', 'Naturalists Wagon Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('lamppost1', 'Lamp Post 1 Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('lamppost2', 'Lamp Post 2 Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('mountainmen', 'Mountain Camp Set', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('undertaker1', 'Coffin', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('undertaker2', 'Flower Coffin', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('kitchencounter', 'Kitchen Counter', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('standingtorch', 'Stading Torch', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('shootingtarget', 'Shooting Target', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('trayoffood', 'Serving Table', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('hemp_seed', 'Hemp Seed', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('hemp', 'Hemp', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('antipoison2', 'Anti Snake Poison', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('tent', 'Bounty Hunter Tent', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('wood_chair', 'Wood Chair', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('leather_chair', 'Leather Chair', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('round_table', 'Round Table', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('standard_table', 'Table', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('rectangle_table', 'Rectangle Table', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('timber_table', 'Timber Table', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('crafting_fire', 'Crafting Fire', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('pota', 'House Pot', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('water_pump', 'Water Pump', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('flowerboxes', 'Flower Boxes', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('coffindecor', 'Coffin Decor', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('deer_pelt', 'Deer Pelt', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('coyote_pelt', 'Coyote Pelt', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('blanket_box', 'Blanket Box', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('gun_barrel', 'Gun Barrel', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('apple_barrel', 'Apple Barrel', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('apple_basket', 'Apple Basket', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('food_barrel', 'Food Barrel', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('washtub', 'Wash Tub', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('clothes_line', 'Clothes Line', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('tool_barrel', 'Tool Barrel', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('coyote_taxidermy', 'Coyote Taxidermy', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('pheasant_taxidermy', 'Pheasant Taxidermy', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('deer_taxidermy', 'Deer Taxidermy', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('cougar_taxidermy', 'Cougar Taxidermy', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('vulture_taxidermy', 'Vulture Taxidermy', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('bear_bench', 'Bear Bench', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('log_bencha', 'Log Bench 1', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('log_benchb', 'Log Bench 2', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('cloth_bench', 'Cloth Bench', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('wooden_bench', 'Wooden Bench', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('wicker_bench', 'Wicker Bench', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('bwdresser', 'brown wood dresser', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('bmdresser', 'brown mirror dresser', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('nightstand', 'night stand', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('side_table', 'side table 1', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('side_tablea', 'side table 2', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('side_tableb', 'side table 3', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('chesta', 'chest 1', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('chestb', 'chest 2', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('lanterna', 'Lantern', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('dbcandle', 'Dbl Candle', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('candlea', 'Candle', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('smallmcandle', 'Small Melted Candle', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('bcandle', 'Bottle Candle', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('obed', 'Old bed', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('bunkbed', 'bunk bed', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('singlebed', 'single bed', 20, 1, 'item_standard', 1);
INSERT IGNORE INTO `items`(`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES ('fancydouble', 'fancy double', 20, 1, 'item_standard', 1);

INSERT IGNORE INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES 
("tipi", "Tipi", 20, 1, 'item_standard', 1),
("tent", "Bounty Hunter Tent", 20, 1, 'item_standard', 1),
("beerbox", "Beer Box", 20, 1, 'item_standard', 1),
("hitchingpost", "Hitching Post", 20, 1, 'item_standard', 1),
("chestc", "Chest C", 20, 1, 'item_standard', 1),
("trayoffood", "Serving Table", 20, 1, 'item_standard', 1),
("shootingtarget", "Shooting Target", 20, 1, 'item_standard', 1),
("kitchencounter", "Kitchen Counter", 20, 1, 'item_standard', 1),
("undertaker2", "Flower Coffin", 20, 1, 'item_standard', 1),
("undertaker1", "Coffin", 20, 1, 'item_standard', 1),
("loungechair2", "Lounge Chair 2", 20, 1, 'item_standard', 1),
("loungechair", "Lounge Chair", 20, 1, 'item_standard', 1),
("skullpost", "Skull Post", 20, 1, 'item_standard', 1),
("nativeskull", "Native Decor 1", 20, 1, 'item_standard', 1),
("nativebasket2", "Native Basket 2", 20, 1, 'item_standard', 1),
("nativebasket1", "Native Basket 1", 20, 1, 'item_standard', 1),
("nativepot", "Native Pot", 20, 1, 'item_standard', 1),
("dreamcatcher", "Dream Catcher", 20, 1, 'item_standard', 1),
("tent4", "Canvas Shade", 20, 1, 'item_standard', 1),
("tent3", "Simple Tent", 20, 1, 'item_standard', 1),
("tent2", "Trader Tent", 20, 1, 'item_standard', 1),
("xmastree", "Xmas Tree", 20, 1, 'item_standard', 1),
("xmaspole", "Xmas Pole", 20, 1, 'item_standard', 1),
("nativebed", "Native Bed", 20, 1, 'item_standard', 1),
("nativemask", "Native Mask", 20, 1, 'item_standard', 1),
("nativearms", "Native Arms", 20, 1, 'item_standard', 1),
("cage", "Cage", 20, 1, 'item_standard', 1),
("bookcase", "Bookcase", 20, 1, 'item_standard', 1),
("changer", "Coat Rack", 20, 1, 'item_standard', 1),
("nativeskullchair", "Dead Mans Chair", 20, 1, 'item_standard', 1),
("nativechair", "Native Chair", 20, 1, 'item_standard', 1),
("nativewickchair", "Native Wicker Chair", 20, 1, 'item_standard', 1),
("nativebench", "Native Bench", 20, 1, 'item_standard', 1),
("simplenativetent", "Simple Native Tent", 20, 1, 'item_standard', 1),
("nativeelkcanvas", "Native Elk Canvas", 20, 1, 'item_standard', 1),
("deernativetent", "Deer Pelt Native Tent", 20, 1, 'item_standard', 1),
("wolfnativetent", "Wolf Pelt Native Tent", 20, 1, 'item_standard', 1),
("nativeplatform", "Native Platform", 20, 1, 'item_standard', 1),
("nativesmoker", "Native Cooking Structure", 20, 1, 'item_standard', 1),
("nativebloodrock", "Native Rock Structure", 20, 1, 'item_standard', 1),
("nativecage", "Native Wooden Cage", 20, 1, 'item_standard', 1),
("nativebowdisplay", "Bow Display", 20, 1, 'item_standard', 1),
("nativecookpot", "Native Cooking Pot", 20, 1, 'item_standard', 1),
("nativearrowdisplay", "Arrow Display", 20, 1, 'item_standard', 1),
("nativebuckskull", "Native Buck Skull", 20, 1, 'item_standard', 1),
("nativeleatherstand", "Native Leather Stand", 20, 1, 'item_standard', 1);
