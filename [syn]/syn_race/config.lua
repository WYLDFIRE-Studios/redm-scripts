Config2 = {}



Config2.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["B"] = 0x4CC0E2FE,
    ["G"] = 0x760A9C6F,
    ["G2"] = 0xA1ABB953,
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
    ["5"] = 0xAB62E997,
    ["6"] = 0xA1FDE2A6,
    ["7"] = 0xB03A913B,
    ["8"] = 0x42385422,
}
--------------------------------------------------------------------------------
Config2.synstable = true -- only if you are using syn stable
Config2.adminwebhook = "https://discord.com/api/webhooks/956605258962980944/US1CV-ULmIr4OeJDaxxGwElciSZWOkzCq8Of6e8Z4PEcjGFvoAZug03vDsLezuX7peO7"  -- newline
Config2.webhookavatar = "https://www.pngall.com/wp-content/uploads/2016/03/Horse-PNG-8.png"  -- newline
Config2.stables = {
    val = {
        pos = {x= -358.89,y = 776.79, z = 116.25}
    },
    bvs = {
        pos = {x= -2538.21,y = 399.62, z = 148.08}
    },
    --[[ paintedhorsestables = {
        pos = {x= -856.34,y = -1336.43, z = 43.55}
    }, ]]
    sdstable = {
        pos = {x= 2502.95,y = -1459.03, z = 46.31}
    },
    bluebirdstables = {
        pos = {x= -882.38,y = -1361.42, z = 43.51}
    },
    macfarlanes = {
        pos = {x= -2426.22,y = -2396.62, z = 61.21}
    },
    tumbleweed = {
        pos = {x= -5512.69,y = -3060.55, z = -2.36}
    },
    annesburg = {
        pos = {x= 2936.23,y = 1310.43, z = 44.38}
    },
    armadillo = {
        pos = {x= -3678.17,y = -2567.06, z = -13.56}
    },
    caliga = {
        pos = {x= 1860.63,y = -1352.40, z = 42.31}
    },
    queenheartstable = {
        pos = {x= -1809.29,y = -551.09, z = 156.00}
    },
    vanhornstable = {
        pos = {x= 2950.86,y = 796.79, z = 51.39}
    },
}
Config2.sellpercentage = 0.4 -- wild horses sell for 50% the price mentioned in the syn stable config
Config2.jobonly = true -- if set to true only jobs from the syn stable config can tame horses.
Config2.quickactions = 5 -- number of quick action bottons the player has to do
Config2.randomizednum = 0 -- 3 randomized horses will spawn 
Config2.randomtimer = 3600 -- every 1 hour the randomized horses will switch around.
Config2.regfee = 0.5 -- 50% the value of the horse
Config2.cooldowntimer = 120 -- 30 minutes cool down to access the horse tame/sell menu 
Config2.randomized = { -- randomized pre-set wild horses spawn. a random
   -- {model = "A_C_Horse_AmericanStandardbred_Black", loc = {x = -2578.08, y = 424.5, z = 148.6}},
    --[[ {model = "a_c_horse_gypsycob_palominoblagdon", loc = {x = -1680.8, y = -675.45, z = 151.9}},
    {model = "A_C_Horse_Andalusian_DarkBay", loc = {x = 1673.6, y = 1314.76, z = 145.9}},
    {model = "A_C_Horse_Arabian_Black", loc = {x = 2460.4, y = -222.06, z = 42.08}},
    {model = "A_C_Horse_Ardennes_IronGreyRoan", loc = {x = -1696.01, y = 773.4, z = 160.29}},
    {model = "A_C_Horse_KentuckySaddle_ButterMilkBuckskin_PC", loc = {x = 1118.95, y = -1512.35, z = 54.7}}, ]]
}
--------------------------------------------------------------------------------



Config2.racecommand = "race" -- command to open the racemenu 
Config2.cancelracecommand = "crace" -- command to cancel the race while its on going, can only be used by race organizer.


Config2.registerdelay = 60 -- 30 seconds 
Config2.racestartdelay = 3 -- 30 seconds 

Config2.checkpointradius = 10

Config2.registrationradius = 20

Config2.endracetimer = 100 -- timer starts after first player finished the race to end the race

-- Percentages for 1st,2nd and 3rd place. only if the race has more than 3 players. if the race has 3 or less 100% of pot goes to 1st place
Config2.firstper = 0.6
Config2.secper = 0.3
Config2.thirdper = 0.1

Config2.Language = {
    createrace = "Create Race",
    races = "Race Menu",
    pressg = "Press G To Stop Recording Races",
    openmap = "Open Your Map And Place Waypoints",
    no = "No",
    yes = "Yes",
    racename = "Race Name: ",
    confirm = "Confirm",
    fee = "Entry Fee",
    amount = "Amount",
    invalidamount = "Invalid Amount",
    setuppoints= "Race Points",
    racereg = "Race Registered",
    savedraces = "Saved Races",
    managerace = "Manage Race",
    startrace = "Start Race",
    racepoint = "Race Point",
    racepoint1st = "Start Race Point",
    gotostart = "Go To Race Start Blip",
    presstostart = "Press [Enter] To Join Race, Entry Fee: ",
    deleterace = "Delete Race",
    deleterace2 = "Race Deleted",
    thenextblip= "Checkpoint",
    racestartsin = "Race Start :",
    registrationendsin = "Registrantion Ends In: ",
    canceled = "Race Canceled. No One Joined",
    nextp = "Next Checkpoint Distance: ",
    youjoined = "You Joined The Race For: ",
    nocash = "You Dont have Enough Cash To Join, Entry Fee: ",
    finfirst = " Finished In First Place",
    finsec = " Finished In Second Place",
    finthird = " Finished In Third Place",
    raceended = "The Race Is Over",
    racecanceled= "The Race Was Canceled",
    timetillover = "End Race Timer: ",
    stable = "Stables",
    sellhorse = "Sell Horse For $ ",
    horsename = "Horse Name",
    invalid = "Invalid",
    horsetamed = "Horse Tamed",
    press = "Press ",
    stablehorse = "Stable Horse For $ ",
    limithorse ="No Room For More Horses In Stable",
    oncooldown = "You Recently Used This, Come Back Later", 
    soldhorse = "Sold Horse For $", -- newline
    soldhorse2 = "Horse Sell", -- newline
    stableehorse = "Stabled a horse : ", -- newline
    stableehorse2 = "Horse stabled", -- newline

}