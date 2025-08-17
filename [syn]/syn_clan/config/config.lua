Config = {}
Config.keys = {
    ["F"] = 0xB2F377E8,
	["B"] = 0x4CC0E2FE,
    ["G"] = 0x760A9C6F,
    ["ENTER"] = 0xC7B5340A,
    ["DOWN"] = 0x05CA7C52,
    ["SHIFT"] = 0x8FFC75D6,
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
    ["I"] = 0xC1989F95,
    ["X"] = 0x8CC9CD42,

}
Config.restatsperday = 4 
-- debug functions disable when going on live server, script is never meant to be restarted while the server is live
-- use these functions to get around the limitation of not being able to restart the script FOR TESTING ONLY
-- do not touch if you dont know what you're doing
Config.debug = false -- KEEP FALSE ON LIVE SERVER

---------------------------------


Config.metadata = true -- set to true when using meta data 3.5 inventory update 
Config.useDecayitems = true -- set to true if you are useing vorp inventory 4.0 or higher

--New Item Blacklist for storage items in this list will not beable to be stored in the storage
Config.ItemBlacklist = {
    "wood",
    "stone",
    "metal",
    "p_ambpack02x",

}
---------------------------------
Config.discordid = true -- turn on if you have some sort of discord whitelist 
Config.flagitem = "flag"
Config.adminwebhook = ""
Config.butcheradminwebhook = ""
Config.webhookavatar = "https://helponechild.org/wp-content/uploads/2018/05/44cd29010850ae70bba6b733ae44e00d-1.png"
Config.timesave = 30 -- save info every 10 minutes to database
------------------------------
Config.autocleanhorse = false -- turn true or false the cleaning of skins on horses 
Config.autocleananimals = 100 -- dont use if u dont know 
------------------------------
Config.viewinvites = "viewinvites"
Config.changeleader = "changeleader" -- admin command to change clan leader, new leader must be online /changeleader playerid clanid
Config.maxclan = 10 -- set to 0 if you want unlimited clan members for each clan
----------------------
Config.rading = true -- allow players to raid each other 
Config.raidcooldown = true 
Config.campownerraidonly = true -- only players who are a part of a clan can raid. if set to false any player can raid any camp
Config.raidcooldowncycles = 12 -- this is related to your server restart cycle.  set to 12 a camp can be raided once every 3 days (12 restart cycles)
-- when a camp is raided its cooldown is set to the number above. the number is reduced by 1 every time a restart cycle occurs when the number is at 0 the camp can be raided again
-- as per original config there are 4 restart cycles. meaning a camp can only be raided once every day. set to 8 for once every 2 days etc.
Config.clancountraid = 2 -- this is the number of clan members that have to be online to allow a camp to be raided. set to 0 if you want camps to be raided when all members are offline. setting to 2 means only allowed to be raided if atleast 2 clan members are online
Config.raidtimer = 10 -- raiders have to wait in minutes between when they start the raid until they can lockpick. this gives the clan members a chance to respond to the raid. 
Config.lockpicktimer = 5 -- raiders have to this much time to lockpick, if they dont lockpick raid is reset (considered failed)
Config.openloottimer = 10 -- the camp is marked open for loot for time in minutes after lockpicking
Config.processtimer = 30 -- wait 30 minutes before any option to raid clan re-appears after inital raid trigger
Config.lockpickitem = "lockpick"
Config.raiddistancecheck = 100 
----------------------
Config.allowuserwebhook = true -- set to true to allow users to input their own webhooks 
----------------------
Config.poisonsnake = true -- if toggled true snakes will be poisonus 
Config.cureitem = {"antipoison2","unique_helper"} 
Config.poisonticktime = 6 -- tickets a health reduction every 6 seconds 
Config.enablehealthdamage = true
Config.healthloss = 5-- health loss every tick until lowest 
Config.lethal = false --poison will not kill the player
Config.saveserver = true -- if true poison data is saved on the server meaning a relog wont register it gone
Config.disablepoisonondeath = false -- disable poison effect on death meaning a player dying will remove poison. leave as true if u want the poison to remain even if the player died
Config.visualclicks = 30 -- poisonticktime until visual effect
Config.ticksuntilwalk = 60 -- poisonticktime until forced walk 
Config.clickstilldamage = 120
----------------------
Config.adminfurniresetcommand = "adminresetfurni" -- reset furniture to the unpitched state for a clan /command clanid 
Config.furnilimit = 100
Config.blip = 1754365229
Config.campspacing = 200 -- distance of camps from each other -- camp spacing should always be 2.5 the render distance
Config.render = 100-- -- distance to render camp 
Config.placementradius = 50-- -- make sure its less than the render radius 
Config.changeblipcost = 500
Config.relocatecost = 800 
Config.roaddistcheck = 20 -- distance check from road 
Config.relocatecommand = "movecamp"
----------------
-- Taxes
Config.adminunrepocommand = "unrepoclan"
Config.adminrepocommand = "repoclan"
Config.taxcost = 5000 -- amount the player will be charged come tax time
Config.allocationlimit = 5000 -- amount player is allowed to deposit in their tax ledger. limit this to the same amount as the tax cost if you want to ensure players are active monthly and are returning to put money in the ledger so that no big amounts are placed and the camp stays innactive
Config.minmembers = true --set to true if you want to repo camps that dont meet the member count requirement 
Config.minmembercount = 5 -- this is the member count requirement that is checked when repo time comes. if players dont meet this count their camp is repoed
Config.monthlyrepo = true 
Config.repotime ={ -- day, hour, and minute of monthly repo of clans. when the server time matches these values. camps that dont have money in their ledger = or more than the tax rate of the camp will 
-- be put in a disabled state, and marked as repo 1 in the database. u can switch them back to active state by changing databse from 1 to 0 when the script is disabled
    day = 15,
    hour = 6,
    minute = 30
} 

