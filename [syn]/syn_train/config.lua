Config = {}

Config.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["ENTER"] = 0xC7B5340A,
    ["B"] = 0x4CC0E2FE,
    ["CTRL"] = 0xDB096B85,
    ["UP"] = 0x6319DB71,
    ["LEFTBRACKET"] = 0x430593AA,
    ["G"] = 0x760A9C6F,
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
    ["5"] = 0xAB62E997,
    ["SHIFT"] = 0xFF3626FC,
    ["CTRL2"] = 0x2D79D80A, 
    ["DOWN"] = 0x05CA7C52,
    ["UP"] = 0x6319DB71,
    ["LEFT"] = 0xA65EBAB4,
    ["RIGHT"] = 0xDEB34313,
    ["U"] = 0xD8F73058,
    ["I"] = 0xC1989F95,
    ["X"] = 0x8CC9CD42,
    ["R"] = 0xE30CD707,
    ["J"] = 0xF3830D8E,
    ["O"] = 0xF1301666,
    ["W"] = 0x8FD015D8,
    ["D"] = 0xB4E465B4,
    ["A"] = 0x7065027D,
}
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
Config.synsociety = true -- switch to false if you dont have syn society ! this is important 
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
Config.debug = false 
Config.cruisecontrol = true -- allow/disallow cruise control 

--New Item Blacklist for storage items in this list will not beable to be stored in the storage
Config.blacklisteditems = {
    "lockpick",
    "trainkey",
}
Config.metadata = true -- set to true when using meta data inventory update 
Config.useDecayitems = true -- set to true if you want items to decay over time

Config.keyprice = 100
Config.trainkeyitem = "trainkey"
Config.lockpickitem = "lockpick"
Config.coalitem = "coal"
Config.Companylocations = { 
	Valentine = {	   
        Pos = {x=-176.2, y=628.27, z=114.09}, -- location of Menu
        blipsprite = 1258184551, -- blip sprite 
		Name = 'Valentine Train Station', -- blip name
        jobname = "valtrain",
        circuit = "newhanover", -- this isnt language, dont change if you dont know what it does.
    },
    SD = {	   
        Pos = {x=2878.69, y=-1269.7, z=46.15}, -- location of Menu
        blipsprite = 1258184551, -- blip sprite 
		Name = 'SD Train Station', -- blip name
        jobname = "valtrain",
        circuit = "newhanover", -- this isnt language, dont change if you dont know what it does.
    },
    riggs = {	   
        Pos = {x=-1095.6, y=-576.6, z=82.45}, -- location of Menu
        blipsprite = 1258184551, -- blip sprite 
		Name = 'Riggs Train Station', -- blip name
        jobname = "valtrain",
        circuit = "newhanover", -- this isnt language, dont change if you dont know what it does.
    },
    rhodes = {	   
        Pos = {x=1229.50, y=-1298.20, z=76.95}, -- location of Menu
        blipsprite = 1258184551, -- blip sprite 
		Name = 'Rhodes Train Station', -- blip name
        jobname = "valtrain",
        circuit = "newhanover", -- this isnt language, dont change if you dont know what it does.
    },
    Emerald = {	   
        Pos = {x=1523.527, y=442.676, z=90.728}, -- location of Menu
        blipsprite = 1258184551, -- blip sprite 
		Name = 'Emerald Train Station', -- blip name
        jobname = "valtrain",
        circuit = "newhanover", -- this isnt language, dont change if you dont know what it does.
    },
    Annesburg  = {	   
        Pos = {x=2938.0, y=1286.0, z=44.00}, -- location of Menu
        blipsprite = 1258184551, -- blip sprite 
		Name = 'Annesburg Train Station', -- blip name
        jobname = "valtrain",
        circuit = "newhanover", -- this isnt language, dont change if you dont know what it does.
    },

    Armadillo = {	   
        Pos = {x=-3729.02, y=-2601.26, z=-12.93}, -- location of Menu
        blipsprite = 1258184551, -- blip sprite 
		Name = 'Armadillo Train Station', -- blip name
        jobname = "valtrain",
        circuit = "newaustin", -- this isnt language, dont change if you dont know what it does.
    },
    Armadillo2 = {	   
        Pos = {x=-2494.85, y=-2437.45, z=60.7}, -- location of Menu
        blipsprite = 1258184551, -- blip sprite 
		Name = 'Armadillo Train Station', -- blip name
        jobname = "valtrain",
        circuit = "newaustin", -- this isnt language, dont change if you dont know what it does.
    },
    Armadillo3 = {	   
        Pos = {x=-5230.2, y=-3468.1, z=-20.35}, -- location of Menu
        blipsprite = 1258184551, -- blip sprite 
		Name = 'Armadillo Train Station', -- blip name
        jobname = "valtrain",
        circuit = "newaustin", -- this isnt language, dont change if you dont know what it does.
    },
}
Config.deletevehiclecommand = "dv" -- command to delete train/vehicle. 

