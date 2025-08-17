
------------------------
-- types of functionallity: 
--none = nothing
-- changing = changing room 
-- inv = inventory   -- player can only have 1 active inv furniture 
-- stew = stewpot  -- stew pot will only give food and water etc if you use fred metabolsim
-- stable = stable  -- stable functionallity props will only work if you own syn_stables ! change functionallity to none if you done
-- hunting = hunting station 
-- waterbarrel = a barrel to clean yourself
--beerbox = a box of beed for you and your friends 
-- IMPORTANT: ALL PROPS WITH THE (CATA = SET) OTHERWISE KNOWN AS PROP SETS CANNOT BE USED AS FUNCTIONAL FURNI AND SHOULD BE MARKED
-- FUNCTIONAL = "NONE"

Config.clanfurni = { 
    ["xmaspole"] = { 
        hash = `mp006_s_racexmasflag01x`,
        label = "Xmas Pole",
        cata = "prop",
        functional = "none",
    },
    ["changer"] = { 
        hash = `p_doc_coatstandrack01x`,
        label = "Coat Rack",
        cata = "prop",
        functional = "changing",
    },
    ["bookcase"] = { 
        hash = `p_cabinetdoctor01x`,
        label = "Bookcase",
        cata = "prop",
        functional = "none",
    },
    ["nativebed"] = { 
        hash = `p_bedindian01x`,
        label = "Native Bed",
        cata = "prop",
        functional = "none",
    },
    ["nativemask"] = { 
        hash = `mp005_p_mp_predhunt_skull08x`,
        label = "Native Mask",
        cata = "prop",
        functional = "none",
    },
    ["nativearms"] = { 
        hash = `p_spookynative05x`,
        label = "Native Arms",
        cata = "prop",
        functional = "none",
    },
    ["cage"] = { 
        hash = `mp005_p_wildanimalcage01`,
        label = "Cage",
        cata = "prop",
        functional = "none",
    },
    ["xmastree"] = { 
        hash = `mp006_p_xmastree01x`,
        label = "Xmas Tree",
        cata = "prop",
        functional = "none",
    },
    ["tipi"] = { 
        hash = `s_wap_rainsfalls`,
        label = "Native Tipi",
        cata = "prop",
        functional = "changing",
    },
    ["tent2"] = { 
        hash = `mp005_s_posse_tent_trader07x`,
        label = "Trader Tent",
        cata = "prop",
        functional = "changing",
    },
    ["tent3"] = { 
        hash = `mp005_s_posse_tent_bountyhunter04x`,
        label = "Simple Tent",
        cata = "prop",
        functional = "changing",
    },
    ["tent4"] = { 
        hash = `p_mptenttanner01x`,
        label = "Canvas Shade",
        cata = "prop",
        functional = "none",
    },
    ["dreamcatcher"] = { 
        hash = `p_indiandream01x`,
        label = "Dream Catcher",
        cata = "prop",
        functional = "none",
    },
    ["woodfence"] = { 
        hash = `p_fence02ax`,
        label = "Wooden Fence",
        cata = "prop",
        functional = "none",
    },
    ["nativepot"] = { 
        hash = `p_potteryindian02x`,
        label = "Native Pot",
        cata = "prop",
        functional = "none",
    },
    ["nativebasket1"] = { 
        hash = `p_basketindian02x`,
        label = "Native Basket 1",
        cata = "prop",
        functional = "none",
    },
    ["nativebasket2"] = { 
        hash = `p_basketindian03x`,
        label = "Native Basket 2",
        cata = "prop",
        functional = "none",
    },
    ["nativeskull"] = { 
        hash = `p_spookynative02x`,
        label = "Native Decor 1",
        cata = "prop",
        functional = "none",
    },
    ["skullpost"] = { 
        hash = `p_skullpost02x`,
        label = "Skull Post",
        cata = "prop",
        functional = "none",
    },
    ["loungechair"] = { 
        hash = `p_settee01x`,
        label = "Lounge Chair",
        cata = "prop",
        functional = "none",
    },
    ["loungechair2"] = { 
        hash = `p_settee_05x`,
        label = "Lounge Chair 2",
        cata = "prop",
        functional = "none",
    },
    ["pokerset"] = { 
        hash = `pg_mg_poker`,
        label = "Poker Table Set",
        cata = "set", 
        functional = "none", 
    },

    ["decortent1"] = { 
        hash = `pg_mp_possecamp_tent_bounty07x`,
        label = "Decor Tent 1 Set",
        cata = "set", 
        functional = "none", 
    },
    ["decortent2"] = { 
        hash = `pg_mp_possecamp_tent_trader07x`,
        label = "Decor Tent 2 Set",
        cata = "set", 
        functional = "none", 
    },
    ["decortent3"] = { 
        hash = `pg_mp_possecamp_tent_collector07x`,
        label = "Decor Tent 3 Set",
        cata = "set", 
        functional = "none", 
    },
    ["horsehitches"] = { 
        hash = `PG_COMPANIONACTIVITY_RUSTLING`,
        label = "Horse Hitches Set",
        cata = "set", 
        functional = "none", 
    },
    ["robberyplanning"] = { 
        hash = `PG_COMPANIONACTIVITY_ROBBERY`,
        label = "Robbery Planning Set",
        cata = "set", 
        functional = "none", 
    },
    ["naturalwagon"] = { 
        hash = `pg_mp007_naturalist_camp01x`,
        label = "Naturalists Wagon Set",
        cata = "set", 
        functional = "none", 
    },
    ["lamppost1"] = { 
        hash = `pg_ambient_camp_add_gamepole01`,
        label = "Lamp Post 1 Set",
        cata = "set", 
        functional = "none", 
    },
    ["lamppost2"] = { 
        hash = `pg_ambient_camp_add_lamppost01`,
        label = "Lamp Post 2 Set",
        cata = "set", 
        functional = "none", 
    },
    ["mountainmen"] = { 
        hash = `pg_re_mountainmen01x`,
        label = "Mountain Camp Set",
        cata = "set", 
        functional = "none", 
    },

    ["undertaker1"] = { 
        hash = `s_loansharkundertaker01x`,
        label = "Coffin",
        cata = "prop",
        functional = "none",
    },
    ["undertaker2"] = { 
        hash = `mp004_s_mp_coffindecor01x`,
        label = "Flower Coffin",
        cata = "prop",
        functional = "none",
    },
    ["kitchencounter"] = { 
        hash = `p_kitchenhutch01x`,
        label = "Kitchen Counter",
        cata = "prop",
        functional = "none",
    },
    ["standingtorch"] = { 
        hash = `p_torchpostalwayson01x`,
        label = "Stading Torch",
        cata = "prop",
        functional = "none",
    },
    ["shootingtarget"] = { 
        hash = `s_confedtarget`,
        label = "Shooting Target",
        cata = "prop",
        functional = "none",
    },
    ["trayoffood"] = { 
        hash = `p_group_man01x_longtable`,
        label = "Serving Table",
        cata = "prop",
        functional = "beerbox",
    },
    ["chesta"] = {
        hash = `s_lootablebedchest`,
        label = "Chest A",
        cata = "prop",
        functional = "inv",
        slots = 1000, -- this section only exists for furniture marked with "inv" 
    },

    ["chestb"] = {
        hash = `s_lootablemiscchest_wagon`,
        label = "Chest B",
        cata = "prop",
        functional = "inv",
        slots = 500, 
    },

    ["chestc"] = {
        hash = `s_lootablebigbluechest03x`,
        label = "Chest C",
        cata = "prop",
        functional = "inv",
        slots = 1500,  
    },
    ["pokerset"] = { 
        hash = `pg_mg_poker`,
        label = "Poker Table Set",
        cata = "set", -- these are prop sets not normal props when they are being placed u wont the visual representation of the set, it will only show a tent to help approximate the prop set location when placed
        functional = "none", -- SETS MUST BE MARKED AT FUNCTIONAL NONE
    },
    ["hitchingpost"] = { 
        hash = `p_hitchingpost01x`,
        label = "Hitching Post",
        cata = "prop",
        functional = "stable", 
    },
    ["butchertable3"] = { 
        hash = `mp005_s_posse_goods03x`,
        label = "Large Butcher Table",
        cata = "prop",
        functional = "hunting", 
        maxstock = 100, -- this section only exists for props marked as "hunting"
    },
    ["butchertable2"] = { 
        hash = `mp005_s_posse_goods02bx`,
        label = "Medium Butcher Table",
        cata = "prop",
        functional = "hunting", 
        maxstock = 50, 
    },
    ["butchertable1"] = { 
        hash = `mp005_s_posse_goods01x`,
        label = "Small Butcher Table",
        cata = "prop",
        functional = "hunting", 
        maxstock = 25, 
    },
    ["nativedecor"] = { 
        hash = `pg_ambient_camp_add_native01`,
        label = "Native Decor Set",
        cata = "set", 
        functional = "none", 
    },
    ["gypsywagon"] = { 
        hash = `PG_MP005_COLLECTORWAGONCAMP01`,
        label = "Gypsys Wagon Set",
        cata = "set", 
        functional = "none", 
    },
    ["beerbox"] = { 
        hash = `P_bottlecrate02X`,
        label = "Beer Box",
        cata = "prop", 
        functional = "beerbox", 
    },
    ["waterbarrel"] = { 
        hash = -1315817616,
        label = "Water Barrel",
        cata = "prop", 
        functional = "waterbarrel", 
    },
    ["tent"] = { -- this is the item name on db
    hash = `mp005_s_posse_tent_bountyhunter07x`,
    label = "Bounty Hunter Tent",
    cata = "prop",
    functional = "changing",
    },
    ----------------------------------
    
    ----------------------------------
   
    ["wood_chair"] = { 
        hash = 325252933,
        label = "Wood Chair",
        cata = "prop", 
        functional = "none", 
    },
    ["leather_chair"] = { 
        hash = 805425957,
        label = "Leather Chair",
        cata = "prop", 
        functional = "none", 
    },
    ["round_table"] = { 
        hash = 1070917324,
        label = "Round Table",
        cata = "prop", 
        functional = "none", 
    },
    ["standard_table"] = { 
        hash = 85453683,
        label = "Table",
        cata = "prop", 
        functional = "none", 
    },
    ["rectangle_table"] = { 
        hash = 1287780262,
        label = "Rectangle Table",
        cata = "prop", 
        functional = "none", 
    },
    ["rectangle_table"] = { 
        hash = 1287780262,
        label = "Rectangle Table",
        cata = "prop", 
        functional = "none", 
    },
    ["timber_table"] = { 
        hash = 1287780262,
        label = "Timber Table",
        cata = "prop", 
        functional = "none", 
    },
    ["crafting_fire"] = { 
        hash = -1279776992,
        label = "Crafting Fire",
        cata = "prop", 
        functional = "none", 
    },
    ["pota"] = { 
        hash = `p_campfirecombined03x`,
        label = "Stew Pot",
        cata = "prop",
        functional = "stew", 
    },
    ["water_pump"] = { 
        hash = -40350080,
        label = "Water Pump",
        cata = "prop", 
        functional = "none", 
    },
    ["flowerboxes"] = { 
        hash = 456717314,
        label = "Flower Boxes",
        cata = "prop", 
        functional = "none", 
    },
    ["deer_pelt"] = { 
        hash = -944201792,
        label = "Deer Pelt",
        cata = "prop", 
        functional = "none", 
    },
    ["coyote_pelt"] = { 
        hash = -1156281048,
        label = "Coyote Pelt",
        cata = "prop", 
        functional = "none", 
    },
    ["blanket_box"] = { 
        hash = -542120195,
        label = "Blanket Box",
        cata = "prop", 
        functional = "none", 
    },
    ["gun_barrel"] = { 
        hash = 187048082,
        label = "Gun Barrel",
        cata = "prop", 
        functional = "none", 
    },
    ["apple_barrel"] = { 
        hash = -156060815,
        label = "Apple Barrel",
        cata = "prop", 
        functional = "none", 
    },
    ["apple_basket"] = { 
        hash = 86968515,
        label = "Apple Basket",
        cata = "prop", 
        functional = "none", 
    },
    ["food_barrel"] = { 
        hash = -589926798,
        label = "Food Barrel",
        cata = "prop", 
        functional = "none", 
    },
    ["washtub"] = { 
        hash = 768802576,
        label = "Wash Tub",
        cata = "prop", 
        functional = "none", 
    },
    ["clothes_line"] = { 
        hash = -25978087,
        label = "Clothes Line",
        cata = "prop", 
        functional = "none", 
    },
    ["tool_barrel"] = { 
        hash = -462883214,
        label = "Tool Barrel",
        cata = "prop", 
        functional = "none", 
    },
    ["coyote_taxidermy"] = { 
        hash = 755719297,
        label = "Coyote Taxidermy",
        cata = "prop", 
        functional = "none", 
    },
    ["pheasant_taxidermy"] = { 
        hash = -139659644,
        label = "Pheasant Taxidermy",
        cata = "prop", 
        functional = "none", 
    },
    ["deer_taxidermy"] = { 
        hash = 270188936,
        label = "Deer Taxidermy",
        cata = "prop", 
        functional = "none", 
    },
    ["cougar_taxidermy"] = { 
        hash = 106531847,
        label = "Cougar Taxidermy",
        cata = "prop", 
        functional = "none", 
    },
    ["vulture_taxidermy"] = { 
        hash = 1751914218,
        label = "Vulture Taxidermy",
        cata = "prop", 
        functional = "none", 
    },
    ["bear_bench"] = { 
        hash = -191845882,
        label = "Bear Bench",
        cata = "prop", 
        functional = "none", 
    },
    ["log_bencha"] = { 
        hash = -359794697,
        label = "Log Bench 1",
        cata = "prop", 
        functional = "none", 
    },
    ["log_benchb"] = { 
        hash = 861210780,
        label = "Log Bench 2",
        cata = "prop", 
        functional = "none", 
    },
    ["cloth_bench"] = { 
        hash = 964931263,
        label = "Cloth Bench",
        cata = "prop", 
        functional = "none", 
    },
    ["wooden_bench"] = { 
        hash = 1057555344,
        label = "Wooden Bench",
        cata = "prop", 
        functional = "none", 
    },
    ["wicker_bench"] = { 
        hash = 1220939063,
        label = "Wicker Bench",
        cata = "prop", 
        functional = "none", 
    },
    ["bwdresser"] = { 
        hash = 614869605,
        label = "brown wood",
        cata = "prop", 
        functional = "none", 
    },
    ["bmdresser"] = { 
        hash = -565436466,
        label = "brown mirror",
        cata = "prop", 
        functional = "none", 
    },
    ["nightstand"] = { 
        hash = -154796631,
        label = "night stand",
        cata = "prop", 
        functional = "none", 
    },
    ["side_table"] = { 
        hash = 335118833,
        label = "side table 1",
        cata = "prop", 
        functional = "none", 
    },
    ["side_tablea"] = { 
        hash = -96741014,
        label = "side table 2",
        cata = "prop", 
        functional = "none", 
    },
    ["side_tableb"] = { 
        hash = 341544623,
        label = "side table 3",
        cata = "prop", 
        functional = "none", 
    },
    ["lanterna"] = { 
        hash = 319326044,
        label = "Lantern",
        cata = "prop", 
        functional = "none", 
    },
    ["dbcandle"] = { 
        hash = 1443543434,
        label = "Dbl Candle",
        cata = "prop", 
        functional = "none", 
    },
    ["candlea"] = { 
        hash = 526843578,
        label = "Candle",
        cata = "prop", 
        functional = "none", 
    },
    ["smallmcandle"] = { 
        hash = -1200234060,
        label = "Small Melted Candle",
        cata = "prop", 
        functional = "none", 
    },
    ["bcandle"] = { 
        hash = -1012195445,
        label = "Bottle Candle",
        cata = "prop", 
        functional = "none", 
    },
    ["obed"] = { 
        hash = -335869017,
        label = "Old bed",
        cata = "prop", 
        functional = "none", 
    },
    ["bunkbed"] = { 
        hash = -661790979,
        label = "bunk bed",
        cata = "prop", 
        functional = "none", 
    },
    ["singlebed"] = { 
        hash = 1190865994,
        label = "single bed",
        cata = "prop", 
        functional = "none", 
    },
    ["fancydouble"] = { 
        hash = 204817984,
        label = "fancy bed",
        cata = "prop", 
        functional = "none", 
    },

 --NEW NATIVE FURNITURE
 ["nativeskullchair"] = { 
    hash = `p_chairrusticsav01x`,
    label = "Dead Mans Chair",
    cata = "prop",
    functional = "none",
},
["nativechair"] = { 
    hash = `p_ambchair01x`,
    label = "Native Chair",
    cata = "prop",
    functional = "none",
},
["nativewickchair"] = { 
    hash = `p_chairrustic03x`,
    label = "Native Wicker Chair",
    cata = "prop",
    functional = "none",
},
["nativebench"] = { 
    hash = `s_bench01x`,
    label = "Native Bench",
    cata = "prop",
    functional = "none",
},
["simplenativetent"] = { 
    hash = `p_ambtentleather01x`,
    label = "Simple Native Tent",
    cata = "prop",
    functional = "none",
},
["nativeelkcanvas"] = { 
    hash = `s_awningsur`,
    label = "Native Elk Canvas",
    cata = "prop",
    functional = "none",
},
["deernativetent"] = { 
    hash = `p_ambtentoilskin01x`,
    label = "Deer Pelt Native Tent",
    cata = "prop",
    functional = "none",
},
["wolfnativetent"] = { 
    hash = `p_ambtentleather01b`,
    label = "Wolf Pelt Native Tent",
    cata = "prop",
    functional = "none",
},
["nativeplatform"] = { 
    hash = `mp005_s_posse_bnty_decorlrg01x`,
    label = "Native Platform",
    cata = "prop",
    functional = "none",
},
["nativesmoker"] = { 
    hash = `p_cookfirestructure02x`,
    label = "Native Cooking Structure",
    cata = "prop",
    functional = "none",
},
["nativebloodrock"] = { 
    hash = `mp004_p_rockpilegoal01x`,
    label = "Native Rock Structure",
    cata = "prop",
    functional = "none",
},
["nativecage"] = { 
    hash = `p_prisoncage02x`,
    label = "Native Wooden Cage",
    cata = "prop",
    functional = "none",
},
["nativebowdisplay"] = { 
    hash = `p_bowdisplay01x`,
    label = "Bow Display",
    cata = "prop",
    functional = "none",
},
["nativecookpot"] = { 
    hash = `s_sav_cookfire01x`,
    label = "Native Cooking Pot",
    cata = "prop",
    functional = "none",
},
["nativearrowdisplay"] = { 
    hash = `p_arrowdisplay02x`,
    label = "Arrow Display",
    cata = "prop",
    functional = "none",
},
["nativebuckskull"] = { 
    hash = `s_buckskull01x`,
    label = "Native Buck Skull",
    cata = "prop",
    functional = "none",
},
["nativeleatherstand"] = { 
    hash = `s_rugstand01x`,
    label = "Native Leather Stand",
    cata = "prop",
    functional = "none",
},


}