Config.weeklyrepo = false -- sam,e as above but weekly instead of monthly, only of of the 2 active. 
Config.repotime2 ={ 
    day1 = 3,
    day2 = 10,
    day3 = 17,
    day4 = 24,
    hour = 6,
    minute = 10
} 
-----------------
Config.huntingwagon = true -- set to true if you want to allow players to buy hunting wagons functionallity
Config.huntingwagoncost = 1000 -- cost to buy a hunting wagon for the camp
Config.maxanimals = 30 -- max animals and pelts stored in wagon 
-----------------
Config.clanflagprop = `mp001_s_mpcorona01x`
------------------------
Config.stocktime = 30 -- time in minutes where material is changed to stock. 
Config.stockprocessing = 10 -- amount of materials that is turned into stock as Config.stocktime passes 
Config.supplyprice = 5 -- price per supplie if the player decided to buy them instead of doing mission to gain supplies
Config.supplyperstock = 1 -- supply amount drained from supply count every time materials is turned to supplies as Config.stocktime passes 
Config.randomizedsaleprice = true -- set to true if you want to randomize sale price according to the Config.randomprice
Config.randomprice = {min = 15,max = 20} -- money the player makes per stock piece is a random number between min and max multiplied by the amount of stock
Config.statifprice = 10 -- sale price per stock if Config.randomizedsaleprice is set to false. 
------------------------ stew config 

Config.beerstats = {
    hunger = 0,
    thirst = 5,
    metabolism = 5,
    innercorestamina = 0.0,
    innercorestaminagold = 0.0,
    outercorestaminagold = 0.0,
    innercorehealth = 0.0,
    innercorehealthgold = 0.0,
    outercorehealthgold = 0.0,
    drunkcount = 2, -- apply drunk effect if player drinks this amount of beers 
    drunktime = 1, -- be drunk for 1 minute 
}