Config.maintrate = 0.5 -- degredation rate, the higher the quicker the train maint will go down
Config.maintjob = {'valtrain','trainengineer','armatrain'} -- jobs that can fix trains
Config.maintmaterial = true -- if true materials are required to fix trains
Config.maintmaterials = { -- first number is the maintenance level, the cloest number of the train current main to the numbers below will determine which material set will be used
    ['90'] = {['ironbar'] = 5, ['ironhammer'] = 1},
    ['50'] = {['ironbar'] = 10, ['ironhammer'] = 1},
    ['0'] = {['ironbar'] = 10, ['ironhammer'] = 1},
}
Config.minmaintshow = 20 -- minimum number train maint is at to be shown to drivers who are not in the maintjob table.
-- set to 100 or 90 to always show maint to all players regardless of job.


Config.upgjob = {'valtrain','trainengineer','armatrain'} -- jobs that can upgrade trains.
Config.speedupgrades = {
    {amount = 5 , materials = {['ironbar'] = {count = 10, label = "iron bar"}, ['copper'] = {count = 20, label = "copper"}}}, -- amount is the amount of speed increase each upgrade. caps at 30. after the train top speed reaches 30 no upgrade options will be available.
    {amount = 5 , materials = {['ironbar'] = {count = 10, label = "iron bar"}, ['copper'] = {count = 20, label = "copper"}}},
    {amount = 5 , materials = {['ironbar'] = {count = 10, label = "iron bar"}, ['copper'] = {count = 20, label = "copper"}}},
    {amount = 5 , materials = {['ironbar'] = {count = 10, label = "iron bar"}, ['copper'] = {count = 20, label = "copper"}}},
    {amount = 5 , materials = {['ironbar'] = {count = 10, label = "iron bar"}, ['copper'] = {count = 20, label = "copper"}}},
}
Config.engineupgrades = { -- recommended to cap engine upgrades of trains to nothing more than 20
    {amount = 5 , materials = {['ironbar'] = {count = 10, label = "iron bar"}, ['copper'] = {count = 20, label = "copper"}}}, -- amount is the amount of time in seconds it takes to consume maint,coal. maint is consumed slower than coal.
    {amount = 5 , materials = {['ironbar'] = {count = 10, label = "iron bar"}, ['copper'] = {count = 20, label = "copper"}}},
    {amount = 5 , materials = {['ironbar'] = {count = 10, label = "iron bar"}, ['copper'] = {count = 20, label = "copper"}}}, 
    {amount = 5 , materials = {['ironbar'] = {count = 10, label = "iron bar"}, ['copper'] = {count = 20, label = "copper"}}}, 
    {amount = 5 , materials = {['ironbar'] = {count = 10, label = "iron bar"}, ['copper'] = {count = 20, label = "copper"}}}, 
}

