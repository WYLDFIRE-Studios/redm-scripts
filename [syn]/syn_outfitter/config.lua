Config = {}

Config.keys = {
    ["B"] = 0x4CC0E2FE,
    ["G"] = 0x760A9C6F,
    ["ENTER"] = 0xC7B5340A,
    ["DOWN"] = 0x05CA7C52,
    ["UP"] = 0x6319DB71,
    ["LEFT"] = 0xA65EBAB4,
    ["RIGHT"] = 0xDEB34313,
    ["RIGHTBRACKET"] = 0xA5BDCD3C,
    ["LEFTBRACKET"] = 0x430593AA,
    ["BACKSPACE"] = 0x156F7119,
    ["ALT"] = 0x8AAA0AD4,
    ["CTRL"] = 0xDB096B85,
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
}
Config.command_enable = false
Config.syn_stable_enable = false -- must own syn stable. WIP

Config.command = "outfitter" -- command open outfitters if command_enabled is true
Config.BannedTowns = {'Annesburg', 'Armadillo', 'Blackwater', 'BeechersHope', 'Breaithwaite', 'Butcher', 'Caliga', 'Cornwall', 'Emerald', 'Lagras', 'Manzanita', 'Rhodes', 'Siska', 'StDenis', 'Strawberry', 'Tumbleweed', 'Valentine', 'Vanhorn', 'Wallace', 'Wapiti', 'AguasducesFarm', 'AguasdulcesRuins', 'AguasdulcesVilla', 'Manico'}
Config.spawnlimit = 10

Config.outfittersnpc = {
    val = {
        Pos = {x= -372.81, y=722.77, z=116.48, h = 352.3}, -- location 
		blipsprite = 773587962, -- blip sprite 
        showblip = true, -- show blip or not 
        Name = 'Valentine Outfitters', -- blip name 
        npcmodel = "cs_mp_cripps",
    },
    rhodes = {
        Pos = {x= 1350.0, y=-1342.27, z=78.15, h = 79.3}, -- location 
		blipsprite = 773587962, -- blip sprite 
        showblip = true, -- show blip or not 
        Name = 'Rhodes Outfitters', -- blip name 
        npcmodel = "cs_mp_cripps",
    },
    saintdenis = {
        Pos = {x= 2825.38, y=-1230.39, z=47.58, h = 336.8}, -- location 
		blipsprite = 773587962, -- blip sprite 
        showblip = true, -- show blip or not 
        Name = 'Rhodes Outfitters', -- blip name 
        npcmodel = "cs_mp_cripps",
    },
}


Config.propsets = { -- type is always 1 for propsets , keep the rest as is. if u want to lock some props for admins only switch admin from 0 to 1 
--https://github.com/femga/rdr3_discoveries/blob/master/objects/propsets_list.lua
{hash = "pg_ambcamp01x_tent_canvas_leanto01",name = "Simple Tent", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambient_camp_add_picnic01",name = "Picnic Stuff", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mg_poker",name = "Poker Set", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_COMPANIONACTIVITY_RUSTLING",name = "Horse Trainers Hitch", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambient_camp_add_umbrella01",name = "Umbrella", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambient_camp_add_gamepole01",name = "Lamp Post", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambient_camp_add_lamppost01",name = "Lamp Post 2", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambient_camp_add_native01",name = "Native Equipment", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambcamp01x_tent_hide",name = "Simple Hunters Tent", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp_possecamp_tent_bounty04x",name = "Simple Bountyhunters Tent", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp_possecamp_tent_collector04x",name = "Simple Collecters Tent", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp_possecamp_tent_collector04x",name = "Simple Traders Tent", price = 2,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambcamp01x_tent_canvas_leanto02",name = "Simple Tent 2", price = 4,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambcamp01x_tent_canvas_tall02",name = "Adventure Tent 1", price = 4,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambient_camp_add_explore",name = "Explorers Gear ", price = 4,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_COMPANIONACTIVITY_ROBBERY",name = "Robbery Planning Gear", price = 4,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_MP_CAMPTRACK306X",name = "Hunters Camp", price = 10,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_HUNTERCAMP01X",name = "Hunters Camp2", price = 10,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_MP_POSSECAMP_CAMPFIRE_LARGE002X",name = "Big Camp Fire", price = 10,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_goldpanner01x",name = "Goldpanners Camp", price = 10,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp_snakesales01x",name = "Snakeoil Sales kit", price = 10,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_BH_RANCHER01X",name = "Lumberjacks Camp", price = 10,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_AMBIENT_CAMPFIREWINTER01X",name = "Simple Camp", price = 10,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambient_camp_add_packwagoncookprep01",name = "Butchers Wagon", price = 10,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_ambcamp02x_tent_snow",name = "Mountain Survival Camp", price = 10,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_herbalistcamp01x",name = "Herbalist Camp", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_MP005_COLLECTORWAGONCAMP01",name = "Gypsys Wagon", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp007_naturalist_camp01x",name = "Naturalists Wagon", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_moonshinecampgroup01x",name = "Moonshine Camp", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp_possecamp_tent_bounty07x",name = "BountyHunters Tent", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp_possecamp_tent_trader07x",name = "Traders Tent", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp_possecamp_tent_collector07x",name = "Collecters Tent", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_MP_POSSECAMP_EXPLORERTENT01X",name = "Explorers Tent", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp_possecamp_followercaravan_large000x",name = "Caravaners Tent", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_MP_POSSECAMP_FOLLOWERTENT_LARGE000X",name = "Caravaners Tent2", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp_posseCamp_horseEnclo_exlrg_combined",name = "Horse Hitches", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_mp_possecamp_merchanttent",name = "Merchants Tent", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "pg_re_mountainmen01x",name = "Mountainmen Camp", price = 20,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "PG_MISSION_GRAYS1_SHOOTOUT01X",name = "Moonshine Large Camp", price = 50,type = 1,spawned = 0,x=0,y=0,z=0,admin = 0},


}

Config.props = { -- type is always 2 for props
--http://rdr2.mooshe.tv/
{hash = "p_hitchingpost01x", name = "Hitching Post",price = 1, type = 2,spawned = 0,x=0,y=0,z=0,admin = 0},
{hash = "p_campfire04x", name = "Campfire",price = 25, type = 2,spawned = 0,x=0,y=0,z=0,admin = 0},

}



---------------------------------------------------------
Config.Language = {
    outfitters = "Outfitters menu",	
    spawn = "spawn",
    despawn = "despawn",
    propsets = "Sets",
    props = "other",
    confirm = "Confirm",
    yes = "Yes",
    no = "No",
    price = "Price: ",
    nocash = "You Dont Have Enough Cash",
    pressg = "Press G to place",
    townclose = "Too Close To Town",
    outfittersmenu = "Press G For Outfitters Shop",
    toomany = "You Have Too Many Spawned. Limit: "
}
---------------------------------------------------------