Config.stewpot = { 
    {
        name = "Veggie Stew",
        timeinminutes = 10, -- 10 minutes to spoil and remove
        recipie = { 
            {label = "Water",item = "water", count = 5},
            {label = "Wild Carrot",item = "Wild_Carrot", count = 3},
            {label = "Potatos",item = "potato", count = 2},
            {label = "Garlic",item = "Crows_Garlic", count = 1},
        },
        stats = {
            hunger = 10,
            thirst = 10,
            metabolism = 10,
            innercorestamina = 10.0,
            innercorestaminagold = 10.0,
            outercorestaminagold = 10.0,
            innercorehealth = 10.0,
            innercorehealthgold = 10.0,
            outercorehealthgold = 10.0,
        },
    },
    {
        name = "Minced Meat Stew",
        timeinminutes = 15, 
        recipie = { 
            {label = "Wild Carrot",item = "Wild_Carrot", count = 3},
            {label = "Water",item = "water", count = 5},
            {label = "Potatos",item = "potato", count = 2},
            {label = "Garlic",item = "Crows_Garlic", count = 1},
            {label = "Game Meat",item = "game", count = 3},
        },
        stats = {
            hunger = 20,
            thirst = 20,
            metabolism = 20,
            innercorestamina = 20.0,
            innercorestaminagold = 20.0,
            outercorestaminagold = 20.0,
            innercorehealth = 20.0,
            innercorehealthgold = 20.0,
            outercorehealthgold = 20.0,
        },
    },
    {
        name = "Ash Reshteh",
        timeinminutes = 15, 
        recipie = { 
            {label = "Wild Carrot",item = "Wild_Carrot", count = 3},
            {label = "Water",item = "water", count = 5},
            {label = "Garlic",item = "Crows_Garlic", count = 2},
            {label = "Game Meat",item = "game", count = 3},
            {label = "Beef",item = "beef", count = 3},
            {label = "Bird Meat",item = "bird", count = 2},
        },
        stats = {
            hunger = 20,
            thirst = 20,
            metabolism = 20,
            innercorestamina = 20.0,
            innercorestaminagold = 20.0,
            outercorestaminagold = 20.0,
            innercorehealth = 20.0,
            innercorehealthgold = 20.0,
            outercorehealthgold = 20.0,
        },
    },
    {
        name = "Beef, Meat And Veggies Stew",
        timeinminutes = 20, 
        recipie = { 
            {label = "Wild Carrot",item = "Wild_Carrot", count = 3},
            {label = "Water",item = "water", count = 5},
            {label = "Potatos",item = "potato", count = 2},
            {label = "Garlic",item = "Crows_Garlic", count = 1},
            {label = "Game Meat",item = "game", count = 3},
            {label = "Beef",item = "beef", count = 4},
        },
        stats = {
            hunger = 30,
            thirst = 30,
            metabolism = 30,
            innercorestamina = 30.0,
            innercorestaminagold = 30.0,
            outercorestaminagold = 30.0,
            innercorehealth = 30.0,
            innercorehealthgold = 30.0,
            outercorehealthgold = 30.0,
        },
    },
    {
        name = "Salmon and Veggies Stew",
        timeinminutes = 30, 
        recipie = { 
            {label = "Wild Carrot",item = "Wild_Carrot", count = 3},
            {label = "Water",item = "water", count = 5},
            {label = "Potatos",item = "potato", count = 2},
            {label = "Garlic",item = "Crows_Garlic", count = 1},
            {label = "Oregano",item = "Oregano", count = 1},
            {label = "Parasol Mushroom",item = "Parasol_Mushroom", count = 5},
            {label = "Sockeye Salmon",item = "a_c_fishsalmonsockeye_01_ms", count = 3},
        },
        stats = {
            hunger = 40,
            thirst = 40,
            metabolism = 40,
            innercorestamina = 40.0,
            innercorestaminagold = 40.0,
            outercorestaminagold = 40.0,
            innercorehealth = 40.0,
            innercorehealthgold = 40.0,
            outercorehealthgold = 40.0,
        },
    },
    
}
--------------------------------------
Config.publicbutcher = true -- set to true as a replacement of vorp hunting
Config.butchers = {
    ["Valentine's Butcher"] = {
        blip = 1369919445,
        coords = {x=-339.0141,y =767.6358,z = 115.5645,h =100.4},
        joblocked = false,
        jobs = {"butcher","doctor"}
    },
    ["Strawberry's Butcher"] = {
        blip = 1369919445,
        coords = {x=-1753.143,y =-392.4201,z = 155.2578,h =181.3},
        joblocked = false, 
        jobs = {"butcher","doctor"}
    },
    ["Blackwater's Butcher"] = {
        blip = 1369919445,
        coords = {x=-754.0,y =-1285.1,z = 42.8,h =273.579},
        joblocked = false, 
        jobs = {"butcher","doctor"}
    },
    ["Annesburg's Butcher"] = {
        blip = 1369919445,
        coords = {x=2934.8,y=1307.02,z=44.48,h =70.5},
        joblocked = false, 
        jobs = {"butcher","doctor"}
    },
    ["Rhodes's Butcher"] = {
        blip = 1369919445,
        coords = {x=1297.5,y =-1277.5,z = 74.8,h =146.6},
        joblocked = false, 
        jobs = {"butcher","doctor"}
    },
    ["Armadillo's Butcher"] = {
        blip = 1369919445,
        coords = {x=-3691.4,y =-2623.1,z = -14.7,h =0.4},
        joblocked = false, 
        jobs = {"butcher","doctor"}
    },
    ["Saint Denis Butcher"] = {
        blip = 1369919445,
        coords = {x=2835.13,y =-1304.52,z = 45.7,h =179.88},
        joblocked = false, 
        jobs = {"butcher","doctor"}
    },
    ["Tumbleweed's Butcher"] = {
        blip = 1369919445,
        coords = {x=-5510.3,y =-2947.0,z = -1.89,h =251.5},
        joblocked = false, 
        jobs = {"butcher","doctor"}
    },
}
---------------------------------