Config.missions = {
    ["newhanover"] = { -- name of circuit, must match the Companylocations config. you can use this to make custom missions for specific companies.
        {
            label = "New Hanover Mission 1", -- label of mission
            loc = {x = 484.6, y = 662.9, z= 117.4},
            items = {
                ['ironbar'] = {label = "Iron Bar", count = 25},
                ['copper_bar'] = {label = "Copper Bar", count = 25},
                ['wooden_boards'] = {label = "Wooden Boards", count = 50},
                ['firewood'] = {label = "Fire Wood", count = 50},
            },
            distcheck = 40, -- distance from objective to clear mission
            reward = 1600, -- 150 $ on delivery of items.
        },
        {
            label = "New Hanover Mission 2",
            loc = {x = 1525.96, y = 435.06, z= 90.68},
            items = {
                ['copper_bar'] = {label = "Copper Bar", count = 15},
                ['fertilizer'] = {label = "Fertilizer", count = 100},
                ['shovel'] = {label = "Shovel", count = 10},
                ['unique_horse_feed'] = {label = "Horse Vitamins", count = 40},
            },
            distcheck = 40, 
            reward = 3250, 
        },
        {
            label = "New Hanover Mission 3",
            loc = {x = 1525.96, y = 435.06, z= 90.68},
            items = {
                ['clay'] = {label = "Clay", count = 100},
                ['nails'] = {label = "Nails", count = 200},
                ['rock'] = {label = "Rock", count = 100},
            },
            distcheck = 40, 
            reward = 700, 
        },
        
        {
            label = "New Hanover Mission 4",
            loc = {x = 2749.2, y =-1445.58, z= 45.74},
            items = {
                ['goldbar'] = {label = "Gold Bar", count = 20},
                ['specialpelt'] = {label = "Special Pelt", count = 1},
                ['beerbox'] = {label = "Beer Box", count = 10},
                ['fertilizer'] = {label = "Fertilizer", count = 50},
                ['unique_horse_feed'] = {label = "Horse Vitamins", count = 20},
            },
            distcheck = 40, 
            reward = 5000, 
        },

    },
    ["newaustin"] = { -- name of circuit, must match the Companylocations config. you can use this to make custom missions for specific companies.
        {
            label = "New Austin Mission 1", -- label of mission
            loc = {x = -2496.58, y = -2427.02, z= 60.59},
            items = {
                ['ironbar'] = {label = "Iron Bar", count = 25},
                ['copper_bar'] = {label = "Copper Bar", count = 25},
                ['wooden_boards'] = {label = "Wooden Boards", count = 50},
                ['firewood'] = {label = "Fire Wood", count = 50},
            },
            distcheck = 40, -- distance from objective to clear mission
            reward = 1600, -- 150 $ on delivery of items.
        },
        {
            label = "New Austin Mission 2",
            loc = {x = -4353.56, y = -3093.79, z= -9.52},
            items = {
                ['copper_bar'] = {label = "Copper Bar", count = 15},
                ['fertilizer'] = {label = "Fertilizer", count = 100},
                ['shovel'] = {label = "Shovel", count = 10},
                ['unique_horse_feed'] = {label = "Horse Vitamins", count = 40},
            },
            distcheck = 40, 
            reward = 3250, 
        },
        {
            label = "New Austin Mission 3",
            loc = {x = -5232.13, y = -3476.58, z= -20.54},
            items = {
                ['clay'] = {label = "Clay", count = 100},
                ['nails'] = {label = "Nails", count = 200},
                ['rock'] = {label = "Rock", count = 100},
            },
            distcheck = 40, 
            reward = 700, 
        },
        {
            label = "New Austin Mission 4",
            loc = {x = -4353.56, y = -3093.79, z= -9.52},
            items = {
                ['goldbar'] = {label = "Gold Bar", count = 20},
                ['specialpelt'] = {label = "Special Pelt", count = 1},
                ['beerbox'] = {label = "Beer Box", count = 10},
                ['fertilizer'] = {label = "Fertilizer", count = 50},
                ['unique_horse_feed'] = {label = "Horse Vitamins", count = 20},
            },
            distcheck = 40, 
            reward = 5000, 
        },

    },
   
}


