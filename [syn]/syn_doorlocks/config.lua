Config = {}

Config.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["B"] = 0x4CC0E2FE,
    ["G"] = 0x760A9C6F,
    ["ENTER"] = 0xC7B5340A,
    ["SHIFT"] = 0x8FFC75D6,
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
Config.command = "createdoor" -- command to create a door only can be used by players with admin in the users db
Config.dcommand = "deldoor" -- make sure u can see the icon before u input the command
Config.doorpickedresettimer = 30 -- minutes until picklocked door is reset back to closed position 
Config.onetimeuseitems = false -- if true items will be removed always, if false items will only be removed on false of break in
Config.doorsetjobs = {"realestate"}
Config.doorsetgroups = {"admin"}



Config.premadedoors = { -- use for cell doors as they are buggy to do in game 
{
    authorizedJobs = { "police","marshal" }, -- Valentine Cells (Main Door)
    object = 535323366,		
    objCoords  = vector3(-275.03, 809.27, 118.36),
    textCoords  = vector3(-274.89, 808.03, 119.39),
    objYaw = -80.0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Valentine Cells (Left Door)
    object = 295355979,
    objCoords  = vector3(-273.47, 809.96, 118.36),
    textCoords  = vector3(-272.23, 810.1, 119.39),
    objYaw = 10.0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Valentine Cells (Right Door)
    object = 193903155,
    objCoords  = vector3(-272.06, 808.25, 118.36),
    textCoords  = vector3(-273.3, 808.12, 119.39),
    objYaw = -170.0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Rhodes Cell
    object = 1878514758,
    objCoords  = vector3(1357.33, -1302.45, 76.76),
    textCoords  = vector3(1357.79, -1301.39, 78.03),
    objYaw = 70.0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- St. Denis Cell 1
    object = 2515591150,
    objCoords  = vector3(2503.64, -1309.88, 47.95),
    textCoords  = vector3(2502.4, -1309.79, 48.98),
    objYaw = -179.990,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- St. Denis Cell 2
    object = 1711767580,
    objCoords  = vector3(2502.43, -1307.86, 47.95),
    textCoords  = vector3(2503.67, -1307.94, 48.98),
    objYaw = 0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- St. Denis Cell 3
    object = 1995743734,
    objCoords  = vector3(2499.75, -1309.88, 47.95),
    textCoords  = vector3(2498.51, -1309.79, 48.98),
    objYaw = -179.99,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- St. Denis Cell 4
    object = 3365520707,
    objCoords  = vector3(2498.5, -1307.86, 47.95),
    textCoords  = vector3(2499.74, -1307.94, 48.98),
    objYaw = 0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Annesburg Cell 1
    object = 1657401918,
    objCoords  = vector3(2902.96, 1310.87, 43.94),
    textCoords  = vector3(2903.48, 1312.01, 44.96),
    objYaw = 69.26,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Annesburg Cell 2
    object = 1502928852,
    objCoords  = vector3(2904.27, 1314.34, 43.94),
    textCoords  = vector3(2904.79, 1315.47, 44.96),
    objYaw = 69.26,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Limpany Cell 1
    object = 3173783190,
    objCoords  = vector3(-326.13, -150.07, 50.09),
    textCoords  = vector3(-325.23, -150.93, 51.12),
    objYaw = -39.99,
    locked = false,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Limpany Cell 2
    object = 3387994139,
    objCoords  = vector3(-324.12, -154.25, 50.09),
    textCoords  = vector3(-325.01, -153.38, 51.12),
    objYaw = 140.37,
    locked = false,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Strawberry Cell 1
    object = 1207903970,
    objCoords  = vector3(-1812.01, -351.92, 160.47),
    textCoords  = vector3(-1810.92, -352.52, 161.49),
    objYaw = -25.0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Strawberry Cell 2
    object = 902070893,
    objCoords  = vector3(-1814.4, -353.15, 160.44),
    textCoords  = vector3(-1815, -354.24, 161.46),
    objYaw = -114.99,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Blackwater Cell 1
    object = 2514996158,
    objCoords  = vector3(-765.86, -1264.7, 43.02),
    textCoords  = vector3(-765.78, -1263.46, 44.05),
    objYaw = 90.0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Blackwater Cell 2
    object = 2167775834,
    objCoords  = vector3(-763.53, -1262.46, 43.02),
    textCoords  = vector3(-763.61, -1263.7, 44.05),
    objYaw = -90.0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Armadillo Cell 1
    object = 4016307508,
    objCoords  = vector3(-3620.99, -2600.25, -14.35),
    textCoords  = vector3(-3620.54, -2601.41, -13.33),
    objYaw = -65.0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Armadillo Cell 2
    object = 4235597664,
    objCoords  = vector3(-3619.15, -2604.21, -14.35),
    textCoords  = vector3(-3618.7, -2605.37, -13.33),
    objYaw = -65.0,
    locked = true,
    distance = 1.0
},
{
    authorizedJobs = { "police","marshal" }, -- Tumbleweed Cell
    object = 831345624,
    objCoords  = vector3(-5529.91, -2925.07, -2.36),
    textCoords  = vector3(-5529.46, -2926.24, -1.34),
    objYaw = -65.0,
    locked = true,
    distance = 1.0
},
}

---------------------------------------------------------
Config.Language = {
    ["aimingatdoor"] = "Press ~e~G~q~ While Aiming at Door",	
    ["createhousecancel"] = "Type ~e~/createdoor~q~ To Cancel & Exit",	
    ["pressenterconfirm"] = "Press ~e~Enter~q~ To Confirm",
    ["uparrowicon"] = "Press ~e~Up Arrow~q~ To Move Icon",
    ["downarrowicon"] = "Press ~e~Down Arrow~q~ To Move Icon",
    ["rightarrowicon"] = "Press ~e~Right Arrow~q~ To Move Icon",
    ["leftarrowicon"] = "Press ~e~Left Arrow~q~ To Move Icon",
    ["bracketrighticon"] = "Press ~e~]~q~ To Move Icon",
    ["bracketlefticon"] = "Press ~e~[~q~ To Move Icon",
    ["confirm"] = "Confirm",
    ["set"] = "Set",
    ["notset"] = "Not Set",
    ["furnilimit"] = "You Cant Have More Furniture, the limit is ",
    ["createdoormenu"] = "Create Door Menu",
    ["setupprimdoor"] = "Door Setup",
    ["aresure"] = "Are You Sure?",
    ["cancel"] = "Cancel",
    ["yes"] = "Yes",
    ["no"] = "No",
    ["setupprimodoor"] = "Set Up Door : ",
    ["job1"] = "job1",
    ["job2"] = "job2",
    ["job3"] = "job3",
    ["nojob"] = "no job",
    ["notlocked"] = "false",
    ["locked"] = "true",
    ["lockedd"] = "Locked: ",
    ["noitem"] = "no key item",
    ["item"] = "key item",
    ["doorname"] = "Door Name: ",
    ["changedooriconloc"] = "Change Door Icon Location",
    ["confirmdoor"] = "Confirm Door",
    ["youcreateddoor"] = "You Created a Door",
    ["pressb"] = "Press B To Get Closest Door",
    ["breakin"] = "Allow lockpick: ",
    ["allow"] = "true",
    ["deny"] = "false",


}
---------------------------------------------------------