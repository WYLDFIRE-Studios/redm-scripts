Config.missionregion = {
    val = {x =-283.83,y =806.4,z =   119.38 },
    sd = {x =2721.4562,y =-1446.0975,z = 46.2303 },
    arma = {x =-3742.5,y =-2600.9,z = -13.23},
    bw = {x =-723.9527,y =-1242.8358,z = 44.7341},
    rhodes = {x =1229.0,y =-1306.1,z =76.9},
    annes = {x =2955.95,y =1304.94,z =44.53},
    straw = {x =-1747.29,y =-362.9,z =169.5},
    snow = {x =-1459.6,y =1634.11,z =243.2},
    tw = {x =-5513.53,y =-2930.86,z =-2.23},
}

Config.regionlock = {} -- lock camp creation to specific region, leave empty to allow camp creation anywhere on the map 

Config.supplymissionblipspire = 1612913921
Config.deliverymissionsprite = 1612913921
Config.locationdistancecheck = 100 -- distance to check if player is near spawn area 
Config.missionoverdistance = 300 -- end mission if player is this far from mission area after enemies spawned
Config.blipai = true -- add enemy blips to AI 
Config.supplymissioncooldown = 30 -- time in minutes between each supply mission player is allowed to do 
Config.deliverymissioncooldown = 30
Config.smalldelivery = 25 -- small deliver wagon stock needed 
Config.middelivery = 50 
Config.largedelivery = 100
Config.autoresetmissiontimer = 30 -- timer in minutes to auto re-add mission into available mission pool after being occupied for this amount of time in minutes




-- if you want an enemy to spawn on horse set horse to the horse hash, otherwise set horse to 0