-- max top speed is 30
-- dont use spaces in images name and make sure they match your image files at html/img
Config.trains = {
    -- { name = "Ghost Train",img = "gt", hash = 241358608, topspeed = 30, price = 100, coalconsumption = 10, coalcap = 1000},
    { name = "Hand Cart",img = "Train17", hash = 0x3EDA466D, topspeed = 5, price = 250, coalconsumption = 0, coalcap = 1000}, 
    { name = "Train 1",img = "Train1", hash = -1464742217, topspeed = 20, price = 2000, coalconsumption = 10, coalcap = 1000}, 
    { name = "Train 2",img = "Train2", hash = -577630801, topspeed = 15, price = 1250, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 3",img = "Train3", hash = -1901305252, topspeed = 10, price = 900, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 4",img = "Train4", hash = -1719006020, topspeed = 8, price = 500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 5",img = "Train5", hash = 519580241, topspeed = 12, price = 1000, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 6",img = "Train6", hash = 1495948496, topspeed = 14, price = 1000, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 7",img = "Train7", hash = 1365127661, topspeed = 25, price = 3500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 8",img = "Train8", hash = 1030903581, topspeed = 10, price = 1000, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 9",img = "Train9", hash = -2006657222, topspeed = 8, price = 500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 10",img = "Train10", hash = 1285344034, topspeed = 9, price = 750, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 11",img = "Train11", hash = -156591884, topspeed = 24, price = 3000, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 12",img = "Train12", hash = 987516329, topspeed = 21, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 13",img = "Train13", hash = -1740474560, topspeed = 30, price = 5000, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 14",img = "Train14", hash = -651487570, topspeed = 27, price = 4000, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 15",img = "Train15", hash = -593637311, topspeed = 19, price = 1000, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 16",img = "Train16", hash = 1094934838, topspeed = 8, price = 500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 17",img = "Train17", hash = 1216031719, topspeed = 8, price = 500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 18",img = "Train17", hash = 0xF9B038FC, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 19",img = "Train17", hash = 0x3260CE89, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 20",img = "Train17", hash = 0x5AA369CA, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 21",img = "Train17", hash = 0x005E03AD, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 22",img = "Train17", hash = 0x0660E567, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 23",img = "Train17", hash = 0x0941ADB7, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 24",img = "Train17", hash = 0x0CCC2F70, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 25",img = "Train17", hash = 0x0D03C58D, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 26",img = "Train17", hash = 0x10461E19, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 27",img = "Train17", hash = 0x124A1F89, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 28",img = "Train17", hash = 0x19A0A288, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 29",img = "Train17", hash = 0x1C043595, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 30",img = "Train17", hash = 0x1C9936BB, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 31",img = "Train17", hash = 0x1EEC5C2A, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 32",img = "Train17", hash = 0x25E5D8FF, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 33",img = "Train17", hash = 0x2D1A6F0C, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 34",img = "Train17", hash = 0x2D3645FA, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 35",img = "Train17", hash = 0x31656D23, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 36",img = "Train17", hash = 0x35D17C43, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 37",img = "Train17", hash = 0x4A73E49C, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 38",img = "Train17", hash = 0x57C209C4, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 39",img = "Train17", hash = 0x5D9928A4, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 40",img = "Train17", hash = 0x68CF495F, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 41",img = "Train17", hash = 0x6CC26E27, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 42",img = "Train17", hash = 0x6D69A954, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 43",img = "Train17", hash = 0x761CE0AD, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 44",img = "Train17", hash = 0x7BD58C4D, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 45",img = "Train17", hash = 0x8D0766BC, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 46",img = "Train17", hash = 0x9296570E, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 47",img = "Train17", hash = 0x9897FF51, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 48",img = "Train17", hash = 0x998A0CBC, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 49",img = "Train17", hash = 0xAC18A9F4, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 50",img = "Train17", hash = 0xC1F1DD80, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 51",img = "Train17", hash = 0xC732CDC8, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 52",img = "Train17", hash = 0xCA19C62A, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 53",img = "Train17", hash = 0xCD2C7CA1, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 54",img = "Train17", hash = 0xD42DD3EE, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 55",img = "Train17", hash = 0xD233B18D, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 56",img = "Train17", hash = 0xD5DF2D82, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 57",img = "Train17", hash = 0xD93C36C2, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 58",img = "Train17", hash = 0xDA2EDE2F, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 59",img = "Train17", hash = 0xE0898B89, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 60",img = "Train17", hash = 0xE16CA3EF, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 61",img = "Train17", hash = 0xEB8B2439, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
    { name = "Train 62",img = "Train17", hash = 0xFD8810E8, topspeed = 10, price = 2500, coalconsumption = 15, coalcap = 1000}, 
 
 }
Config.junctionsdistance = 30 
Config.junctions = {
    {
        -- TRAINS3 -- track hash name
        pos = {x = 1692.86, y =544.329 , z = 97.7636},
        heading_min = 90,
        heading_max = 120,
        track = 1499637393,
        id = 1,
        left = 1,
        right = 0
    },
    {
        -- TRAINS3 -- track hash name
        pos = {x = 1481.54, y = 648.331 , z = 91.4573},
        heading_min = 225,
        heading_max = 235,
        track = 1499637393,
        id = 2,
        left = 0,
        right = 1
    },
    {
        -- TRAINS3 -- track hash name
        pos = {x = 613.963, y = 683.593 , z = 114.517},
        heading_min = 100,
        heading_max = 120,
        track = 1499637393,
        id = 3,
        left = 1,
        right = 0
    },
    {
        -- TRAINS3 -- track hash name
        pos = {x = 357.959, y = 596.374 , z = 115.6759},
        heading_min = 310,
        heading_max = 327,
        track = 1499637393,
        id = 4,
        left = 0,
        right = 1
    },
    {
        -- TRAINS3 -- track hash name
        pos = {x = 31.4046, y = -29.3296 , z = 102.485},
        heading_min = 150,
        heading_max = 160,
        track = 1499637393,
        id = 5,
        left = 1,
        right = 0
    },
    {
        -- TRAINS_NB1 -- track hash name
        pos = {x = 2748.47, y = -1434.33 , z = 45.0192},
        heading_min = 129,
        heading_max = 141,
        track = -1242669618,
        id = 1,
        left = 0,
        right = 1
    },
    {
        -- TRAINS_NB1 -- track hash name
        pos = {x = 2654.2, y = -1477.18 , z = 44.93155},
        heading_min = 269,
        heading_max = 279,
        track = -1242669618,
        id = 2,
        left = 1,
        right = 0
    },
    {
        -- TRAINS_NB1 -- track hash name
        pos = {x = 2624.16, y = -1477.2 , z = 45.1535},
        heading_min = 89,
        heading_max = 95,
        track = -1242669618,
        id = 3,
        left = 1,
        right = 0
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 69.6194, y = -375.174 , z = 90.0691},
        heading_min = 58,
        heading_max = 62,
        track = -705539859,
        id = 1,
        left = 0,
        right = 1
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = -281.055, y = -319.6095 , z = 88.1831},
        heading_min = 294,
        heading_max = 300,
        track = -705539859,
        id = 2,
        left = 1,
        right = 0
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = -1307.26, y = -291.26 , z = 100.096},
        heading_min = 5,
        heading_max = 15,
        track = -705539859,
        id = 4,
        left = 1,
        right = 0
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = -1375.64, y = -137.358 , z = 100.036},
        heading_min = 210,
        heading_max = 225,
        track = -705539859,
        id = 5,
        left = 0,
        right = 1
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 556.65, y = 1725.99 , z = 186.968},
        heading_min = 225,
        heading_max = 235,
        track = -705539859,
        id = 7,
        left = 0,
        right = 1
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 610.22, y = 1662.17 , z = 186.543},
        heading_min = 25,
        heading_max = 45,
        track = -705539859,
        id = 8,
        left = 1,
        right = 0
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 3032.64, y = 1482.22 , z = 48.7368},
        heading_min = 120,
        heading_max = 145,
        track = -705539859,
        id = 10,
        left = 0,
        right = 1
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 2873.65, y = 1199.61 , z = 44.2112},
        heading_min = 313,
        heading_max = 335,
        track = -705539859,
        id = 11,
        left = 1,
        right = 0
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 2659.79, y = -435.711 , z = 42.5659},
        heading_min = 0,
        heading_max = 10,
        track = -705539859,
        id = 13,
        left = 1,
        right = 0
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 2855.28, y = -1314.74 , z = 45.1157},
        heading_min = 128,
        heading_max = 141,
        track = -705539859,
        id = 15,
        left = 0,
        right = 1
    },
    -- These two are simply too close to work properly with this system
    -- A new system would have to be designed just for these two junctions
    --[[ {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 2842.43, y = -1330.06 , z = 45.1738},
        heading_min = 141,
        heading_max = 151,
        track = -705539859,
        id = 16,
        left = 0,
        right = 0
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 2765.4, y = -1421.54 , z = 45.10255},
        heading_min = 300,
        heading_max = 321,
        track = -705539859,
        id = 17,
        left = 0,
        right = 0
    }, ]]
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 2588.54, y = -1482.19 , z = 45.2241},
        heading_min = 265,
        heading_max = 275,
        track = -705539859,
        id = 18,
        left = 1,
        right = 0
    },
    {
        -- FREIGHT_GROUP -- track hash name
        pos = {x = 2520.46, y = -1482.19 , z = 45.1254},
        heading_min = 80,
        heading_max = 95,
        track = -705539859,
        id = 19,
        left = 0,
        right = 1
    },
    {
        -- TRAINS_OLD_WEST03 -- track hash name
        pos = {x = -4916.56, y = -3009.53 , z = -19.1817},
        heading_min = 200,
        heading_max = 215,
        track = -1467515357,
        id = 0,
        left = 1,
        right = 0
    },
    {
        -- TRAINS_OLD_WEST03 -- track hash name
        pos = {x = -4951.81, y = -3083.8 , z = -18.43235},
        heading_min = 270,
        heading_max = 290,
        track = -1467515357,
        id = 5,
        left = 1,
        right = 0
    },
    {
        -- BRAITHWAITES2_TRACK_CONFIG -- track hash name
        pos = {x = 1529.94, y = 467.529 , z = 89.3801},
        heading_min = 350,
        heading_max = 360,
        track = -760570040,
        id = 1,
        left = 1,
        right = 0
    },
    {
        -- BRAITHWAITES2_TRACK_CONFIG -- track hash name
        pos = {x = 2464.55, y = -1475.74 , z = 45.1397},
        heading_min = 245,
        heading_max = 270,
        track = -760570040,
        id = 5,
        left = 1,
        right = 0
    },
    {
        -- TRAINS_INTERSECTION1_ANN -- track hash name
        pos = {x = 2940.86, y = 1374.45 , z = 43.0859},
        heading_min = 155,
        heading_max = 165,
        track = -154412807,
        id = 1,
        left = 1,
        right = 0
    },
    {
        -- TRAINS_INTERSECTION1_ANN -- track hash name
        pos = {x = 2885.57, y = 1227.62 , z = 43.845},
        heading_min = 335,
        heading_max = 345,
        track = -154412807,
        id = 2,
        left = 0,
        right = 1
    },
    {
        -- TRAINS_OLD_WEST02 -- track hash name
        pos = {x = -2214.41, y = -2519.54 , z = 64.8763},
        heading_min = 245,
        heading_max = 255,
        track = -1763976500,
        id = 1,
        left = 1,
        right = 0
    },
    {
        -- TRAINS_OLD_WEST02 -- track hash name
        pos = {x = -4848.95, y = -3086.33 , z = -16.5875},
        heading_min = 70,
        heading_max = 80,
        track = -1763976500,
        id = 6,
        left = 1,
        right = 0
    },
    
    
}



