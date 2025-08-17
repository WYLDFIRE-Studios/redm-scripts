
-- create npcs that are optimized to render/de-render based on distance 
-- r is the render distance the player has to be to check for spawn/despawn
Config.npc = {
    {
        npcmodel = `S_M_M_UNIBUTCHERS_01`, -- Valentine
        coords = {x=-339.0141,y =767.6358,z = 115.5645,h =100.4,r = 100},
        grounded = false, -- helps find ground level (doesnt work well if the npc is under a roof set to false in that case)
    },
    {
        npcmodel = `S_M_M_UNIBUTCHERS_01`, --Strawberry
        coords = {x=-1753.143,y =-392.4201,z = 155.2578,h =181.3,r = 100},
        grounded = false, 
    },
    {
        npcmodel = `S_M_M_UNIBUTCHERS_01`,--Blackwater
        coords = {x=-754.0,y =-1285.1,z = 42.8,h =273.579,r = 100},
        grounded = false, 
    },
    {
        npcmodel = `S_M_M_UNIBUTCHERS_01`, -- Annesburg
        coords = {x=2934.8,y=1307.02,z=43.68,h =70.5,r = 100},
        grounded = false, 
    },
    
    {
        npcmodel = `S_M_M_UNIBUTCHERS_01`, -- Rhodes
        coords = {x=1297.5,y =-1277.5,z = 74.8,h =146.6,r = 100},
        grounded = false, 
    },
    {
        npcmodel = `S_M_M_UNIBUTCHERS_01`, -- Armadillo
        coords = {x=-3691.4,y =-2623.1,z = -14.7,h =0.4,r = 100},
        grounded = false, 
    },
    {
        npcmodel = `S_M_M_UNIBUTCHERS_01`, -- Saint
        coords = {x=2835.13,y =-1304.52,z = 45.7,h =179.88,r = 100},
        grounded = false, 
    },
    {
        npcmodel = `S_M_M_UNIBUTCHERS_01`, -- Tumbleweed
        coords = {x=-5510.3,y =-2947.0,z = -2.8,h =251.5,r = 100},
        grounded = false, 
    },
}