Config.supplymissions = {

    val = { 
        {
            coords = {x =287.2,y =574.86,z =117.5 },
            reward = math.random(25,50), -- rewards between the two numbers of supplies for wagon delivery 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =300.7,y =575.45,z =116.8, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =300.25,y =566.01,z =116.25, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =292.0,y =562.18,z =115.91, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =275.0,y =566.185,z =115.89, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =265.485,y =573.86,z =116.422, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =261.58,y =589.95,z =117.6, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =268.266,y =600.37,z =118.56, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =296.23,y =597.14,z =116.5, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =302.66,y =585.17,z =117.0, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =306.8,y =575.0,z =116.3, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},
            },

        },
        {
            coords = {x =-1030.322,y =314.0,z =64.6 },
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-1025.23,y =306.1,z =66.9, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-1031.3,y =305.1,z =65.22, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-1036.98,y =308.2,z =63.75, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-1036.2,y =329.39,z =64.95, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-1041.79,y =327.99,z =63.077, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-1056.3,y =327.099,z =60.34, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-1049.11,y =337.0,z =61.6, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-1033.16,y =333.95,z =66.16, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-1029.74,y =327.63,z =65.90, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-1022.3,y =307.09,z =68.2, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =-66.29,y =1111.19,z =163.8 },
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-64.18,y =1117.74,z =163.7, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-59.18,y =1116.25,z =164.5, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-53.06,y =1107.3,z =165.6, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-48.28,y =1099.38,z =167.4, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-63.15,y =1098.9,z =163.59, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-49.92,y =1098.44,z =167.17, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-49.9,y =1103.02,z =167.17, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-30.8,y =1095.44,z =169.4, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-38.24,y =1119.58,z =167.05, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-61.3,y =1110.5,z =164.43, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =947.0,y =1141.55,z =148.5 },
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =949.22,y =1126.3,z =148.19, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =939.26,y =1128.6,z =147.19, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =927.83,y =1131.9,z =146.18, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =921.53,y =1144.05,z =146.24, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =922.3,y =1156.5,z =146.3, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =953.74,y =1152.93,z =150.43, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =956.41,y =1141.5,z =149.17, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =949.9,y =1126.14,z =148.3, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =948.2,y =1133.61,z =148.45, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =925.6,y =1130.46,z =146.05, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =181.7,y =112.23,z =103.82 },
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =185.6,y =120.2,z =104.15, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =185.1,y =126.28,z =104.3, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =178.8,y =100.98,z =103.1, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =183.16,y =89.26,z =101.1, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =199.44,y =104.7,z =100.06, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =210.6,y =96.6,z =99.8, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =205.07,y =86.0,z =100.21, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =196.7,y =81.02,z =100.06, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =185.15,y =85.93,z =100.28, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =188.39,y =95.94,z =101.57, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
    },
    sd = { 
        {
            coords = {x =1973.3,y =-928.21,z =42.53 },
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =1972.26,y =-938.7,z =42.22, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =1984.9,y =-924.01,z =41.9, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =1989.1,y =-919.9,z =42.5, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =1983.9,y =-902.7,z =42.39, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =2013.4,y =-916.02,z =42.3, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =2000.17,y =-916.8,z =42.51, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =1993.3,y =-913.1,z =42.59, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =2005.5,y =-917.8,z =42.59, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =1987.8,y =-912.0,z =42.62, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =2022.46,y =-900.4,z =42.99, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =2499.8,y =-605.28,z =42.68 },
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =2494.0,y =-598.75,z =42.7, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =2469.7,y =-609.09,z =41.6, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =2477.29,y =-623.6,z =41.3, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =2481.01,y =-612.9,z =41.7, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =2495.4,y =-601.0,z =42.7, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =2486.1,y =-598.7,z =41.56, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =2464.3,y =-595.45,z =41.54, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =2456.8,y =-598.4,z =41.57, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =2449.0,y =-604.86,z =41.56, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =2463.22,y =-594.4,z =41.6, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =2396.6,y =-739.5,z =41.2 },
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =2403.3,y =-731.8,z =41.58, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =2398.1,y =-726.6,z =41.9, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =2388.45,y =-726.5,z =41.6, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =2399.06,y =-722.62,z =41.7, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =2388.58,y =-750.24,z =42.39, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =2404.23,y =-751.46,z =41.52, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =2415.9,y =-747.23,z =41.6, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =2409.2,y =-726.7,z =41.9, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =2380.56,y =-734.5,z =41.24, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =2405.2,y =-738.6,z =41.51, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =2133.2,y =-956.9,z =41.6 },
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =2124.29,y =-963.3,z =41.08, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =2132.4,y =-949.2,z =41.6, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =2148.6,y =-970.6,z =42.2, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =2151.0,y =-983.9,z =41.7, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =2156.5,y =-944.03,z =41.85, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =2154.98,y =-952.14,z =42.64, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =2152.98,y =-966.11,z =42.59, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =2141.5,y =-963.8,z =42.32, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =2174.42,y =-949.12,z =42.24, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =2186.57,y =-951.87,z =41.66, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =2090.44,y =-1357.45,z =42.16 },
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =2081.0,y =-1370.0,z =42.4, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =2088.57,y =-1369.8,z =42.33, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =2095.49,y =-1349.7,z =42.2, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =2102.86,y =-1340.2,z =42.62, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =2085.25,y =-1329.08,z =43.0, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =2068.4,y =-1345.1,z =43.08, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =2069.3,y =-1365.9,z =43.04, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =2102.33,y =-1345.6,z =42.31, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =2088.15,y =-1327.6,z =43.06, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =2071.89,y =-1331.3,z =42.98, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        
    },
    arma = { 
        {
            coords = {x =-3416.4,y =-2246.8,z =-4.4 },
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-3402.45,y =-2253.6,z =-4.62, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-3403.59,y =-2258.7,z =-4.4, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-3416.18,y =-2260.38,z =-4.3, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-3427.6,y =-2255.09,z =0.04, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-3435.04,y =-2269.3,z =-3.5, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-3397.03,y =-2273.49,z =-4.43, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-3421.7,y =-2276.0,z =-4.24, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-3437.0,y =-2288.72,z =-4.22, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-3431.48,y =-2303.9,z =-4.08, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-3413.2,y =-2297.8,z =-4.09, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =-4278.9,y =-2700.69,z =-0.35},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-4263.92,y =-2697.6,z =0.89, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-4289.51,y =-2691.4,z =2.44, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-4301.67,y =-2686.9,z =4.58, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-4272.92,y =-2719.49,z =5.24, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-4252.56,y =-2711.84,z =4.85, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-4278.0,y =-2701.53,z =0.33, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-4288.47,y =-2710.15,z =0.77, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-4299.63,y =-2708.1,z =0.6, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-4290.5,y =-2696.2,z =1.52, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-4263.88,y =-2713.45,z =-0.76, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =-3321.22,y =-3078.06,z =1.08},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-3338.58,y =-3073.84,z =1.05, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-3327.64,y =-3071.4,z =0.945, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-3319.6,y =-3076.98,z =1.01, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-3319.95,y =-3097.0,z =0.95, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-3343.58,y =-3096.4,z =0.012, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-3341.5,y =-3073.7,z =0.89, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-3325.7,y =-3065.59,z =0.98, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-3309.46,y =-3062.4,z =0.8, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-3304.49,y =-3079.3,z =0.82, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-3293.99,y =-3096.98,z =1.153, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =-2928.0,y =-2705.96,z =78.2},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-2940.27,y =-2713.9,z =84.15, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-2946.88,y =-2701.05,z =84.1, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-2916.19,y =-2703.2,z =83.87, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-2920.39,y =-2691.6,z =83.23, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-2913.3,y =-2708.5,z =83.58, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-2925.3,y =-2685.3,z =79.22, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-2935.1,y =-2677.5,z =78.56, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-2923.8,y =-2712.85,z =78.711, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-2911.43,y =-2715.45,z =78.22, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-2926.1,y =-2685.6,z =79.01, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =-2568.51,y =-3099.67,z =10.8},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-2564.5,y =-3115.19,z =10.36, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-2552.2,y =-3113.79,z =9.85, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-2555.8,y =-3092.0,z =10.95, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-2574.16,y =-3090.51,z =10.92, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-2577.17,y =-3102.11,z =10.47, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-2576.522,y =-3122.63,z =8.71, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-2512.799,y =-3120.5,z =3.48, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-2522.5,y =-3134.43,z =3.77, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-2538.2,y =-3136.09,z =6.81, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-2551.56,y =-3126.2,z =9.97, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        
    },
    bw = { 
        {
            coords = {x =-1971.85,y =-1719.16,z =125.99},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-1982.8,y =-1718.6,z =127.1, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-1965.0,y =-1728.8,z =125.0, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-1975.4,y =-1702.0,z =126.2, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-1991.13,y =-1725.7,z =126.09, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-1962.3,y =-1728.4,z =124.76, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-1947.48,y =-1720.6,z =122.166, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-2003.59,y =-1686.3,z =130.9, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-2014.79,y =-1698.99,z =130.98, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-1999.6,y =-1705.6,z =129.8, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-1979.1,y =-1704.97,z =127.21, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =-1468.5,y =-1932.8,z =49.7},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-1483.4,y =-1929.28,z =51.6, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-1472.28,y =-1888.55,z =58.54, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-1465.16,y =-1929.25,z =49.8, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-1462.23,y =-1915.77,z =51.62, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-1507.98,y =-1900.71,z =55.54, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-1497.6,y =-1896.3,z =55.9, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-1484.6,y =-1907.76,z =53.77, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-1469.45,y =-1923.06,z =51.129, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-1454.1,y =-1915.19,z =51.4, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-1454.39,y =-1897.7,z =55.15, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =-1621.9,y =-1175.02,z =78.77},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-1611.33,y =-1164.33,z =77.5, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-1615.6,y =-1156.0,z =77.92, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-1624.89,y =-1177.45,z =79.11, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-1621.07,y =-1186.69,z =77.88, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-1611.23,y =-1183.09,z =76.42, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-1603.16,y =-1173.99,z =76.5, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-1618.57,y =-1147.78,z =78.65, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-1629.95,y =-1154.98,z =80.41, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-1624.7,y =-1171.5,z =79.13, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-1618.58,y =-1180.5,z =77.77, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =-898.29,y =-1833.6,z =62.61},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-889.28,y =-1826.17,z =63.58, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-894.58,y =-1806.05,z =64.03, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-903.13,y =-1805.76,z =63.73, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-916.43,y =-1809.25,z =63.3, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-921.0,y =-1819.8,z =62.29, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-931.5,y =-1815.0,z =63.02, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-933.6,y =-1801.4,z =64.07, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-922.16,y =-1795.84,z =65.02, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-912.5,y =-1796.7,z =64.75, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-899.3,y =-1803.89,z =64.28, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =-2342.2,y =-1713.3,z =118.6},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =-2333.9,y =-1719.6,z =118.06, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =-2344.7,y =-1724.07,z =117.45, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =-2354.6,y =-1714.45,z =119.02, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =-2350.19,y =-1700.3,z =120.94, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =-2362.95,y =-1698.03,z =121.6, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =-2333.24,y =-1730.6,z =116.94, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =-2340.25,y =-1737.48,z =116.2, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =-2356.3,y =-1704.4,z =120.1, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =-2352.46,y =-1696.4,z =121.6, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =-2341.36,y =-1686.54,z =123.75, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        
    },
    rhodes = { 
        {
            coords = {x =1324.8,y =-1621.29,z =66.39},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =1313.3,y =-1627.5,z =66.25, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =1304.36,y =-1623.6,z =66.4, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =1297.79,y =-1619.4,z =66.0, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =1333.6,y =-1638.55,z =66.74, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =1323.98,y =-1638.5,z =66.6, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =1350.39,y =-1608.59,z =66.7, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =1352.45,y =-1620.0,z =66.7, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =1344.4,y =-1627.5,z =66.6, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =1322.89,y =-1598.9,z =65.58, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =1307.659,y =-1609.6,z =65.29, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =858.0,y =-878.2,z =54.48},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =866.48,y =-870.19,z =57.24, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =880.6,y =-871.47,z =58.56, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =887.63,y =-870.94,z =60.35, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =867.64,y =-863.28,z =59.63, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =858.1,y =-867.8,z =56.98, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =847.76,y =-877.28,z =53.7, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =859.4,y =-885.6,z =52.73, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =861.08,y =-899.21,z =52.75, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =868.98,y =-906.84,z =54.0, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =885.94,y =-903.4,z =55.19, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =1473.9,y =-986.7,z =52.78},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =1473.23,y =-991.3,z =52.86, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =1470.79,y =-1004.28,z =52.39, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =1471.19,y =-978.35,z =53.0, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =1458.9,y =-985.13,z =54.38, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =1464.7,y =-977.26,z =53.98, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =1499.96,y =-991.64,z =49.4, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =1501.09,y =-1006.95,z =49.2, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =1484.7,y =-1016.16,z =50.79, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =1498.7,y =-990.17,z =49.42, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =1493.58,y =-977.4,z =50.15, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =1953.3,y =-1750.4,z =43.13},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =1969.5,y =-1753.34,z =42.46, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =1972.6,y =-1741.52,z =42.3, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =1959.0,y =-1731.4,z =42.49, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =1947.5,y =-1750.6,z =43.4, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =1953.59,y =-1758.79,z =43.15, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =1958.45,y =-1755.0,z =42.7, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =1961.3,y =-1741.6,z =42.9, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =1964.09,y =-1729.5,z =42.26, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =1969.4,y =-1745.4,z =42.45, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =1982.5,y =-1764.4,z =41.7, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =854.3,y =-678.0,z =66.6},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =865.55,y =-672.9,z =68.74, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =861.99,y =-669.67,z =68.75, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =868.6,y =-668.3,z =69.5, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =875.38,y =-672.5,z =68.36, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =867.69,y =-694.5,z =64.68, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =894.23,y =-704.83,z =62.9, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =902.8,y =-699.99,z =63.84, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =901.78,y =-680.6,z =64.63, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =894.21,y =-674.37,z =66.6, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =880.8,y =-669.64,z =67.59, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        
    },
    annes = { 
        {
            coords = {x =2451.85,y =1255.66,z =110.94},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =2465.24,y =1263.18,z =115.32, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =2468.76,y =1282.75,z =115.22, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =2434.18,y =1277.3,z =113.62, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =2432.25,y =1266.14,z =112.33, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =2418.9,y =1269.9,z =113.08, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =2420.9,y =1257.28,z =109.18, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =2420.59,y =1243.28,z =106.76, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =2460.8,y =1269.75,z =111.512, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =2450.93,y =1274.8,z =111.83, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =2451.6,y =1262.9,z =109.98, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =3065.9,y =1650.77,z =60.47},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =3074.39,y =1647.43,z =58.74, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =3062.6,y =1633.98,z =61.32, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =3067.49,y =1626.75,z =61.56, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =3085.01,y =1633.75,z =58.2, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =3074.25,y =1652.8,z =60.06, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =3062.98,y =1650.87,z =60.47, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =3071.0,y =1639.7,z =57.62, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =3077.11,y =1631.52,z =56.27, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =3082.8,y =1625.0,z =55.68, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =3078.93,y =1608.98,z =55.52, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =2568.8,y =621.559,z =74.52},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =2571.85,y =612.5,z =75.65, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =2561.45,y =630.29,z =76.5, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =2547.2,y =618.69,z =74.86, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =2547.0,y =608.5,z =74.84, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =2575.5,y =612.5,z =75.8, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =2582.4,y =616.75,z =75.46, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =2578.98,y =627.27,z =74.98, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =2574.75,y =635.6,z =76.84, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =2595.3,y =619.5,z =76.2, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =2583.0,y =602.18,z =78.0, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =2317.19,y =1805.12,z =120.05},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =2301.87,y =1822.6,z =123.13, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =2296.95,y =1809.2,z =118.23, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =2297.7,y =1791.11,z =113.4, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =2311.32,y =1822.29,z =122.66, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =2325.6,y =1818.85,z =123.09, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =2316.68,y =1794.42,z =117.66, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =2322.05,y =1787.83,z =116.07, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =2302.74,y =1782.3,z =111.84, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =2317.33,y =1822.8,z =122.56, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =2328.09,y =1805.43,z =121.07, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x =1821.17,y =1308.89,z =202.42},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                {x =1810.8,y =1314.8,z =201.82, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                {x =1814.6,y =1307.89,z =201.82, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                {x =1820.93,y =1301.32,z =202.07, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                {x =1843.24,y =1309.9,z =204.07, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                {x =1835.33,y =1288.8,z =202.52, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},

                {x =1835.7,y =1298.9,z =203.81, weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                {x =1823.78,y =1289.88,z =199.79, weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                {x =1819.19,y =1281.67,z =197.47, weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                {x =1843.5,y =1291.95,z =204.62, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                {x =1845.6,y =1276.31,z =207.6, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        
    },
    straw = { 
        {
            coords = {x = -2712.61, y = 40.68, z = 162.76},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x = -2714.37, y = 19.79, z = 164.57,  weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x = -2712.75, y = 11.52, z = 166.73,  weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x = -2704.54, y = 11.43, z = 165.85,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x = -2704.25, y = 17.9, z = 164.51,  weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x = -2704.12, y = 23.9, z = 164.1,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x = -2706.88, y = 33.65, z = 162.87,  weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x = -2718.4, y = 34.48, z = 162.82,  weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x = -2721.89, y = 29.73, z = 162.26,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x = -2727.92, y = 24.88, z = 161.69,  weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x = -2731.63, y = 21.08, z = 161.07,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1576.19,y=145.69,z=108.32,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-1582.99,y=138.83,z=112.58,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1590.08,y=137.8,z=115.1,       weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1592.86,y=153.54,z=114.77,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1589.32,y=159.25,z=114.1,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1582.78,y=162.55,z=112.41,     weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1573.59,y=161.12,z=110.72,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1569.49,y=156.89,z=107.79,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1568.14,y=150.74,z=106.86,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1570.97,y=146.67,z=107.53,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1580.7,y=145.09,z=109.25,      weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1501.28,y=-374.57,z=134.49,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-1507.98,y=-388.24,z=135.35,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1502.86,y=-392.39,z=133.95,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1496.16,y=-394.05,z=131.61,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1489.11,y=-398.4,z=130.11,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1484.81,y=-396.96,z=128.43,     weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1480.97,y=-389.69,z=127.2,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1479.29,y=-383.93,z=128.14,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1477.91,y=-378.69,z=128.65,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1477.02,y=-372.39,z=128.97,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1479.9,y=-366.78,z=129.69,     weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1492.04,y=-888.09,z=90.06,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-1484.31,y=-887.92,z=91.56,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1476.47,y=-887.71,z=93.02,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1469.93,y=-886.49,z=93.79,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1470.75,y=-892.91,z=93.08,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1497.51,y=-900.61,z=86.78,     weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1506.06,y=-897.07,z=88.36,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1507.42,y=-886.79,z=88.99,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1508.14,y=-881.77,z=90.26,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1505.99,y=-876.1,z=91.81,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1498.67,y=-873.51,z=91.74,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1032.21,y=-295.13,z=82.96,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-1044.84,y=-295.12,z=83.17,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1049.57,y=-299.94,z=83.84,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1048.06,y=-306.4,z=84.22,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1040.28,y=-311.25,z=83.99,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1042.66,y=-270.98,z=82.27,     weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1050.87,y=-266.93,z=82.25,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1056.64,y=-273.91,z=82.39,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1050.13,y=-277.45,z=82.64,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1040.62,y=-275.32,z=82.28,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1030.98,y=-279.82,z=81.43,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },

    },
    tw = { 
        {
            coords = {x=-6409.09,y=-3481.75,z=-27.24,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-6420.63,y=-3479.5,z=-27.04,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-6428.16,y=-3486.98,z=-26.83,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-6423.99,y=-3497.02,z=-27.11,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-6413.19,y=-3493.14,z=-27.25,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-6403.16,y=-3489.4,z=-27.56,     weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-6398.45,y=-3479.18,z=-27.42,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-6392.48,y=-3471.25,z=-27.72,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-6394.6,y=-3460.71,z=-27.23,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-6389.42,y=-3455.52,z=-26.86,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-6382.97,y=-3450.7,z=-26.26,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-5312.05,y=-3917.0,z=-3.92,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-5327.02,y=-3921.48,z=-4.08,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-5334.62,y=-3916.49,z=-4.27,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-5342.17,y=-3908.12,z=-4.8,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-5339.12,y=-3896.06,z=-5.06,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-5336.89,y=-3889.0,z=-5.14,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-5329.86,y=-3885.74,z=-4.44,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-5338.97,y=-3908.22,z=-4.7,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-5331.6,y=-3916.72,z=-4.21,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-5325.84,y=-3922.91,z=-4.08,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-5318.76,y=-3927.97,z=-3.93,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-4702.1,y=-3412.62,z=13.65,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-4694.71,y=-3403.39,z=15.62,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-4686.85,y=-3401.06,z=15.94,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-4689.46,y=-3423.47,z=17.51,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-4697.5,y=-3428.99,z=16.35,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-4704.82,y=-3434.45,z=16.48,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-4717.6,y=-3430.49,z=12.24,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-4732.24,y=-3429.78,z=12.15,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-4736.99,y=-3423.3,z=12.72,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-4739.6,y=-3416.4,z=13.96,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-4741.44,y=-3408.22,z=14.99,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-4589.85,y=-2987.75,z=-17.03,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-4589.96,y=-2999.84,z=-15.69,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-4598.79,y=-3002.02,z=-15.39,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-4594.96,y=-3017.38,z=-7.83,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-4583.96,y=-3018.39,z=-7.89,   weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-4580.31,y=-3021.97,z=-7.7,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-4572.07,y=-3016.91,z=-10.54,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-4567.72,y=-3008.54,z=-13.61,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-4564.52,y=-3002.27,z=-15.05,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-4560.26,y=-2993.9,z=-16.89,  weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-4554.35,y=-2982.34,z=-17.04,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-5425.28,y=-2406.12,z=-4.53,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-5425.54,y=-2418.2,z=-3.45,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-5432.64,y=-2420.1,z=-1.89,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-5440.27,y=-2422.15,z=-1.76,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-5429.87,y=-2425.25,z=-2.06,  weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-5421.88,y=-2420.47,z=-2.72, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-5413.74,y=-2416.44,z=-3.04,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-5407.55,y=-2409.97,z=-3.95,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-5403.78,y=-2402.7,z=-4.29,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-5398.73,y=-2395.06,z=-4.73, weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-5394.83,y=-2384.93,z=-4.84,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
    },

    snow = { 
        {
            coords = {x=-1308.17,y=2205.04,z=307.39,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-1300.43,y=2197.61,z=310.4,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1293.34,y=2200.43,z=312.38,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1292.28,y=2207.66,z=311.27,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1296.44,y=2212.04,z=308.22,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1300.81,y=2214.04,z=306.41,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1307.25,y=2214.61,z=305.85,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1312.91,y=2215.56,z=305.82,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1319.66,y=2216.71,z=306.6,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1324.24,y=2212.53,z=307.62,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1328.0,y=2210.48,z=309.16,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1212.18,y=2402.13,z=309.07,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-1210.12,y=2409.66,z=309.58,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1206.44,y=2416.09,z=310.77,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1200.15,y=2412.37,z=311.38,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1198.32,y=2405.14,z=312.09,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1201.37,y=2399.51,z=312.3,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1206.99,y=2393.06,z=311.02,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1216.41,y=2389.72,z=308.0,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1225.57,y=2389.18,z=309.87,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1229.29,y=2394.32,z=310.69,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1230.87,y=2404.88,z=310.0,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-870.44,y=2720.6,z=336.26,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-864.19,y=2726.72,z=337.13,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-857.61,y=2728.06,z=337.86,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-850.46,y=2731.11,z=338.68,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-848.73,y=2726.02,z=339.28,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-847.96,y=2720.85,z=338.67,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-848.37,y=2712.67,z=337.77,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-856.54,y=2705.53,z=336.69,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-862.47,y=2709.5,z=336.9,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-873.4,y=2716.05,z=336.0,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-877.8,y=2722.97,z=337.23, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1916.97,y=1945.89,z=253.2,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-1920.19,y=1939.57,z=251.75,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1928.23,y=1936.05,z=251.83,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1935.16,y=1931.97,z=252.27,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1938.49,y=1926.49,z=252.86,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1936.17,y=1919.53,z=253.17,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1930.97,y=1914.0,z=252.86,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1924.48,y=1912.71,z=251.91,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1918.57,y=1908.96,z=251.4,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1912.95,y=1907.14,z=249.62,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1905.96,y=1907.26,z=246.07,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1096.92,y=1525.69,z=268.65,},
            reward = math.random(25,50), 
            itemreward = {{name = "hemp_seed",label = "hemp seed",count = 5}},
            enemies = {
                { x=-1106.34,y=1526.99,z=271.75,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1113.29,y=1524.57,z=275.61,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1110.39,y=1517.26,z=276.46,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1104.64,y=1513.47,z=276.37,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1095.67,y=1512.73,z=273.69,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1089.07,y=1513.71,z=270.85,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1083.12,y=1517.0,z=267.19,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1076.8,y=1516.69,z=265.41,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1071.24,y=1515.36,z=264.66,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1062.91,y=1520.55,z=260.76,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
    },
}

Config.deliverymissions = {
    val = { 
        {
            coords = {x=-346.59,y=-379.25,z=86.33,},
            enemies = {
                { x=-358.47,y=-370.98,z=85.81,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-362.8,y=-356.71,z=87.05,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-358.65,y=-344.63,z=87.9,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-350.88,y=-336.88,z=88.28,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-342.43,y=-332.38,z=88.9,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-336.76,y=-334.74,z=89.01,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-366.18,y=-355.59,z=87.18,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-369.45,y=-368.96,z=86.68,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-373.88,y=-380.84,z=85.4,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-368.07,y=-386.7,z=84.97,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=606.05,y=1684.11,z=187.27,},
            enemies = {
                { x=602.0,y=1695.78,z=187.19,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=600.48,y=1702.68,z=187.14,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=590.51,y=1705.54,z=187.52,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=587.86,y=1708.83,z=187.41,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=583.08,y=1713.23,z=187.52,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=568.45,y=1690.14,z=186.54,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=571.64,y=1671.39,z=186.93,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=578.21,y=1664.54,z=186.46,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=589.36,y=1663.87,z=186.65,   weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=598.03,y=1661.18,z=186.88, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=1062.47,y=1481.45,z=279.38,},
            enemies = {
                { x=1072.54,y=1488.89,z=281.6,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=1084.74,y=1487.38,z=281.2,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=1087.8,y=1478.85,z=277.11,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=1082.63,y=1473.31,z=275.79,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=1069.93,y=1474.55,z=277.37,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=1050.56,y=1472.24,z=275.44,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=1043.66,y=1480.76,z=278.52,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=1042.51,y=1489.07,z=281.76,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=1047.15,y=1493.97,z=283.15,   weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=1055.39,y=1497.1,z=284.74, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=241.35,y=-511.09,z=67.32,},
            enemies = {
                { x=238.81,y=-517.96,z=65.44,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=232.18,y=-520.36,z=64.69,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=222.21,y=-516.43,z=65.89,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=214.12,y=-510.22,z=67.84,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=208.85,y=-504.2,z=69.59,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=203.26,y=-497.98,z=71.44,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=198.05,y=-486.04,z=73.05,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=202.97,y=-480.64,z=75.29,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=208.12,y=-483.42,z=73.87,   weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=211.27,y=-478.43,z=75.26, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=499.5,y=1225.5,z=181.06,},
            enemies = {
                { x=508.8,y=1234.5,z=182.55,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=522.89,y=1231.74,z=182.86,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=524.68,y=1220.53,z=183.28,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=520.74,y=1211.61,z=181.94,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=515.49,y=1201.11,z=181.11,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=507.92,y=1197.25,z=180.91,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=496.86,y=1199.15,z=180.21,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=488.66,y=1202.14,z=179.97,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=475.53,y=1205.76,z=179.47,   weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=467.13,y=1212.29,z=179.46, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        
    },
    sd = { 
        {
            coords = {x=2601.53,y=-449.5,z=42.52,},
            enemies = {
                { x=2606.71,y=-443.52,z=42.35,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=2614.73,y=-438.4,z=41.98,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=2623.31,y=-442.34,z=42.51,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=2625.81,y=-451.11,z=42.46,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=2621.56,y=-461.6,z=42.16,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=2614.51,y=-473.22,z=41.46,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=2607.63,y=-479.29,z=41.29,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=2601.7,y=-475.39,z=41.85,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=2599.31,y=-467.13,z=42.29,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=2579.46,y=-467.32,z=42.61,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=1996.49,y=-462.58,z=41.66,},
            enemies = {
                { x=2013.52,y=-469.48,z=42.18,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=2017.96,y=-462.73,z=42.38,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=2022.26,y=-454.76,z=42.62,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=2022.71,y=-449.56,z=42.73,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=2029.37,y=-443.69,z=42.75,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=2022.9,y=-433.92,z=42.5,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=2012.74,y=-432.53,z=41.65,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=2003.61,y=-434.27,z=41.52,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=2000.13,y=-440.58,z=41.67,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=1998.66,y=-449.8,z=41.8,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=1631.35,y=-526.68,z=49.71,},
            enemies = {
                { x=1619.79,y=-524.86,z=50.91,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=1615.97,y=-516.27,z=51.02,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=1616.24,y=-506.18,z=51.27,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=1621.99,y=-498.46,z=51.86,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=1629.78,y=-497.41,z=50.28,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=1640.49,y=-493.06,z=47.58,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=1648.77,y=-490.8,z=48.32,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=1657.04,y=-494.08,z=47.46,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=1664.41,y=-498.37,z=47.09,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=1668.38,y=-505.38,z=46.59,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=1945.25,y=-993.67,z=42.82,},
            enemies = {
                { x=1955.67,y=-999.08,z=43.32,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=1964.83,y=-994.46,z=43.54,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=1971.23,y=-990.86,z=43.83,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=1970.69,y=-1000.13,z=43.47,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=1968.12,y=-1008.98,z=43.68,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=1962.34,y=-1017.19,z=43.42,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=1955.71,y=-1022.84,z=42.96,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=1948.69,y=-1031.71,z=42.96,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=1942.27,y=-1034.4,z=43.39,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=1932.58,y=-1037.19,z=42.93,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=2019.38,y=-1650.61,z=41.86,},
            enemies = {
                { x=2018.59,y=-1641.74,z=41.2,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=2024.85,y=-1636.35,z=41.79,   weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=2033.17,y=-1638.0,z=42.0,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=2040.62,y=-1643.62,z=41.92,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=2038.31,y=-1653.73,z=42.11,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=2038.54,y=-1662.73,z=42.1,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=2007.17,y=-1662.58,z=41.69,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=2000.62,y=-1668.94,z=41.84,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=2006.61,y=-1677.16,z=41.92,   weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=2012.93,y=-1677.92,z=42.6,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
    },
    arma = { 
        {
            coords = {x=-3965.97,y=-2342.41,z=-7.79,},
            enemies = {
                { x=-3970.47,y=-2331.86,z=-7.69,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-3977.82,y=-2328.41,z=-7.13,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-3985.26,y=-2335.07,z=-7.39,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-3987.16,y=-2341.76,z=-7.58,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-3981.88,y=-2348.72,z=-7.58,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-3972.59,y=-2350.26,z=-7.59,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-3967.28,y=-2358.09,z=-7.56,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-3960.15,y=-2361.11,z=-7.99,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-3954.63,y=-2359.26,z=-8.14,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-3947.57,y=-2354.1,z=-8.77,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-2577.11,y=-2647.11,z=74.32,},
            enemies = {
                { x=-2579.15,y=-2639.59,z=74.64,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-2584.22,y=-2636.4,z=74.8,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-2599.32,y=-2641.95,z=74.27,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-2599.84,y=-2649.63,z=73.78,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-2598.41,y=-2659.25,z=73.65,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-2592.19,y=-2666.23,z=74.01,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-2584.98,y=-2668.98,z=73.91,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-2577.49,y=-2668.99,z=73.49,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-2568.11,y=-2667.71,z=73.45,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-2559.71,y=-2664.25,z=74.27,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-2085.4,y=-2700.23,z=69.1,},
            enemies = {
                { x=-2075.23,y=-2703.39,z=69.34,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-2079.01,y=-2718.05,z=69.56,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-2086.27,y=-2722.04,z=70.18,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-2093.84,y=-2723.99,z=70.22,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-2099.87,y=-2724.91,z=70.19,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-2095.71,y=-2733.27,z=71.14,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-2089.02,y=-2740.19,z=71.24,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-2081.1,y=-2741.8,z=71.08,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-2073.86,y=-2741.94,z=70.74,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-2068.57,y=-2734.32,z=70.32,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1519.38,y=-2358.16,z=44.05,},
            enemies = {
                { x=-1525.41,y=-2364.54,z=44.11,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1525.61,y=-2375.13,z=45.12,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1517.05,y=-2380.2,z=45.38,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1507.94,y=-2378.88,z=45.13,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1497.93,y=-2378.39,z=44.74,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1493.46,y=-2371.6,z=44.7,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1490.77,y=-2362.3,z=43.29,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1489.97,y=-2355.25,z=43.75,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1494.01,y=-2342.38,z=43.58,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1502.9,y=-2335.18,z=43.66,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-3904.02,y=-3290.97,z=18.44,},
            enemies = {
                { x=-3914.03,y=-3295.88,z=19.46,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-3920.83,y=-3292.75,z=19.37,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-3926.72,y=-3296.09,z=19.66,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-3937.65,y=-3289.45,z=19.63,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-3938.52,y=-3279.53,z=19.34,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-3935.75,y=-3269.72,z=18.5,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-3933.18,y=-3260.47,z=17.59,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-3928.54,y=-3250.15,z=17.66,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-3920.14,y=-3252.09,z=18.5,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-3913.69,y=-3259.23,z=18.85,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
    },
    bw = { 
        {
            coords = {x=-1221.68,y=-1835.43,z=60.24,},
            enemies = {
                { x=-1202.28,y=-1816.29,z=62.41,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1208.29,y=-1807.73,z=62.55,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1215.95,y=-1806.15,z=61.66,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1224.58,y=-1806.81,z=61.98,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1232.4,y=-1811.61,z=62.24,     weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1235.03,y=-1820.55,z=61.06,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1233.8,y=-1828.34,z=60.34,       weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1225.77,y=-1835.83,z=60.31,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1216.28,y=-1838.41,z=60.52,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1204.35,y=-1839.26,z=60.67,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1530.25,y=-1800.09,z=73.73,},
            enemies = {
                { x=-1528.39,y=-1790.59,z=74.97,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1524.89,y=-1785.75,z=75.53,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1522.11,y=-1781.39,z=76.23,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1522.48,y=-1775.85,z=76.92,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1527.35,y=-1772.39,z=77.05,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1535.71,y=-1769.79,z=76.9,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1544.11,y=-1768.34,z=76.63,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1552.86,y=-1770.38,z=76.18,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1559.15,y=-1772.77,z=76.4,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1561.55,y=-1778.21,z=76.32,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1990.21,y=-1478.88,z=113.14,},
            enemies = {
                { x=-1987.52,y=-1487.77,z=114.02,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1979.64,y=-1487.88,z=116.45,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1970.82,y=-1481.32,z=114.18,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1971.83,y=-1470.9,z=112.13,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1980.33,y=-1461.83,z=111.28,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1989.01,y=-1459.87,z=112.36,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-2008.67,y=-1465.51,z=114.82,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-2011.48,y=-1474.89,z=115.95,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-2014.11,y=-1481.49,z=118.62,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-2003.44,y=-1483.4,z=114.04,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1904.18,y=-1827.99,z=111.87,},
            enemies = {
                { x=-1894.75,y=-1831.17,z=110.69,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1887.54,y=-1837.82,z=109.31,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1881.47,y=-1829.71,z=111.64,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1886.78,y=-1813.63,z=114.82,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1898.51,y=-1805.52,z=115.37,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1915.39,y=-1810.0,z=116.53,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1921.85,y=-1815.72,z=116.42,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1928.35,y=-1822.39,z=115.88,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1930.44,y=-1828.56,z=114.51,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1924.55,y=-1832.53,z=112.75,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1610.17,y=-973.19,z=80.83,},
            enemies = {
                { x=-1614.62,y=-980.79,z=78.37,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1620.72,y=-987.17,z=78.84,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1619.12,y=-996.77,z=76.54,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1603.09,y=-1006.62,z=72.73,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1593.44,y=-1003.97,z=72.52,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1590.13,y=-997.31,z=75.38,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1586.98,y=-989.12,z=78.76,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1579.64,y=-985.0,z=81.24,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1572.36,y=-987.97,z=81.87,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1579.66,y=-993.53,z=78.1,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
    },
    rhodes = { 
        {
            coords = {x=938.08,y=-1231.0,z=54.5,},
            enemies = {
                { x=941.55,y=-1242.33,z=54.88,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=945.14,y=-1251.73,z=54.95,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=951.63,y=-1258.33,z=54.89,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=969.39,y=-1254.09,z=54.73,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=969.84,y=-1246.23,z=55.61,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=964.64,y=-1238.16,z=56.13,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=957.78,y=-1229.82,z=55.92,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=948.35,y=-1221.8,z=55.14,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=942.36,y=-1219.88,z=54.28,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=938.28,y=-1213.71,z=53.98,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=1102.75,y=-623.58,z=91.71,},
            enemies = {
                { x=1093.92,y=-629.74,z=94.7,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=1089.15,y=-637.33,z=97.48,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=1086.28,y=-645.29,z=99.05,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=1091.9,y=-652.18,z=99.81,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=1091.83,y=-657.68,z=102.79,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=1096.84,y=-656.92,z=101.17,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=1101.52,y=-655.49,z=99.7,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=1106.27,y=-654.9,z=97.62,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=1110.48,y=-653.53,z=95.76,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=1126.36,y=-661.95,z=89.61,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=1713.14,y=-1555.6,z=49.33,},
            enemies = {
                { x=1720.23,y=-1563.93,z=49.44,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=1728.68,y=-1562.49,z=49.36,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=1732.91,y=-1554.38,z=48.82,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=1731.82,y=-1548.73,z=48.84,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=1727.43,y=-1543.16,z=49.02,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=1712.67,y=-1533.85,z=49.88,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=1704.81,y=-1532.05,z=50.87,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=1696.61,y=-1532.38,z=51.33,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=1690.27,y=-1533.84,z=51.45,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=1684.92,y=-1540.5,z=52.18,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=938.08,y=-1231.0,z=54.5,},
            enemies = {
                { x=941.55,y=-1242.33,z=54.88,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=945.14,y=-1251.73,z=54.95,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=951.63,y=-1258.33,z=54.89,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=969.39,y=-1254.09,z=54.73,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=969.84,y=-1246.23,z=55.61,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=964.64,y=-1238.16,z=56.13,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=957.78,y=-1229.82,z=55.92,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=948.35,y=-1221.8,z=55.14,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=942.36,y=-1219.88,z=54.28,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=938.28,y=-1213.71,z=53.98,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=1644.13,y=-504.03,z=47.25,},
            enemies = {
                { x=1633.37,y=-507.44,z=48.71,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=1626.31,y=-513.44,z=49.78,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=1626.2,y=-519.7,z=50.13,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=1630.14,y=-521.5,z=49.84,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=1631.67,y=-513.67,z=49.42,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=1644.0,y=-507.01,z=47.62,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=1650.88,y=-502.31,z=47.39,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=1657.25,y=-499.41,z=47.13,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=1664.12,y=-499.57,z=47.06,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=1669.41,y=-505.26,z=46.44,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        
    },
    annes = { 
        {
            coords = {x=2739.91,y=212.22,z=53.26,},
            enemies = {
                { x=2742.27,y=201.82,z=53.33,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=2742.05,y=193.33,z=52.81,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=2737.23,y=186.99,z=51.88,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=2737.29,y=180.06,z=52.08,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=2721.49,y=176.5,z=52.01,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=2714.37,y=184.74,z=52.29,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=2715.67,y=193.57,z=52.95,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=2716.29,y=201.59,z=52.84,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=2721.11,y=208.09,z=53.22,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=2733.42,y=217.56,z=52.85,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=2596.17,y=565.83,z=76.64,},
            enemies = {
                { x=2595.83,y=547.69,z=75.43,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=2590.33,y=542.33,z=73.1,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=2594.23,y=534.96,z=74.66,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=2599.86,y=532.52,z=76.78,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=2602.95,y=539.17,z=78.05,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=2599.3,y=548.73,z=76.44,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=2594.34,y=560.68,z=75.44,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=2587.97,y=565.26,z=74.12,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=2580.39,y=562.44,z=73.4,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=2569.68,y=557.17,z=71.85,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },
        },
        {
            coords = {x=3110.36,y=1574.37,z=52.81,},
            enemies = {
                { x=3127.81,y=1569.84,z=55.44,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=3118.9,y=1552.82,z=53.23,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=3098.63,y=1559.9,z=58.94,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=3088.12,y=1566.93,z=57.83,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=3081.34,y=1576.47,z=58.38,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=3082.64,y=1589.99,z=53.8,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=3089.61,y=1584.59,z=52.25,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=3099.89,y=1576.34,z=52.4,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=3110.59,y=1569.66,z=52.94,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=3118.34,y=1562.62,z=53.26,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },
        },
        {
            coords = {x=2074.82,y=602.69,z=141.02,},
            enemies = {
                { x=2072.86,y=613.89,z=142.89,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=2084.73,y=620.3,z=140.54,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=2094.99,y=611.68,z=136.36,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=2086.41,y=601.68,z=137.35,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=2075.84,y=591.28,z=138.01,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=2066.96,y=591.6,z=142.23,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=2059.65,y=595.6,z=145.96,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=2050.56,y=598.0,z=150.01,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=2048.32,y=610.33,z=152.08,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=2050.6,y=618.15,z=151.65,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },
        },
        {
            coords = {x=2350.23,y=1842.49,z=125.92,},
            enemies = {
                { x=2362.5,y=1841.16,z=122.4,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=2368.91,y=1848.02,z=121.32,   weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=2376.47,y=1851.47,z=119.28,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=2381.44,y=1858.52,z=120.59,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=2384.4,y=1850.73,z=117.88,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=2371.74,y=1847.47,z=120.49,   weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=2362.79,y=1845.25,z=123.32,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=2354.8,y=1843.33,z=125.83,  weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=2343.19,y=1840.78,z=126.66,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=2333.98,y=1839.92,z=126.49,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },
        },
        
        
    },
    straw = { 
        {
            coords = {x=-1835.38,y=-772.05,z=105.32,},
            enemies = {
                { x=-1813.37,y=-780.5,z=112.72,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1815.51,y=-767.09,z=116.14,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1817.11,y=-762.41,z=116.04,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1816.27,y=-756.11,z=116.06,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1825.09,y=-754.87,z=109.22,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1834.04,y=-754.7,z=108.31,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1839.74,y=-758.65,z=107.65,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1847.44,y=-766.08,z=106.46,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1845.03,y=-774.38,z=106.21,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1841.36,y=-784.28,z=106.11,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-964.9,y=-729.49,z=61.76,},
            enemies = {
                { x=-956.89,y=-727.64,z=61.99,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-947.92,y=-726.27,z=62.91,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-944.64,y=-717.6,z=64.24,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-947.26,y=-711.89,z=64.99,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-952.74,y=-705.8,z=65.64,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-958.74,y=-700.16,z=65.94,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-966.76,y=-699.08,z=66.18,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-975.58,y=-699.64,z=65.49,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-983.71,y=-704.74,z=64.23,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-990.09,y=-711.71,z=63.89,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-964.9,y=-729.49,z=61.76,},
            enemies = {
                { x=-956.89,y=-727.64,z=61.99,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-947.92,y=-726.27,z=62.91,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-944.64,y=-717.6,z=64.24,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-947.26,y=-711.89,z=64.99,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-952.74,y=-705.8,z=65.64,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-958.74,y=-700.16,z=65.94,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-966.76,y=-699.08,z=66.18,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-975.58,y=-699.64,z=65.49,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-983.71,y=-704.74,z=64.23,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-990.09,y=-711.71,z=63.89,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-852.96,y=-124.58,z=70.27,},
            enemies = {
                { x=-847.13,y=-131.79,z=70.83,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-843.28,y=-139.41,z=71.91,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-839.51,y=-144.79,z=72.83,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-832.24,y=-144.39,z=73.84,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-824.66,y=-140.65,z=74.79,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-825.16,y=-130.91,z=73.07,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-827.48,y=-122.45,z=72.44,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-856.99,y=-128.99,z=70.0,    weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-864.75,y=-125.43,z=69.25,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-879.79,y=-132.15,z=67.09,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-2434.95,y=-294.97,z=153.14,},
            enemies = {
                { x=-2421.64,y=-281.62,z=157.25,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-2427.92,y=-276.26,z=161.03,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-2437.34,y=-275.43,z=162.25,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-2445.08,y=-278.05,z=161.89,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-2449.76,y=-280.9,z=162.03,  weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-2419.84,y=-298.1,z=153.92,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-2433.04,y=-299.58,z=153.43,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-2439.88,y=-300.14,z=153.15,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-2448.31,y=-301.72,z=152.6,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-2458.68,y=-303.34,z=152.9,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        
    },
    
    tw = { 
        {
            coords = {x=-5057.72,y=-3154.3,z=-18.32,},
            enemies = {
                { x=-5051.11,y=-3147.86,z=-17.36,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-5043.54,y=-3150.84,z=-15.5,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-5041.72,y=-3160.39,z=-13.58,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-5053.74,y=-3161.36,z=-16.35,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-5064.44,y=-3169.0,z=-14.11, weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-5050.26,y=-3148.45,z=-17.14,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-5055.54,y=-3144.26,z=-18.59,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-5064.31,y=-3137.92,z=-19.83,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-5078.21,y=-3134.49,z=-19.71,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-5083.28,y=-3128.95,z=-18.66,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-4853.26,y=-3726.06,z=11.74,},
            enemies = {
                { x=-4844.29,y=-3726.63,z=12.2,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-4839.26,y=-3732.65,z=12.52,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-4837.8,y=-3739.21,z=11.89,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-4840.65,y=-3745.13,z=11.61,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-4847.62,y=-3751.23,z=11.28,weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-4853.73,y=-3742.79,z=12.48,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-4854.97,y=-3734.75,z=12.47,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-4856.37,y=-3728.31,z=12.11,   weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-4854.63,y=-3716.5,z=11.23,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-4857.76,y=-3708.53,z=10.74,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-5672.15,y=-3592.56,z=-21.14,},
            enemies = {
                { x=-5662.4,y=-3594.03,z=-21.18,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-5660.32,y=-3603.88,z=-21.08,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-5667.13,y=-3609.38,z=-21.22,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-5675.04,y=-3608.28,z=-21.39,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-5684.04,y=-3607.84,z=-21.65,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-5692.76,y=-3600.35,z=-21.98,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-5695.0,y=-3593.06,z=-22.07,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-5692.84,y=-3584.19,z=-22.15,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-5685.21,y=-3578.44,z=-22.24,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-5676.48,y=-3573.58,z=-22.65,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-4478.62,y=-2727.44,z=-11.6,},
            enemies = {
                { x=-4492.78,y=-2731.51,z=-12.12,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-4496.74,y=-2739.61,z=-12.1,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-4490.65,y=-2745.89,z=-12.24,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-4484.78,y=-2750.75,z=-12.56,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-4477.52,y=-2755.45,z=-13.11,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-4470.11,y=-2752.24,z=-13.15,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-4463.3,y=-2749.6,z=-13.19,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-4450.48,y=-2747.72,z=-13.48,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-4447.48,y=-2742.12,z=-13.1,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-4447.82,y=-2733.34,z=-12.42,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-5090.87,y=-2460.45,z=-9.69,},
            enemies = {
                { x=-5104.11,y=-2454.8,z=-7.6,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-5113.96,y=-2446.68,z=-2.16,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-5120.25,y=-2450.74,z=-2.2,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-5123.71,y=-2457.42,z=-2.89,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-5119.35,y=-2464.3,z=-5.8,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-5113.88,y=-2468.37,z=-7.7,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-5105.23,y=-2472.36,z=-9.32,   weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-5097.57,y=-2474.51,z=-10.15,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-5082.52,y=-2478.52,z=-10.52,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-5074.74,y=-2478.28,z=-10.27,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
    },
    snow = { 
        {
            coords = {x=-856.59,y=1410.41,z=231.41,},
            enemies = {
                { x=-864.45,y=1412.15,z=232.75,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-870.82,y=1411.53,z=233.45,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-874.23,y=1415.31,z=234.01,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-868.78,y=1425.25,z=234.6,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-861.86,y=1431.71,z=233.7,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-849.77,y=1435.73,z=234.21,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-843.52,y=1436.67,z=235.96,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-835.74,y=1439.59,z=238.35,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-827.87,y=1437.14,z=239.66,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-819.44,y=1432.85,z=241.27,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-393.12,y=1603.75,z=201.92,},
            enemies = {
                { x=-400.54,y=1601.34,z=203.76,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-402.65,y=1594.98,z=203.23,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-405.91,y=1589.3,z=203.09,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-403.33,y=1583.21,z=200.33,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-401.79,y=1576.85,z=196.67,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-395.66,y=1573.73,z=194.66,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-381.02,y=1577.57,z=194.28,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-377.74,y=1585.44,z=195.5,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-375.11,y=1591.84,z=196.13,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-377.29,y=1598.97,z=197.8,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1410.81,y=1872.16,z=306.37,},
            enemies = {
                { x=-1416.59,y=1868.74,z=308.69,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1422.98,y=1868.67,z=311.12,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1425.62,y=1876.15,z=311.85,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1422.92,y=1881.1,z=312.58,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1420.68,y=1886.36,z=312.8,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1417.05,y=1891.24,z=311.67,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1412.49,y=1895.38,z=310.29,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1406.72,y=1898.2,z=309.92,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1399.74,y=1900.06,z=311.72,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1393.47,y=1901.15,z=312.53,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-818.96,y=2725.23,z=338.97,},
            enemies = {
                { x=-812.27,y=2721.99,z=340.68,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-814.8,y=2714.85,z=341.12,      weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-817.61,y=2709.94,z=341.83,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-821.5,y=2706.73,z=341.63,     weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-827.06,y=2702.64,z=341.12,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-830.6,y=2700.5,z=339.96,      weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-834.04,y=2702.03,z=339.0,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-836.21,y=2705.63,z=339.06,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-837.87,y=2712.68,z=338.59,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-844.43,y=2715.12,z=337.83,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
        {
            coords = {x=-1608.57,y=2260.64,z=295.92,},
            enemies = {
                { x=-1614.47,y=2262.89,z=296.96,     weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = 0},
                { x=-1619.69,y=2263.27,z=297.57,     weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = 0},
                { x=-1618.91,y=2268.91,z=299.21,      weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = 0},
                { x=-1615.65,y=2274.62,z=301.64,    weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = 0},
                { x=-1610.45,y=2277.1,z=302.6,   weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = 0},
                { x=-1604.92,y=2274.94,z=302.05,    weapon = `WEAPON_SHOTGUN_DOUBLEBARREL`, model = "g_m_m_unibanditos_01",horse = `a_c_horse_gypsycob_palominoblagdon`},
                { x=-1601.8,y=2270.25,z=300.27,    weapon = `WEAPON_REPEATER_CARBINE`, model = "g_m_m_bountyhunters_01",horse = `A_C_Horse_MissouriFoxTrotter_AmberChampagne`},
                { x=-1597.98,y=2266.22,z=298.77,     weapon = `WEAPON_RIFLE_BOLTACTION`, model = "re_street_fight_males_01",horse = `A_C_Horse_Mustang_GrulloDun`},
                { x=-1594.17,y=2260.85,z=296.7,      weapon = `weapon_shotgun_repeating`, model = "U_M_M_BHT_ODRISCOLLSLEEPING",horse = `A_C_Horse_Shire_LightGrey`},
                { x=-1595.27,y=2253.43,z=293.99,    weapon = `weapon_sniperrifle_carcano`, model = "U_M_M_BHT_ODRISCOLLDRUNK",horse = `A_C_Horse_Turkoman_Gold`},

            },

        },
    },
}