Config.Language = {
    cooldown = "Missions are on cooldown",
    trainmenug = "Menu",
    trainmenug2 = "Train Company",
    confirm = "Confirm",
    name = "Name",
    amount = "Amount",
    invalid = "Invalid",
    boughtkey = "You Bought A Train Key For $ ",
    nomoney = "Not Enough Money",
    boughtatrain = "You Bought A Train For $ ",
    deliver = "Deliver",
    type = "Type: ~e~[ /",
    cancelmission = " ] ~q~To Cancel Mission",
    missiondetails = " ] ~q~To View Mission Details",
    pressdeliver = "Press: ~e~[5] ~q~To Deliver",
    delivering = "Delivering",
    deliverycomplete = "Delivery Complete, You Got Paid $",
    fixing = "Fixing Train",
    upgrading = "Upgrading Train",
    upgrades = "Upgrades",
    deliver2 = "Deliver: ",
    speedupgrades = "Speed Upgrades",
    coalmaint = "Coal / Maint.",
    speedups = "Speed Upgrades",
    engineups = "Engine Upgrades",
    noups = "No Upgrades Available",
    press3 = "Press [3] To Upgrade Train",
    usearrow = "Use Right Arrow Instead Of Enter In This Menu",
    trainmaints = "Train Maintenance: ",
    press4 = "Press [4] To Maintaine Train",
    train = "Train",
    press1 = "Press [1] To Open Inventory",
    coal = "Coal: ",
    press2 = "Press [2] To Add Coal",
    speedz = "Speed: ",
    mph = " MPH",
    switchtrack = "Press [LEFTBRACKET] To Switch Track: ",
    cruisee = "Cruise: ",
    youbought = "You Bought A Train Key For $ ",
    cantcarrys = 'Cant Carry',
    trainfixxed = 'Train Fixed, Press E To Exit Maintenance',
    trainfixxed2 = 'Not Enough Material To Fix Train, Press E To Exit Maintenance',
    trainuped = 'Train Speed Upgraded, Press E To Exit Maintenance',
    trainuped2 = 'Not Enough Material To Upgrade, Press E To Exit',
    qt = "Invalid quantity",
    carry = "You cant carry more items",
    limit = "You reached the limit for this item",
    someoneisclose = "Someone is too close to you",
    sitonchair = "Sit",
    getoffchair = "Get up",
    trainchair = "Chair",
    switchLeft = "Switch Left",
    switchRight = 'Switch Right',
    upgradetrain = "Upgrade Train",
    viewmission = "View Mission",
    cancelmission = "Cancel Mission",
    traininv = "Inventory",
    nomaintneeded = "Train Doesnt Need Maintenance",
    nomats = "Not Enough Material In Train",
    blacklisteditem = "Item Is Blacklisted For Train",-- new line

}