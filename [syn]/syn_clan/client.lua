local prompts = GetRandomIntInRange(0, 0xffffff)
local prompts2 = GetRandomIntInRange(0, 0xffffff)
local prompts3 = GetRandomIntInRange(0, 0xffffff)
local prompts4 = GetRandomIntInRange(0, 0xffffff)
local prompts5 = GetRandomIntInRange(0, 0xffffff)
local prompts6 = GetRandomIntInRange(0, 0xffffff)
local prompts7 = GetRandomIntInRange(0, 0xffffff)
local prompts8 = GetRandomIntInRange(0, 0xffffff)
local prompts9 = GetRandomIntInRange(0, 0xffffff)
local prompts10 = GetRandomIntInRange(0, 0xffffff)
local prompts11 = GetRandomIntInRange(0, 0xffffff)
local prompts12 = GetRandomIntInRange(0, 0xffffff)
local deliversupplies
local sellanimal
local cleanself
local getbeer
local stashanimalprompt
local checkstash
local camps = {}
local renderedobjects = {}
local claninvites = {}
local charid 
local clanid
local status = "" 
local openmenu
local render = {}
local inmenu = false 
local activeclanid
local blip 
local isrelocating = false 
local movedpiece = {}
local ismoving = false 
local shadowobject 
local xx,yy,zz,hh = 0.0,0.0,0.0,0.0
local increment = 1.0
local globalclanid      
local renderedclanid = 0 
local openinv 
local outofbounds = false 
local outofbounds2 = false 
local openchanging
local playerclothes 
local playerskin
local openstable
local playerhorses
local playerwagons
local callwagonprompt
local itemSet  = CreateItemset(true)
local callwagon = false 
local volumeArea = Citizen.InvokeNative(0xB3FB80A32BAE3065, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0,3.0, 3.0) 
local closewagon
local drinkcount = 0
local lasteffect 
local stashinganimal = false 
local wagoninfo
local inwagonmenu = false 
local wagonserverid
local openstew 
local trapperprompt
local donateprompt
local lastskinnedoutfit
local lastskinnedmodel
local lastskinnedanimalinfo
local skinnedanimals = {}
local bliparea = {}
local tempblip = {}
local camplocations = {}
local activemenu 
local butcherblips = {}
local renderednpc = {}
local sellinganimal = false 
local peltsonhorse = {}
local poisoned = false 
local ticker = 0
local effectapplied = false 
local waitingforinfo = false 
local allllow = true 
local supplymissionactivewagons = {}
local supplycooldown = false 
local checking = false 
local locational = {}
local campsinfo = {}
local missionblip
local supplymissionactive = false 
local locationreached = false 
local enemiesspawned = false
local supplymission = {}
local enemies = {}

local missionlength
local missionstockcount 
local spawnmissionwagon = false 
local ondeliverymission = false 
local deliverywagonsactive = {}
local deliverycooldown = false 
local deliverymissionrender = false 
local locationreached2 = false 
local missionwagonnetwork
local deliverywagonthatreached
local enemyhorses = {}
local checkingformissions = false 
local missiontables = {}
local occupiedregion 
local occupiedrandom
local selectedregion
local beingraided = false 
local Reload =false
----------------------------------------------Embeded Functions BOOKMARK
function GetClosestveh(coords)
    local vehiclesToDraw = {}
    if volumeArea then 
        Citizen.InvokeNative(0x541B8576615C33DE, volumeArea, coords.x, coords.y, coords.z) -- SET_VOLUME_COORDS
        local itemsFound = Citizen.InvokeNative(0x886171A12F400B89, volumeArea, itemSet, 2) -- Get volume items into itemset
        if itemsFound then
            n = 0
            while n < itemsFound do
                vehiclesToDraw[(GetIndexedItemInItemset(n, itemSet))] = true
                n = n + 1
            end
        end
        Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet)
        for k,v in pairs(vehiclesToDraw) do 
            Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet)
            return k
        end
        
    end
    if IsItemsetValid(itemSet) then
        Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet)
    end
end
function spawnwagon(clanid)
    DoScreenFadeOut(500)
	while IsScreenFadingOut() do
	  Wait(0)
	end
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local wagon = -1698498246
    RequestModel(wagon)
    while not HasModelLoaded(wagon) do
        Citizen.Wait(0)
    end
    local wagon = CreateVehicle(wagon, coords.x + 1, coords.y + 1, coords.z, GetEntityHeading(player), true, true)
    SetVehicleOnGroundProperly(wagon)
    Wait(200)
    SetPedIntoVehicle(player, wagon, -1)
    SetModelAsNoLongerNeeded(wagon) 
    local network = NetworkGetNetworkIdFromEntity(wagon)

    if not Citizen.InvokeNative(0xD798DF5DB67B1659, wagon) then 
        Citizen.InvokeNative(0x75F90E4051CC084C, wagon, GetHashKey("pg_mp005_huntingWagonTarp01"))
        Citizen.InvokeNative(0x31F343383F19C987, wagon, 0.0, true)
    else
        Citizen.InvokeNative(0x31F343383F19C987, wagon, 0.0, true)
    end
    DoScreenFadeIn(1000)
    while IsScreenFadingIn() do
        Wait(0)
    end
end
function eatstew()
    local bowl = CreateObject("p_bowl04x_stew", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
    local spoon = CreateObject("p_spoon01x", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    TaskItemInteraction_2(PlayerPedId(), 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 1, 0, -1.0)
    TaskItemInteraction_2(PlayerPedId(), 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 1, 0, -1.0)
    Citizen.InvokeNative(0xB35370D5353995CB, PlayerPedId(), -583731576, 1.0)
end
function closemenu()
    if inmenu then 
        MenuData.CloseAll()
        inmenu = false 
        FreezeEntityPosition(PlayerPedId(),false)
	    ClearPedTasks(PlayerPedId())
        local idtosend 
        if renderedclanid ~= nil then 
            idtosend = renderedclanid
        elseif activeclanid ~= nil then 
            idtosend = activeclanid
        elseif globalclanid ~= nil then 
            idtosend = globalclanid
        end
        TriggerServerEvent("syn_clan:activemenu",idtosend,false)
    end
    if inwagonmenu then 
        MenuData.CloseAll()
        FreezeEntityPosition(PlayerPedId(),false)
	    ClearPedTasks(PlayerPedId())
        inwagonmenu = false 
        TriggerServerEvent("syn_clan:switchwagonmenu",wagonserverid,inwagonmenu)
    end
end

function getclan()
    clanid = nil 
    TriggerServerEvent("syn_clan:getclanid")
    while clanid == nil do
        Wait(100)
    end
    local clanid2 = clanid
    return clanid2
end

function grass(prop)
    local ped = prop
    local ped_coords = GetEntityCoords(ped)
    local x,y,z = table.unpack(ped_coords)
    local forward_fix = 5
    local forwardX=GetEntityForwardX(ped)
    local forwardY=GetEntityForwardY(ped)
    local veg_modifier_coords_x = x+(forwardX*forward_fix)
    local veg_modifier_coords_y = y+(forwardY*forward_fix)
    local veg_modifier_coords_z = z
    local veg_radius = 3.0
    local veg_Flags =  1 + 2 + 4 + 8 + 16 + 32 + 64 + 128 + 256   -- implement to all debris, grass, bush, etc...
    local veg_ModType = 1 	-- 1 | VMT_Cull
    veg_modifier_sphere = Citizen.InvokeNative(0xFA50F79257745E74,veg_modifier_coords_x,veg_modifier_coords_y,veg_modifier_coords_z, veg_radius, veg_ModType, veg_Flags, 0);   -- ADD_VEG_MODIFIER_SPHERE
    return veg_modifier_sphere
end

function grass2(veg_modifier_sphere)
    Citizen.InvokeNative(0x9CF1836C03FB67A2,Citizen.PointerValueIntInitialized(veg_modifier_sphere), 0);    -- REMOVE_VEG_MODIFIER_SPHERE
end


local pokertables = {}

-- render logic of camp objects
function renderobj(k)
    if render[k] == nil then 
        render[k] = false 
    end
    if render[k] == false then
        renderedclanid = k
        render[k]  = true 
        waitingforinfo = true 
        TriggerServerEvent("syn_clan:addtonearcamp",renderedclanid)
        while waitingforinfo do 
            Wait(100)
        end
        local mapcoords = locational[k]
        if globalclanid ~= k then 
            local name = campsinfo[renderedclanid].info.name
            local colorindex = campsinfo[renderedclanid].info.bcolor
            local color = miscinfo.blipcolors[colorindex]
            RemoveBlip(tempblip[k])
            tempblip[k] = N_0x554d9d53f696d002(1664425300, mapcoords.x, mapcoords.y, mapcoords.z)
            SetBlipSprite(tempblip[k], Config.blip, 1)
            SetBlipScale(tempblip[k], 0.8)
            Citizen.InvokeNative(0x9CB1A1623062F402, tempblip[k], name)
            Citizen.InvokeNative(0x662D364ABF16DE2F,tempblip[k],GetHashKey(color))
        end
        RemoveBlip(bliparea[k])
        bliparea[k] = Citizen.InvokeNative(0x45f13b7e0a15c880,1673015813,mapcoords.x,mapcoords.y,mapcoords.z,Config.placementradius+0.0)
        for x,y in pairs(campsinfo[renderedclanid].info.furni) do 
            if y.active then
                local prop = y.prop
                local coords = y.coords 
                local object
                if y.cata == "prop" then  
                    local offset = 0.0
                    
                    object = CreateObject(prop, coords.x, coords.y, coords.z , false, false, true)
                    veg_modifier_sphere = grass(object)
                    SetEntityHeading(object,y.heading)
                    SetEntityAsMissionEntity(object)
                    if y.grounded then 
                        if prop == Config.clanflagprop then 
                            PlaceObjectOnGroundProperly(object)
                        else
                            PlaceObjectOnGroundProperly(object)
                            SetEntityCoords(object,coords.x, coords.y, coords.z)
                        end
                    end
                    FreezeEntityPosition(object, true)
                    if renderedobjects[k] == nil then 
                        renderedobjects[k] = {}
                    end
                elseif y.cata == "set" then 
                    Citizen.InvokeNative(0xF3DE57A46D5585E9,prop) -- REQUEST_PROPSET
                    local counter = 1
                    while not Citizen.InvokeNative(0x48A88FC684C55FDC,prop) and counter <= 20 do   -- HAS_PROPSET_LOADED
                      counter = counter + 1
                      Citizen.Wait(50)
                    end
                    if Citizen.InvokeNative(0x48A88FC684C55FDC,prop) then  -- HAS_PROPSET_LOADED
                        object = Citizen.InvokeNative(0x899C97A1CCE7D483,prop, coords.x, coords.y, coords.z, 0, 60.0, 1200.0, false, false)   -- CREATE_PROPSET_2
                    end
                    Citizen.InvokeNative(0xB1964A83B345B4AB, prop)
                    if prop == `pg_mg_poker` then 
                        if not containspoker(pokertables, tostring(k)) then 
                            table.insert(pokertables,tostring(k))
                            TriggerServerEvent('poker:set_table', 'add', tostring(k), {
                                vector = vector3(coords.x, coords.y, coords.z),
                                table  = 'p_tablepoker01x',
                                chairs = 'p_chair05x',
                                deck   = 'default',
                                offset = 0.5
                            })
                        end
                    end
                end
                table.insert(renderedobjects[k],{coords = coords, object = object,type = prop,cata = y.cata,veg_modifier_sphere = veg_modifier_sphere})
            end
        end
    end
end
-- logic to delete objects if rendered
function derenderobj(k)
    if render[k] == nil then 
        render[k] = false 
    end
    if render[k] == true then 
        RemoveBlip(bliparea[k])
        RemoveBlip(tempblip[k])
        TriggerServerEvent("syn_clan:removefromrender",renderedclanid)
        render[k] = false
        for x,y in pairs(renderedobjects[k]) do
            if y.cata == "prop" then 
                SetEntityAsMissionEntity(y.object)
                DeleteObject(y.object)
                grass2(y.veg_modifier_sphere)
            elseif y.cata == "set" then 
                Citizen.InvokeNative(0x58AC173A55D9D7B4,y.object,1,1)
            end
            --renderedobjects[k][x] = nil 
            table.remove(renderedobjects[k],x)
        end
        renderedclanid = 0
    end
end
function getinmenu()
    local idtosend 
    if renderedclanid ~= nil then 
        idtosend = renderedclanid
    elseif activeclanid ~= nil then 
        idtosend = activeclanid
    elseif globalclanid ~= nil then 
        idtosend = globalclanid
    end
    TriggerServerEvent("syn_clan:getinmenu",idtosend)
    while activemenu == nil do 
        Wait(100)
    end
    local activemenu2 = activemenu
    activemenu = nil 
    return activemenu2
end
-- render logic of npcs
function rendernpc(k)
    if renderednpc[k] == nil then 
        renderednpc[k] = {state = false,npc = nil} 
    end
    if renderednpc[k].state == false then
        renderednpc[k].state  = true 
        RequestModel(Config.npc[k].npcmodel)
        while not HasModelLoaded(Config.npc[k].npcmodel) do                
            Wait(100)
        end
        local npc = CreatePed(Config.npc[k].npcmodel, Config.npc[k].coords.x, Config.npc[k].coords.y, Config.npc[k].coords.z, Config.npc[k].coords.h, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
        Citizen.InvokeNative(0xA91E6CF94404E8C9,npc)
        if Config.npc[k].grounded then 
            local height = 100
            local foundground, groundZ, normal  = GetGroundZAndNormalFor_3dCoord(Config.npc[k].coords.x, Config.npc[k].coords.y, height + 0.0)
            while not foundground do 
            	height = height + 10
            	foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(Config.npc[k].coords.x, Config.npc[k].coords.y, height + 0.0)
            	Wait(100)
            end
            SetEntityCoords(npc, Config.npc[k].coords.x, Config.npc[k].coords.y, groundZ)
        end
        SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        FreezeEntityPosition(npc, true) 
        SetBlockingOfNonTemporaryEvents(npc, true) 
        SetModelAsNoLongerNeeded(Config.npc[k].npcmodel)
        renderednpc[k].npc  = npc
    end
end
-- logic to delete npcs
function derendernpc(k)
    if renderednpc[k] == nil then 
        renderednpc[k] = {state = false,npc = nil} 
    end
    if renderednpc[k].state == true then
        renderednpc[k].state = false  
        if renderednpc[k].npc ~= nil then 
            DeleteEntity(renderednpc[k].npc)
            renderednpc[k].npc = nil  
        end
    end
end
------------------------------- Threads BOOKMARK
--  start up configuration
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    if Config.debug then
        TriggerServerEvent("syn_clan:requestinfo2")
        TriggerEvent("syn_clan:blip")
    end
    local str = language.sellanimal
	sellanimal = PromptRegisterBegin()
	PromptSetControlAction(sellanimal, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(sellanimal, str)
	PromptSetEnabled(sellanimal, 1)
    PromptSetVisible(sellanimal, 1)
	PromptSetStandardMode(sellanimal,1)
	PromptSetGroup(sellanimal, prompts11)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,sellanimal,true)
	PromptRegisterEnd(sellanimal)
    
    local str = language.freshup
	cleanself = PromptRegisterBegin()
	PromptSetControlAction(cleanself, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(cleanself, str)
	PromptSetEnabled(cleanself, 1)
    PromptSetVisible(cleanself, 1)
	PromptSetStandardMode(cleanself,1)
	PromptSetGroup(cleanself, prompts10)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,cleanself,true)
	PromptRegisterEnd(cleanself)

    local str = language.grababeer
	getbeer = PromptRegisterBegin()
	PromptSetControlAction(getbeer, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(getbeer, str)
	PromptSetEnabled(getbeer, 1)
    PromptSetVisible(getbeer, 1)
	PromptSetStandardMode(getbeer,1)
	PromptSetGroup(getbeer, prompts9)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,getbeer,true)
	PromptRegisterEnd(getbeer)

    local str = language.trapperprompt
	trapperprompt = PromptRegisterBegin()
	PromptSetControlAction(trapperprompt, Config.keys["ENTER"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(trapperprompt, str)
	PromptSetEnabled(trapperprompt, 1)
    PromptSetVisible(trapperprompt, 1)
	PromptSetStandardMode(trapperprompt,1)
	PromptSetGroup(trapperprompt, prompts8)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,trapperprompt,true)
	PromptRegisterEnd(trapperprompt)

    local str = language.donateprompt
	donateprompt = PromptRegisterBegin()
	PromptSetControlAction(donateprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(donateprompt, str)
	PromptSetEnabled(donateprompt, 1)
    PromptSetVisible(donateprompt, 1)
	PromptSetStandardMode(donateprompt,1)
	PromptSetGroup(donateprompt, prompts8)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,donateprompt,true)
	PromptRegisterEnd(donateprompt)
    if Config.huntingwagon  then 
        local str = language.stashanimal
	    stashanimalprompt = PromptRegisterBegin()
	    PromptSetControlAction(stashanimalprompt, Config.keys["CTRL"])
	    str = CreateVarString(10, 'LITERAL_STRING', str)
	    PromptSetText(stashanimalprompt, str)
	    PromptSetEnabled(stashanimalprompt, 1)
	    PromptSetStandardMode(stashanimalprompt,1)
	    PromptSetGroup(stashanimalprompt, prompts6)
	    Citizen.InvokeNative(0xC5F428EE08FA7F2C,stashanimalprompt,true)
	    PromptRegisterEnd(stashanimalprompt)

        local str = language.wagonstash
	    checkstash = PromptRegisterBegin()
	    PromptSetControlAction(checkstash, Config.keys["ENTER"])
	    str = CreateVarString(10, 'LITERAL_STRING', str)
	    PromptSetText(checkstash, str)
	    PromptSetEnabled(checkstash, 1)
        PromptSetVisible(checkstash, 1)
	    PromptSetStandardMode(checkstash,1)
	    PromptSetGroup(checkstash, prompts6)
	    Citizen.InvokeNative(0xC5F428EE08FA7F2C,checkstash,true)
	    PromptRegisterEnd(checkstash)
    end

    local str = language.call
	callwagonprompt = PromptRegisterBegin()
	PromptSetControlAction(callwagonprompt, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(callwagonprompt, str)
	PromptSetEnabled(callwagonprompt, 1)
    PromptSetVisible(callwagonprompt, 1)
	PromptSetStandardMode(callwagonprompt,1)
	PromptSetGroup(callwagonprompt, prompts5)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,callwagonprompt,true)
	PromptRegisterEnd(callwagonprompt)

    local str = language.horses
	openstable = PromptRegisterBegin()
	PromptSetControlAction(openstable, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openstable, str)
	PromptSetEnabled(openstable, 1)
    PromptSetVisible(openstable, 1)
	PromptSetStandardMode(openstable,1)
	PromptSetGroup(openstable, prompts4)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openstable,true)
	PromptRegisterEnd(openstable)

    local str = language.cook
	openstew = PromptRegisterBegin()
	PromptSetControlAction(openstew, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openstew, str)
	PromptSetEnabled(openstew, 1)
    PromptSetVisible(openstew, 1)
	PromptSetStandardMode(openstew,1)
	PromptSetGroup(openstew, prompts7)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openstew,true)
	PromptRegisterEnd(openstew)

    local str = language.openchanging
	openchanging = PromptRegisterBegin()
	PromptSetControlAction(openchanging, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openchanging, str)
	PromptSetEnabled(openchanging, 1)
    PromptSetVisible(openchanging, 1)
	PromptSetStandardMode(openchanging,1)
	PromptSetGroup(openchanging, prompts3)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openchanging,true)
	PromptRegisterEnd(openchanging)

    local str = language.campmenu
	openmenu = PromptRegisterBegin()
	PromptSetControlAction(openmenu, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openmenu, str)
	PromptSetEnabled(openmenu, 1)
    PromptSetVisible(openmenu, 1)
	PromptSetStandardMode(openmenu,1)
	PromptSetGroup(openmenu, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openmenu,true)
	PromptRegisterEnd(openmenu)


    local str = language.openinv
	openinv = PromptRegisterBegin()
	PromptSetControlAction(openinv, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(openinv, str)
	PromptSetEnabled(openinv, 1)
    PromptSetVisible(openinv, 1)
	PromptSetStandardMode(openinv,1)
	PromptSetGroup(openinv, prompts2)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,openinv,true)
	PromptRegisterEnd(openinv)

    local str = language.deliversupplies
	deliversupplies = PromptRegisterBegin()
	PromptSetControlAction(deliversupplies, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(deliversupplies, str)
	PromptSetEnabled(deliversupplies, 1)
    PromptSetVisible(deliversupplies, 1)
	PromptSetStandardMode(deliversupplies,1)
	PromptSetGroup(deliversupplies, prompts12)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,deliversupplies,true)
	PromptRegisterEnd(deliversupplies)

    while charid == nil do 
        Wait(100)
    end
    if Config.publicbutcher then 
        for k,v in pairs(Config.butchers) do 
            local butcherblip = N_0x554d9d53f696d002(1664425300, v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(butcherblip, v.blip, 1)
            SetBlipScale(butcherblip, 0.8)
            Citizen.InvokeNative(0x9CB1A1623062F402, butcherblip, k)
            table.insert(butcherblips,butcherblip)
        end
    end 
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local sleep = true 
        if inmenu then 
            sleep = false 
            DisableControlAction(0, Config.keys["I"], true)
        end
        if sleep then 
            Wait(500)
        end
    end
end)
-- logic for when player is near butcher 
Citizen.CreateThread(function() -- find me 
    if Config.publicbutcher then
        while true do
            Citizen.Wait(0)
            local sleep = true 
            local player = PlayerPedId()
            local coords = GetEntityCoords(PlayerPedId())
            for k,v in pairs(Config.butchers) do 
                local dist = GetDistanceBetweenCoords(coords,v.coords.x,v.coords.y,v.coords.z, true)
                if 5 > dist and not IsPedOnMount(player) then 
                    sleep = false 
                    local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
                    local quality = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
                    local model = GetEntityModel(holding)
                    local outfit = Citizen.InvokeNative(0x30569F348D126A5A, holding)
                    local listed = false 
                    local allanimalinfo
                    local price 
                    local isskin = false 
                    local items = {}
                    if holding and not IsPedAPlayer(holding) then 
                        local itemnetwork = PedToNet(holding)
                        if Entity(holding) and Entity(holding).state and  Entity(holding).state.network then 
                            itemnetwork = Entity(holding).state.network 
                        end
    
                        if quality then
                            if skinnedanimals[itemnetwork] ~= nil then 
                                if skinnedanimals[itemnetwork].animalinfo.poorQuality == quality then
                                    listed = true 
                                    price = skinnedanimals[itemnetwork].animalinfo.poorQualityPrice
                                    isskin = true
                                    outfit = skinnedanimals[itemnetwork].outfit
                                    model = skinnedanimals[itemnetwork].model
                                elseif skinnedanimals[itemnetwork].animalinfo.goodQuality == quality then 
                                    listed = true 
                                    price = skinnedanimals[itemnetwork].animalinfo.goodQualityPrice
                                    isskin = true
                                    outfit = skinnedanimals[itemnetwork].outfit
                                    model = skinnedanimals[itemnetwork].model
                                elseif skinnedanimals[itemnetwork].animalinfo.perfectQuality == quality then 
                                    listed = true 
                                    price = skinnedanimals[itemnetwork].animalinfo.perfectQualityPrice
                                    isskin = true
                                    outfit = skinnedanimals[itemnetwork].outfit
                                    model = skinnedanimals[itemnetwork].model
                                else
                                    --TriggerServerEvent('syn_clan:correction',quality,skinnedanimals[itemnetwork])
                                    listed = true 
                                    price = skinnedanimals[itemnetwork].animalinfo.poorQualityPrice
                                    isskin = true
                                    outfit = skinnedanimals[itemnetwork].outfit
                                    model = skinnedanimals[itemnetwork].model
                                end
                            end
                        else
                            listed, allanimalinfo = isanimallisted(outfit,model)
                            price = allanimalinfo.goodQualityPrice
                            items = allanimalinfo.items
                        end
                    end
                    local label  = CreateVarString(10, 'LITERAL_STRING', k)
                    PromptSetActiveGroupThisFrame(prompts11, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,sellanimal) then
                        if listed and not sellinganimal then 
                            sellinganimal = true 
                            ------------------ EXPERIMENTAL CODE 
                            local entityNetworkId = PedToNet(holding)
                            SetNetworkIdExistsOnAllMachines(entityNetworkId, true)
                            local entityId = NetToPed(entityNetworkId)
                            if not NetworkHasControlOfEntity(entityId) then
                                NetworkRequestControlOfEntity(entityId)
                                NetworkRequestControlOfNetworkId(entityNetworkId)
                            end
                            ---------------------------------------------------------------
                            Citizen.InvokeNative(0xC7F0B43DCDC57E3D, PlayerPedId(), entityId, coords, 10.0, 1)
                            Wait(1500)
                            DeleteEntity(entityId) 
                            TriggerServerEvent("syn_clan:sellanimal",k,entityNetworkId,price,model,outfit,isskin,items)
                            if quality then 
                                skinnedanimals[entityNetworkId] = nil 
                            end
                            sellinganimal = false
                        elseif not listed and not sellinganimal then
                            sellinganimal = true
                            local lastmount = Citizen.InvokeNative(0x4C8B59171957BCF7,PlayerPedId())
                            local mountcoords = GetEntityCoords(lastmount)
                            local dist2 = GetDistanceBetweenCoords(coords,mountcoords, true)
                            if 5 > dist2 then 
                                local horsenetwork = PedToNet(lastmount)
                                if peltsonhorse[horsenetwork] ~= nil and peltsonhorse[horsenetwork] ~= 0 then 
                                    local saleprice = peltsonhorse[horsenetwork]
                                    TriggerServerEvent("syn_clan:sellhorsepelts",k,saleprice)
                                    peltsonhorse[horsenetwork] = 0
                                    while Citizen.InvokeNative(0x0CEEB6F4780B1F2F,lastmount,0) ~= false do 
                                        local pelt = Citizen.InvokeNative(0x0CEEB6F4780B1F2F,lastmount,0)
                                        Citizen.InvokeNative(0x627F7F3A0C4C51FF,lastmount,pelt)
                                    end
                                else
                                    TriggerEvent("vorp:TipBottom", language.nothingtosell, 6000)
                                end
                            end
                            sellinganimal = false 
                        end
                    end
                end
            end
            if sleep then 
                Wait(500)
            end
        end
    end
end)

-- logic to find distance of player to npcs that need rendering 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        local playercoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.npc) do 
            local dist = GetDistanceBetweenCoords(playercoords,v.coords.x,v.coords.y,v.coords.z, true)
            if v.coords.r > dist then 
                rendernpc(k)
            else
                derendernpc(k)
            end
        end
        Wait(500)
    end
end)
-- loop to ask for closest wagon to player 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local coords = GetEntityCoords(PlayerPedId())
        closewagon = GetClosestveh(coords)
    end
end)
-- logic for providing player options when near hunting wagon 
Citizen.CreateThread(function()
    if Config.huntingwagon then 
        while true do
            Citizen.Wait(0)
            local sleep = true 
            if closewagon ~= nil then 
                local player = PlayerPedId()
                local coords = GetEntityCoords(PlayerPedId())
                local wagonmodel = GetEntityModel(closewagon)
                local inwagon = IsPedInVehicle(player,closewagon)
                local heldentity = Citizen.InvokeNative(0xD806CD2A4F2C2996, player)
                wagonserverid = VehToNet(closewagon)
                local model = GetEntityModel(heldentity)
                local outfit = Citizen.InvokeNative(0x30569F348D126A5A, heldentity)
                local quality = Citizen.InvokeNative(0x31FEF6A20F00B963, heldentity)
                local listed = false 
                local allanimalinfo
                local animalnetwork
                local humanbody = false 
                if wagonmodel == -1698498246 and not inwagon and not stashinganimal and not inwagonmenu  then 
                    sleep = false 
                    DisableControlAction(0, Config.keys["G"], true)
                    local label  = CreateVarString(10, 'LITERAL_STRING', language.wagonspawner)
                    PromptSetActiveGroupThisFrame(prompts6, label)
                    if heldentity and not IsPedAPlayer(heldentity) then 
                        animalnetwork = PedToNet(heldentity)
                        if quality then
                            if skinnedanimals[animalnetwork] ~= nil then 
                                listed = true 
                                outfit = skinnedanimals[animalnetwork].outfit
                                model = skinnedanimals[animalnetwork].model
                            end
                        elseif Citizen.InvokeNative(0x9A100F1CF4546629,heldentity) then 
                            listed = isanimallisted(outfit,model)
                        elseif IsEntityDead(heldentity) then 
                            listed = true 
                            humanbody = true 
                            if Entity(heldentity) and Entity(heldentity).state and  Entity(heldentity).state.network then 
                                animalnetwork = Entity(heldentity).state.network
                            end
                        end
                    end
                    if listed then 
                        PromptSetVisible(stashanimalprompt, 1)
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,stashanimalprompt) then
                            stashinganimal = true 
                            wagoninfo = nil 
                            TriggerServerEvent("syn_clan:getwagoninfo",wagonserverid)
                            while wagoninfo == nil do 
                                Wait(100)
                            end
                            local wagoncount = keysx(wagoninfo.stash)
                            if Config.maxanimals > wagoncount then
                                --Citizen.InvokeNative(0xC7F0B43DCDC57E3D, player, heldentity, coords, 10.0, 1) -- animation
                                heldentity = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
                                model2 = GetEntityModel(heldentity)
                    
                                local isskin = false 
                                local data = {
                                    model = model,
                                    model2 = model2,
                                }
                                if quality then 
                                    isskin = true 
                                    data.peltquality = GetCarriableFromEntity(heldentity)
                                else
                                    data.metatag = GetCarcassMetaTag(heldentity)
                                    data.outfit = GetPedMetaOutfitHash(heldentity)
                                    data.skinned = IsEntityFullyLooted(heldentity) or false
                                    data.damage = GetPedDamageCleanliness(heldentity) or 0
                                    data.quality = GetPedQuality(heldentity) or 0
                                end
                                local offset = GetOffsetFromEntityInWorldCoords(closewagon, 0.0, -2.7, 0.0)
                                TaskGoStraightToCoord(PlayerPedId(), offset.x, offset.y, offset.z, 3.0, 1000, GetEntityHeading(closewagon), 0)
                                TaskStatus(`SCRIPT_TASK_GO_STRAIGHT_TO_COORD`)
                                TaskPlaceCarriedEntityAtCoord(PlayerPedId(), heldentity, GetEntityCoords(closewagon), 1.0, 5)
                                TaskStatus(`SCRIPT_TASK_PLACE_CARRIED_ENTITY_AT_COORD`)
                                Wait(1000)
                                DeleteEntity(heldentity)
    
                                TriggerServerEvent("syn_clan:stashanimal",animalnetwork,wagonserverid,outfit,model,isskin,humanbody,data)
                                --[[ Wait(1500)
                                NetworkRegisterEntityAsNetworked(heldentity)
                                SetEntityAsMissionEntity(heldentity, true)
                                SetEntityCoords(heldentity, GetEntityCoords(closewagon))
                                SetEntityCollision(heldentity, false, true)
                                FreezeEntityPosition(heldentity, true)
                                SetEntityVisible(heldentity, false) ]]
                                Citizen.InvokeNative(0x6B9BBD38AB0796DF, heldentity, closewagon, -1, 0.0, 0.0, -20.0, 0.0, 0.0, 90.0, true, false, false, true, true, true, false, false)
                                local ratio = (keysx(wagoninfo.stash)/10) + 0.0
                                if not Citizen.InvokeNative(0xD798DF5DB67B1659, closewagon) then 
                                    Citizen.InvokeNative(0x75F90E4051CC084C, closewagon, GetHashKey("pg_mp005_huntingWagonTarp01"))
                                    Citizen.InvokeNative(0x31F343383F19C987, closewagon, ratio, true)
                                else
                                    Citizen.InvokeNative(0x31F343383F19C987, closewagon, ratio, true)
                                end
                            else
                                TriggerEvent("vorp:TipBottom", language.wagonisfull..Config.maxanimals, 6000) 
                            end
                            stashinganimal = false 
                        end
                    else
                        PromptSetVisible(stashanimalprompt, 0)
                    end
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,checkstash) then
                        wagoninfo = nil 
                        TriggerServerEvent("syn_clan:getwagoninfo",wagonserverid)
                        while wagoninfo == nil do 
                            Wait(100)
                        end
                        if not wagoninfo.opened then 
                            standstill()
                            inwagonmenu = true 
                            TriggerServerEvent("syn_clan:switchwagonmenu",wagonserverid,inwagonmenu)
                            checkstashmenu()
                        end
                    end
                end
            end
            if sleep then 
                Wait(500)
            end
        end
    end
end)
-- logic for spawning camp owned wagon
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if callwagon then 
            local coords = GetEntityCoords(PlayerPedId())
            if renderedclanid ~= nil and campsinfo[renderedclanid] ~= nil and campsinfo[renderedclanid].info ~= nil then 
                local campcoords = campsinfo[renderedclanid].info.coords
                sleep = false 
                local dist = GetDistanceBetweenCoords(coords,campcoords.x,campcoords.y,campcoords.z, true)
                local label  = CreateVarString(10, 'LITERAL_STRING',language.wagonspawner)
                PromptSetActiveGroupThisFrame(prompts5, label)
                if Citizen.InvokeNative(0xC92AC953F0A982AE,callwagonprompt) then
                    if Config.render > dist then 
                        spawnwagon(globalclanid)
                        inmenu = false 
                        callwagon = false 
                    else
                        TriggerEvent("vorp:TipBottom", language.outofbounds, 6000)    
                    end
                end
            else
                sleep = false 
                drawtext(language.outofbounds, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
-- logic to find and render closest camp 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playercoords = GetEntityCoords(PlayerPedId())
        for k, v in pairs(locational) do
            local dist = GetDistanceBetweenCoords(playercoords, v.x, v.y, v.z, true)
            if dist > Config.render or Reload then
                derenderobj(k)
                if Reload then
                    derenderobj(clanid)

                    for k, v in pairs(renderedobjects) do
                        for x, y in pairs(v) do
                            if y.cata == "prop" then
                                SetEntityAsMissionEntity(y.object)
                                DeleteObject(y.object)
                                grass2(y.veg_modifier_sphere)
                                renderedobjects[k][x] = nil
                            elseif y.cata == "set" then
                                Citizen.InvokeNative(0x58AC173A55D9D7B4, y.object, 1, 1)
                                renderedobjects[k][x] = nil
                            end
                        end
                    end
                    if status == "leader" then
                        Reload = false
                    else
                        renderobj(clanid)
                        Reload = false
                    end
                end
            else
                renderobj(k)
                Reload = false
            end
        end
        Wait(500)
    end
end)
if Config.autocleanhorse then 
    -- clean up skinned animals table if it reached 20 animals , check triggered every 10 minutes
    Citizen.CreateThread(function() 
    	while true do
    		Citizen.Wait(1)
            local sleep = true 
            if keysx(skinnedanimals) > Config.autocleananimals then 
                skinnedanimals = {}
            end
            if sleep then 
                Wait(600000)
            end
        end
    end)
end
-- logic to check and register skinned animals and find skins on horse 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1) 
		local size = GetNumberOfEvents(0)   
		if size > 0 then 
			for i = 0, size - 1 do
				local eventAtIndex = GetEventAtIndex(0, i)
                if Config.poisonsnake then 
                    if eventAtIndex == GetHashKey("EVENT_ENTITY_DAMAGED") then 
                        local eventDataSize = 9
                        local eventDataStruct = DataView.ArrayBuffer(72)
                        eventDataStruct:SetInt32(0 ,0)
                        eventDataStruct:SetInt32(8 ,0) 
                        eventDataStruct:SetInt32(16 ,0)
                        local is_data_exists = Citizen.InvokeNative(0x57EC5FA4D4D6AFCA,0,i,eventDataStruct:Buffer(),eventDataSize)
                        if is_data_exists then
                            if PlayerPedId() == eventDataStruct:GetInt32(0) then
                                local weaponhash = eventDataStruct:GetInt32(16)
                                if -655377385 == weaponhash then 
                                    if not poisoned then 
                                        print("posioned !")
                                        ticker = 0
                                        poisoned = true 
                                        if Config.saveserver then 
                                            TriggerServerEvent("syn_clan:poisonplayer")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if eventAtIndex == GetHashKey("EVENT_LOOT_COMPLETE") then   
					local eventDataSize = 3 
					local eventDataStruct = DataView.ArrayBuffer(24)
					eventDataStruct:SetInt32(0 ,0)
					eventDataStruct:SetInt32(8 ,0) 
					eventDataStruct:SetInt32(16 ,0)
					local is_data_exists = Citizen.InvokeNative(0x57EC5FA4D4D6AFCA,0,i,eventDataStruct:Buffer(),eventDataSize)
					if is_data_exists then
                        if PlayerPedId() == eventDataStruct:GetInt32(0) then
                            local pedid = eventDataStruct:GetInt32(8)
                            if eventDataStruct:GetInt32(16) == 1 then
                                local model = GetEntityModel(pedid)
                                local typex = GetPedType(pedid)
                                local outfit = Citizen.InvokeNative(0x30569F348D126A5A, holding)
                                local islisted,animalinfo = isanimallisted(outfit,model)
                                if islisted  then
                                    Wait(500)
                                    local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
                                    local itemnetwork = PedToNet(holding)
                                    skinnedanimals[itemnetwork] = {outfit=outfit,model=model,animalinfo=animalinfo}
                                end
                            end
                        end
                    end
                end
                if eventAtIndex == GetHashKey("EVENT_PLACE_CARRIABLE_ONTO_PARENT") then   
					local eventDataSize = 6 
					local eventDataStruct = DataView.ArrayBuffer(8*6)
					eventDataStruct:SetInt32(0 ,0)
					eventDataStruct:SetInt32(8 ,0) 
					eventDataStruct:SetInt32(16 ,0)
					eventDataStruct:SetInt32(32 ,0)
					local is_data_exists = Citizen.InvokeNative(0x57EC5FA4D4D6AFCA,0,i,eventDataStruct:Buffer(),eventDataSize)
					if is_data_exists then
                        local ispelt = eventDataStruct:GetInt32(32)
                        if ispelt then 
                            local pelt = eventDataStruct:GetInt32(8)
                            local quality = Citizen.InvokeNative(0x31FEF6A20F00B963, pelt)
                            local itemnetwork = PedToNet(pelt)
                            local coords = GetEntityCoords(PlayerPedId())
                            local horse = eventDataStruct:GetInt32(16)
                            local horsenetwork = PedToNet(horse)
                            local price = 0
                            if skinnedanimals[itemnetwork] ~= nil then 
                                if not skinnedanimals[itemnetwork].animalinfo.bigpelt then 
                                    if skinnedanimals[itemnetwork].animalinfo.poorQuality == quality then
                                        price = skinnedanimals[itemnetwork].animalinfo.poorQualityPrice
                                    elseif skinnedanimals[itemnetwork].animalinfo.goodQuality == quality then 
                                        price = skinnedanimals[itemnetwork].animalinfo.goodQualityPrice
                                    elseif skinnedanimals[itemnetwork].animalinfo.perfectQuality == quality then 
                                        price = skinnedanimals[itemnetwork].animalinfo.perfectQualityPrice
                                    end
                                    if peltsonhorse[horsenetwork] == nil then 
                                        peltsonhorse[horsenetwork] = 0
                                    end
                                    peltsonhorse[horsenetwork] = peltsonhorse[horsenetwork] + price
                                    skinnedanimals[itemnetwork] = nil 
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
-- logic to check and reset player drinking count 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if drinkcount > 0 then 
            Wait(60000)
            drinkcount = drinkcount - 1 
            if 0 >= drinkcount then 
                AnimpostfxStop(lasteffect)
                drinkcount = 0 
                Citizen.InvokeNative(0x406CCF555B04FAD3 , PlayerPedId(), false, 0.0)
            end
        else
            Wait(5000)
        end 
    end
end)
-- logic for moving camp furniture 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true
        if ismoving then 
            sleep = false 
            if campsinfo[renderedclanid] ~= nil and campsinfo[renderedclanid].info ~= nil then 
                local camproot = campsinfo[renderedclanid].info.coords
                local pos = GetEntityCoords(PlayerPedId(), true)
                local let = true 
                local let2 = true 
                if shadowobject ~= nil then 
                    local pos2 = GetEntityCoords(shadowobject, true)
                    local dist = GetDistanceBetweenCoords(pos2,camproot.x,camproot.y,camproot.z, true)
                    if dist > Config.placementradius then 
                        outofbounds = true
                    else
                        outofbounds = false 
                    end
                end
                local dist = GetDistanceBetweenCoords(pos,camproot.x,camproot.y,camproot.z, true)
                if dist > Config.placementradius then 
                    outofbounds2 = true
                else
                    outofbounds2 = false 
                end
            end       
        end
        if sleep then 
            Wait(500)
        end
    end
end)
-- movment of furniture object and placement 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        local temp
        if ismoving and not outofbounds2 then 
            sleep = false 
            local isground = "~e~"..tostring(movedpiece.grounded)
            if movedpiece.grounded then 
                isground = "~t6~"..tostring(movedpiece.grounded)
            end

            drawtext(language.gitemplace, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.fourtocancel, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.bonground.." / "..language.grounded..isground, 0.15, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.changemoverate, 0.15, 0.19, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.rotateitem1, 0.15, 0.22, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.rotateitem2, 0.15, 0.25, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.moveitem1, 0.15, 0.28, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.moveitem2, 0.15, 0.31, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.moveitem3, 0.15, 0.34, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.moveitem4, 0.15, 0.37, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.moveitem5, 0.15, 0.40, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(language.moveitem6, 0.15, 0.43, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            if not outofbounds then 
                drawtext(language.pressenterconfirm, 0.15, 0.46, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            else
                drawtext(language.outofbounds, 0.15, 0.46, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            end
            if whenKeyJustPressed(Config.keys["G"]) then
                if shadowobject == nil then 
                    local pos = GetEntityCoords(PlayerPedId(), true)
                    if movedpiece.cata == "set" then 
                        shadowobject = CreateObject(`mp005_s_posse_tent_bountyhunter07x`, pos.x+1, pos.y+1, pos.z, true, true, false)
                    else
                        shadowobject = CreateObject(movedpiece.prop, pos.x+1, pos.y+1, pos.z, true, true, false)
                    end
                    SetEntityCollision(shadowobject,false,false)
                    SetEntityAsMissionEntity(shadowobject, true)
                    PlaceObjectOnGroundProperly(shadowobject)
                    SetEntityAlpha(shadowobject, 200)
                    local pos2 = GetEntityCoords(shadowobject, true)
                    xx,yy,zz = table.unpack(pos2)
                    hh = GetEntityHeading(shadowobject)
                end
            end
            if not outofbounds then 
                if whenKeyJustPressed(Config.keys["ENTER"]) then
                    if shadowobject ~= nil then
                        ismoving = false
                        if shadowobject ~= nil then
                            DeleteObject(shadowobject)
                            shadowobject = nil 
                        end
                        movedpiece.coords.x = xx
                        movedpiece.coords.y = yy
                        movedpiece.coords.z = zz
                        movedpiece.heading = hh
                        TriggerServerEvent("syn_clan:movefurni",activeclanid,movedpiece)
                        closemenu()
                        Reload =true
                    end
                end
            end
            if whenKeyJustPressed(Config.keys["3"]) then
                TriggerEvent("syn_inputs:sendinputs", language.confirm, language.increment, function(cb)
                    local inc =     tonumber(cb)
                    if inc ~= nil and inc ~= "" then
                        increment = inc
                    else
                        TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                    end
                end)
            end

            if whenKeyJustPressed(Config.keys["LEFTBRACKET"]) then
               if shadowobject ~= nil then
                    SetEntityCoords(shadowobject, xx, yy - increment, zz , true, true, true, false)
                    yy = yy - increment
                end
            end
            if whenKeyJustPressed(Config.keys["RIGHTBRACKET"]) then
               if shadowobject ~= nil then
                    SetEntityCoords(shadowobject, xx, yy + increment, zz , true, true, true, false)
                    yy = yy + increment
                end
            end
            if whenKeyJustPressed(Config.keys["1"]) then
               if shadowobject ~= nil then
                    hh = hh + 5
                    SetEntityHeading(shadowobject, hh % 360)
                end
            end
            if whenKeyJustPressed(Config.keys["2"]) then
               if shadowobject ~= nil then
                    hh = hh - 5
                    SetEntityHeading(shadowobject, hh % 360)
                end
            end

            if whenKeyJustPressed(Config.keys["UP"]) then
                if shadowobject ~= nil then
                    SetEntityCoords(shadowobject, xx, yy, zz+ increment, true, true, true, false)
                    zz = zz + increment
                    --movedpiece.grounded = false 
                end
            end
            if whenKeyJustPressed(Config.keys["DOWN"]) then
                if shadowobject ~= nil then
                    SetEntityCoords(shadowobject, xx, yy, zz - increment, true, true, true, false)
                    zz = zz - increment
                    --movedpiece.grounded = false 
                end
            end
            if whenKeyJustPressed(Config.keys["LEFT"]) then
                if shadowobject ~= nil then
                    SetEntityCoords(shadowobject, xx- increment, yy , zz , true, true, true, false)
                    xx = xx - increment
                end
            end
            if whenKeyJustPressed(Config.keys["RIGHT"]) then
                if shadowobject ~= nil then
                    SetEntityCoords(shadowobject, xx+ increment, yy , zz , true, true, true, false)
                    xx = xx + increment
                end
            end
            if whenKeyJustPressed(Config.keys["B"]) then
                if shadowobject ~= nil then
                    if not movedpiece.grounded then 
                        PlaceObjectOnGroundProperly(shadowobject)
                        local pos2 = GetEntityCoords(shadowobject, true)
                        zz = pos2.z
                        movedpiece.grounded = true
                    else
                        movedpiece.grounded = false
                    end
                end
            end
            if whenKeyJustPressed(Config.keys["4"]) then
                ismoving = false
                closemenu()
                if shadowobject ~= nil then
                    DeleteObject(shadowobject)
                    shadowobject = nil 
                end
            end
        elseif outofbounds2 then 
            sleep = false 
            drawtext(language.outofbounds, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
        end
        if sleep then 
            Wait(500)
        end
    end
end)
-- logic to show 3d text to help identify selected furniture  
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if pieceselected and movedpiece.active then 
            sleep = false 
            DrawText3D(movedpiece.coords.x, movedpiece.coords.y,movedpiece.coords.z, language.pieceselected)
        end
        if sleep then 
            Wait(500)
        end
    end
end)
-- logic to find functional objects when player is near a camp
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true
        if renderedclanid == globalclanid then 
            local coords = GetEntityCoords(PlayerPedId())
            sleep = false 
            if renderedclanid ~= 0 and campsinfo[renderedclanid] ~= nil and next(campsinfo[renderedclanid]) ~= nil then
                local furniture = campsinfo[renderedclanid].info.furni
                for k,v in pairs(furniture) do 
                    if v.active and  v.functional ~= "none" then -- lolomg
                        if v.functional == "hunting" then 
                            if next(supplymissionactivewagons) ~= nil and IsPedInAnyVehicle(PlayerPedId()) then 
                                local wagon = GetVehiclePedIsIn(PlayerPedId(),false)
                                local model =  GetEntityModel(wagon)
                                local driver = Citizen.InvokeNative(0x2963B5C1637E8A27,wagon)
                                if PlayerPedId() == driver then 
                                    local network = VehToNet(wagon)
                                    if model == `wagon05x` and vehnetworkcontained(supplymissionactivewagons,network) then
                                        if DoesObjectOfTypeExistAtCoords(coords.x, coords.y, coords.z, (Config.render/4), v.prop, 0) and not inmenu and not isrelocating and not ismoving then 
                                            drawtext(language.gtodeliver, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                                            if whenKeyJustPressed(Config.keys["X"]) then
                                                DoScreenFadeOut(500)
                                                while IsScreenFadingOut() do
                                                  Wait(0)
                                                end
                                                while not NetworkHasControlOfEntity(wagon)  do
                                                    Wait(100)
                                                    NetworkRequestControlOfEntity(wagon)
                                                end
                                                SetEntityAsMissionEntity(wagon, true, true)
                                                DeleteVehicle(wagon)
                                                TriggerServerEvent("syn_clan:getsuppliesfromwagon",network,renderedclanid)
                                                Wait(500)
                                                DoScreenFadeIn(1000)
                                                while IsScreenFadingIn() do
                                                    Wait(0)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        if DoesObjectOfTypeExistAtCoords(coords.x, coords.y, coords.z, 2.0, v.prop, 0) and not inmenu and not isrelocating and not ismoving then 
                            if v.functional == "inv"  then 
                                local label  = CreateVarString(10, 'LITERAL_STRING',language.inventory)
                                PromptSetActiveGroupThisFrame(prompts2, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,openinv) then
                                    if getinmenu() then 
                                        standstill()
                                        TriggerServerEvent("syn_clan:activemenu",renderedclanid,true)
                                        TriggerServerEvent("syn_clan:reloadCampInventory", renderedclanid)
                                        TriggerEvent("vorp_inventory:OpenClanInventory", language.campstorage, renderedclanid,campsinfo[renderedclanid].invlimit)
                                        inmenu = true 
                                    else
                                        TriggerEvent("vorp:TipBottom", language.menuinuse, 6000)
                                        Wait(5000)
                                    end
                                end
                            elseif v.functional == "beerbox" and DoesObjectOfTypeExistAtCoords(coords.x, coords.y, coords.z, 1.0, v.prop, 0) then 
                                local label  = CreateVarString(10, 'LITERAL_STRING',language.beerbox)
                                PromptSetActiveGroupThisFrame(prompts9, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,getbeer) then
                                    local object 
                                    for m,n in pairs(renderedobjects[renderedclanid]) do 
                                        if v.prop == n.type then 
                                            object = n.object
                                        end
                                    end
                                    if object ~= nil then 
                                        TaskTurnPedToFaceEntity(PlayerPedId(),object,1000,1,1,1)
                                        Wait(1000)
                                        grabbeeranim()
                                        Wait(1000)
                                        ClearPedTasks(PlayerPedId())
                                    end
                                    local propEntity = CreateObject(`p_bottlejd01x`, GetEntityCoords(PlayerPedId()), false, true, false, false, true)
                                    local anim = TaskItemInteraction_2(PlayerPedId(), -1199896558, propEntity, GetHashKey('p_bottleJD01x_ph_r_hand'), GetHashKey('DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_TABLE_HOLD'), 1, 0, -1.0)
                                    drinkcount = drinkcount + 1 
                                    Wait(5000)
                                    if drinkcount == Config.beerstats.drunkcount then 
                                        TriggerEvent("syn_clan:getdrunk","PlayerDrunkAberdeen",(Config.beerstats.drunktime * 60000),0.5)
                                    elseif drinkcount == (Config.beerstats.drunkcount*2) then 
                                        TriggerEvent("syn_clan:getdrunk","PlayerDrunk01",(Config.beerstats.drunktime * 60000),0.75)
                                    elseif drinkcount > (Config.beerstats.drunkcount*2.5) then 
                                        TriggerEvent("syn_clan:getdrunk","PlayerDrugsHalluc01",(Config.beerstats.drunktime * 60000),1.0)
                                    end
                                    DeleteEntity(propEntity)
		                            ClearPedSecondaryTask(PlayerPedId())
                                    TriggerEvent("fred_meta:consume",Config.beerstats.hunger,Config.beerstats.thirst,Config.beerstats.metabolism,Config.beerstats.innercorestamina,Config.beerstats.innercorestaminagold,Config.beerstats.outercorestaminagold,Config.beerstats.innercorehealth,Config.beerstats.innercorehealthgold,Config.beerstats.outercorehealthgold)
                                end
                            elseif v.functional == "waterbarrel" and DoesObjectOfTypeExistAtCoords(coords.x, coords.y, coords.z, 0.8, v.prop, 0) then 
                                local label  = CreateVarString(10, 'LITERAL_STRING',language.waterbarrel)
                                PromptSetActiveGroupThisFrame(prompts10, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,cleanself) then
                                    local object 
                                    for m,n in pairs(renderedobjects[renderedclanid]) do 
                                        if v.prop == n.type then 
                                            object = n.object
                                        end
                                    end
                                    if object ~= nil then 
                                        TaskTurnPedToFaceEntity(PlayerPedId(),object,1000,1,1,1)
                                        Wait(1000)
                                    end
                                    Citizen.InvokeNative(0xFCCC886EDE3C63EC,PlayerPedId(),false,true)
                                    if IsPedMale(PlayerPedId()) then 
                                        PlayAnimation(PlayerPedId(),"mp_amb_player@prop_player_wash_face_barrel@sober@male_a@base","base",0)
                                    else
                                        PlayAnimation(PlayerPedId(), "amb_misc@world_human_wash_face_bucket@table@female_a@idle_d","idle_j",0)
                                    end
                                    Wait(2000)
                                    ClearPedEnvDirt(PlayerPedId())
								    ClearPedBloodDamage(PlayerPedId())
								    N_0xe3144b932dfdff65(PlayerPedId(), 0.0, -1, 1, 1)
								    ClearPedDamageDecalByZone(PlayerPedId(), 10, "ALL")
								    Citizen.InvokeNative(0x7F5D88333EE8A86F, PlayerPedId(), 1)
                                    Citizen.InvokeNative(0x9C720776DAA43E7E, PlayerPedId())
                                    AnimpostfxStop(lasteffect)
                                    drinkcount = 0 
                                    Citizen.InvokeNative(0x406CCF555B04FAD3 , PlayerPedId(), false, 0.0)
                                end
                            elseif v.functional == "changing" then 
                                local label  = CreateVarString(10, 'LITERAL_STRING',language.wardrobe)
                                PromptSetActiveGroupThisFrame(prompts3, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,openchanging) then
                                    standstill()
                                    inmenu = true 
                                    playerclothes = nil 
                                    TriggerServerEvent("syn_clan:getclothes")
                                    while playerclothes == nil do 
                                        Wait(100)
                                    end
                                    outfitsmenu()
                                end
                            elseif v.functional == "stable" then 
                                local label  = CreateVarString(10, 'LITERAL_STRING',language.openstable)
                                PromptSetActiveGroupThisFrame(prompts4, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,openstable) then
                                    standstill()
                                    inmenu = true 
                                    playerhorses = nil 
                                    TriggerServerEvent("syn_clan:gethorses")
                                    while playerhorses == nil do 
                                        Wait(100)
                                    end
                                    stablemenu()
                                end
                            elseif v.functional == "stew" then 
                                local label  = CreateVarString(10, 'LITERAL_STRING',language.stewpot)
                                PromptSetActiveGroupThisFrame(prompts7, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,openstew) then
                                    if getinmenu() then
                                        standstill()
                                        TriggerServerEvent("syn_clan:activemenu",renderedclanid,true)
                                        inmenu = true 
                                        stewpotmenu()
                                    else
                                        TriggerEvent("vorp:TipBottom", language.menuinuse, 6000)
                                        Wait(5000)
                                    end
                                end
                            
                            elseif v.functional == "hunting" then -- find me 
                                local label  = CreateVarString(10, 'LITERAL_STRING',language.trapper)
                                PromptSetActiveGroupThisFrame(prompts8, label)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,trapperprompt) then
                                    checking = true 
                                    TriggerServerEvent("syn_clan:checksupplycooldown",renderedclanid)
                                    while checking do 
                                        Wait(100)
                                    end
                                    if getinmenu() then
                                        standstill()
                                        TriggerServerEvent("syn_clan:activemenu",renderedclanid,true)
                                        inmenu = true 
                                        trappermenu()
                                    else
                                        TriggerEvent("vorp:TipBottom", language.menuinuse, 6000)
                                        Wait(5000)
                                    end
                                end
                                local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
                                local quality = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
                                local model = GetEntityModel(holding)
                                local outfit = Citizen.InvokeNative(0x30569F348D126A5A, holding)
                                local listed = false 
                                local allanimalinfo
                                local price 
                                local isskin = false 
                                local items = {}
                                if holding and not IsPedAPlayer(holding) then 
                                    local itemnetwork = PedToNet(holding)
                                    if Entity(holding) and Entity(holding).state and  Entity(holding).state.network then 
                                        itemnetwork = Entity(holding).state.network 
                                    end
                                    if quality then
                                        if skinnedanimals[itemnetwork] ~= nil then 
                                            if skinnedanimals[itemnetwork].animalinfo.poorQuality == quality then
                                                listed = true 
                                                price = skinnedanimals[itemnetwork].animalinfo.poorQualityPrice
                                                isskin = true
                                                outfit = skinnedanimals[itemnetwork].outfit
                                                model = skinnedanimals[itemnetwork].model
                                            elseif skinnedanimals[itemnetwork].animalinfo.goodQuality == quality then 
                                                listed = true 
                                                price = skinnedanimals[itemnetwork].animalinfo.goodQualityPrice
                                                isskin = true
                                                outfit = skinnedanimals[itemnetwork].outfit
                                                model = skinnedanimals[itemnetwork].model
                                            elseif skinnedanimals[itemnetwork].animalinfo.perfectQuality == quality then 
                                                listed = true 
                                                price = skinnedanimals[itemnetwork].animalinfo.perfectQualityPrice
                                                isskin = true
                                                outfit = skinnedanimals[itemnetwork].outfit
                                                model = skinnedanimals[itemnetwork].model
                                            else
                                                --TriggerServerEvent('syn_clan:correction',quality,skinnedanimals[itemnetwork])
                                                listed = true 
                                                price = skinnedanimals[itemnetwork].animalinfo.poorQualityPrice
                                                isskin = true
                                                outfit = skinnedanimals[itemnetwork].outfit
                                                model = skinnedanimals[itemnetwork].model
                                            end
                                        end
                                    else
                                        listed, allanimalinfo = isanimallisted(outfit,model)
                                        price = allanimalinfo.goodQualityPrice
                                        items = allanimalinfo.items
                                    end
                                end
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,donateprompt) and not sellinganimal then
                                    sellinganimal = true 
                                    if getinmenu() then
                                        if listed then 
                                            ------------------ EXPERIMENTAL CODE 
                                            local entityNetworkId = PedToNet(holding)
                                            SetNetworkIdExistsOnAllMachines(entityNetworkId, true)
                                            local entityId = NetToPed(entityNetworkId)
                                            if not NetworkHasControlOfEntity(entityId) then
                                                NetworkRequestControlOfEntity(entityId)
                                                NetworkRequestControlOfNetworkId(entityNetworkId)
                                            end
                                            ---------------------------------------------------------------
                                            Citizen.InvokeNative(0xC7F0B43DCDC57E3D, PlayerPedId(), entityId, coords, 10.0, 1)
                                            Wait(1500)
                                            DeleteEntity(entityId) 
                                            TriggerServerEvent("syn_clan:donateanimal",renderedclanid,entityNetworkId,price,model,outfit,isskin)
                                            if quality then 
                                                skinnedanimals[entityNetworkId] = nil 
                                            end
                                        elseif not listed then 
                                            local lastmount = Citizen.InvokeNative(0x4C8B59171957BCF7,PlayerPedId())
                                            local mountcoords = GetEntityCoords(lastmount)
                                            local dist2 = GetDistanceBetweenCoords(coords,mountcoords, true)
                                            if 5 > dist2 then 
                                                local horsenetwork = PedToNet(lastmount)
                                                if peltsonhorse[horsenetwork] ~= nil and peltsonhorse[horsenetwork] ~= 0 then 
                                                    local saleprice = peltsonhorse[horsenetwork]
                                                    TriggerServerEvent("syn_clan:donateallhorsepelts",renderedclanid,saleprice)
                                                    peltsonhorse[horsenetwork] = 0
                                                    while Citizen.InvokeNative(0x0CEEB6F4780B1F2F,lastmount,0) ~= false do 
                                                        local pelt = Citizen.InvokeNative(0x0CEEB6F4780B1F2F,lastmount,0)
                                                        Citizen.InvokeNative(0x627F7F3A0C4C51FF,lastmount,pelt)
                                                    end
                                                else
                                                    TriggerEvent("vorp:TipBottom", language.nothingtodonate, 6000)
                                                end
                                            end
                                        end
                                    else
                                        TriggerEvent("vorp:TipBottom", language.menuinuse, 6000)
                                        Wait(5000)
                                    end
                                    sellinganimal = false 
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if sleep then 
        Wait(500)
    end
end)
local iscampraided = false 
local iscampopen = false 
local radiedclanid 

local allowlockpick = false 
local raidtimer
local startedtimer = false 
local lockpicktimer 

local haslockpickitem = false 
local ingame = false 
RegisterNetEvent('syn_clan:warnofraid')
AddEventHandler('syn_clan:warnofraid', function()
    beingraided = true 
    TriggerEvent("vorp:TipBottom", language.campraided, 60000)
end)
RegisterNetEvent('syn_clan:disableraided')
AddEventHandler('syn_clan:disableraided', function()
    beingraided = false 
end)
RegisterNetEvent('syn_clan:hasitemcheck')
AddEventHandler('syn_clan:hasitemcheck', function(x)
    haslockpickitem = x 
    checking = false 
end)
RegisterNetEvent('syn_clan:reccampraid')
AddEventHandler('syn_clan:reccampraid', function(x,y)
    iscampopen = y
    iscampraided = x 
    checking = false 
end)
RegisterNetEvent('syn_clan:startraidtimer')
AddEventHandler('syn_clan:startraidtimer', function(x)
    raidtimer = Config.raidtimer * 60
    radiedclanid = x 
    startedtimer = true 
end)


RegisterNetEvent('syn_clan:givecash')
AddEventHandler('syn_clan:givecash', function(x)
   TriggerServerEvent("syn_clan:cash", x) 
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if startedtimer then 
            sleep = false 
            local coords = GetEntityCoords(PlayerPedId())
            drawtext(language.raidtimer..raidtimer, 0.15, 0.19, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            local dist = GetDistanceBetweenCoords(coords,campsinfo[radiedclanid].info.coords.x,campsinfo[radiedclanid].info.coords.y,campsinfo[radiedclanid].info.coords.z, true)
            if IsEntityDead(PlayerPedId()) or dist > Config.raiddistancecheck then
                TriggerEvent("vorp:TipBottom", language.raidendeddist, 6000) 
                startedtimer = false 
                raidtimer = nil 
                allowlockpick = false 
                lockpicktimer = nil 
                radiedclanid = nil 
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if allowlockpick and not ingame then 
            sleep = false 
            local coords = GetEntityCoords(PlayerPedId())
            drawtext(language.lockpicktimer..lockpicktimer, 0.15, 0.19, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            local dist = GetDistanceBetweenCoords(coords,campsinfo[radiedclanid].info.coords.x,campsinfo[radiedclanid].info.coords.y,campsinfo[radiedclanid].info.coords.z, true)
            if IsEntityDead(PlayerPedId()) or dist > Config.raiddistancecheck then 
                TriggerEvent("vorp:TipBottom", language.raidendeddist, 6000)
                startedtimer = false 
                raidtimer = nil 
                allowlockpick = false 
                lockpicktimer = nil 
                radiedclanid = nil 
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if allowlockpick then 
            sleep = false 
            Wait(1000)
            if lockpicktimer ~= nil then 
                lockpicktimer = lockpicktimer - 1
                if 0 >= lockpicktimer then 
                    allowlockpick = false 
                    lockpicktimer = nil 
                    radiedclanid = nil 
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if startedtimer then 
            sleep = false 
            Wait(1000)
            if raidtimer ~= nil then 
                raidtimer = raidtimer - 1
                if 0 >= raidtimer then 
                    lockpicktimer = Config.lockpicktimer * 60
                    allowlockpick = true 
                    startedtimer = false 
                    raidtimer = nil 
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if ingame then 
            sleep = false 
            if not IsEntityPlayingAnim(PlayerPedId(), "script_proc@rustling@olar@player_picklock", "base", 3) then
                local waiting = 0
                RequestAnimDict("script_proc@rustling@olar@player_picklock")
                while not HasAnimDictLoaded("script_proc@rustling@olar@player_picklock") do
                    waiting = waiting + 100
                    Citizen.Wait(100)
                    if waiting > 5000 then
                        break
                    end
                end
                Wait(100)
                TaskPlayAnim(PlayerPedId(), 'script_proc@rustling@olar@player_picklock', 'base', 8.0, 8.0, 120000, 31, 0, true, 0, false, 0, false)
            end 
        end
        if sleep then 
            Wait(500)
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if inmenu then 
            if IsEntityDead(PlayerPedId()) then 
                closemenu()
                TriggerEvent("vorp_inventory:CloseInv")
            end
        end
    end
end)
-- loop for actions related to when the player is near a camp flag.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        local playercoords = GetEntityCoords(PlayerPedId())
        if renderedclanid ~= 0 and campsinfo[renderedclanid] ~= nil and next(campsinfo[renderedclanid]) ~= nil then 
            local dist = GetDistanceBetweenCoords(playercoords,campsinfo[renderedclanid].info.coords.x,campsinfo[renderedclanid].info.coords.y,campsinfo[renderedclanid].info.coords.z, true)
            if 1.5 > dist and not inmenu and not isrelocating and not ismoving and not ingame then 
                sleep = false 
                local label  = CreateVarString(10, 'LITERAL_STRING', campsinfo[renderedclanid].info.name..language.campss)
                PromptSetActiveGroupThisFrame(prompts, label)
                if Citizen.InvokeNative(0xC92AC953F0A982AE,openmenu) then
                    globalclanid = getclan()
                    activeclanid = renderedclanid
                    if getinmenu() then 
                        if campsinfo[renderedclanid] ~= nil then 
                            if campsinfo[renderedclanid].info.leader == charid then 
                                status = "leader"
                            elseif containsmember(campsinfo[renderedclanid].info.members, charid) then 
                                status = "member"
                            else
                                status = "none"
                            end
                            if status == "none" then 
                                iscampraided = false 
                                iscampopen = false 
                                checking = true 
                                TriggerServerEvent("syn_clan:getcampraid",renderedclanid)
                                while checking do 
                                    Wait(100)
                                end
                            end

                            if not allowlockpick and not startedtimer and not allowlockpick then 
                                TriggerServerEvent("syn_clan:activemenu",activeclanid,true)
                                inmenu = true
                                standstill()
                                campmenu()
                            elseif allowlockpick and radiedclanid ~= nil and radiedclanid == activeclanid then 
                                haslockpickitem = false 
                                checking = true 
                                TriggerServerEvent("syn_clan:checkitemlockpick")
                                while checking do
                                    Wait(100)
                                end
                                if haslockpickitem then
                                    ingame = true  
                                    local res = exports["lockpick"]:lockpick()
						    		if res then 
                                        allowlockpick = false 
                                        lockpicktimer = nil 
                                        TriggerServerEvent("syn_clan:opencamp",renderedclanid)
                                        TriggerEvent("vorp:TipBottom", language.campunlocked, 6000)
                                        radiedclanid = nil 
                                    else
                                        TriggerServerEvent("syn_clan:removeitem")
                                    end
                                    ingame = false 
                                else
                                    TriggerEvent("vorp:TipBottom", language.missingitem, 6000)
                                    Wait(500)
                                end
                            end
                        end
                    else
                        TriggerEvent("vorp:TipBottom", language.menuinuse, 6000)
                        Wait(5000)
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end        
    end
end)
-- logic for relocating camp
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if isrelocating then 
            sleep = false 
            drawtext(language.reloccommand..Config.relocatecommand, 0.15, 0.19, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
        end
        if sleep then 
            Wait(500)
        end
    end
end)

-- loop for checking and processing poison 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true
        if poisoned then 
            sleep = false
            if ticker > Config.ticksuntilwalk then 
                if not IsEntityPlayingAnim(PlayerPedId(), "amb_wander@upperbody_idles@sick@both_arms@male_a@idle_a","idle_c", 3) then 
                    RequestAnimDict('amb_wander@upperbody_idles@sick@both_arms@male_a@idle_a')
                    while not HasAnimDictLoaded('amb_wander@upperbody_idles@sick@both_arms@male_a@idle_a') do
                        Citizen.Wait(100)
                    end
                    TaskPlayAnim(PlayerPedId(), "amb_wander@upperbody_idles@sick@both_arms@male_a@idle_a", "idle_c", 5.0, 5.0, -1, 31, 0)
                end
            end
            if Config.disablepoisonondeath then 
                if IsEntityDead(PlayerPedId()) then 
                    AnimpostfxStop("DEADEYE")
                    ticker = 0 
                    poisoned = false 
                    TriggerServerEvent("syn_clan:removepoison")
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true
        if poisoned then 
            sleep = false 
            Wait(Config.poisonticktime*1000)
            local health = GetEntityHealth(PlayerPedId())
            local maxhealth = GetEntityMaxHealth(PlayerPedId())
            local rate = maxhealth/Config.healthloss
            local newhealth = health - rate
            ticker = ticker+1
            if Config.enablehealthdamage  then 
                if ticker > Config.clickstilldamage then 
                    if not Config.lethal then 
                        if 100.0 >= newhealth then 
                            newhealth = 100
                        end
                    end
                    SetEntityHealth(PlayerPedId(),ToInteger(newhealth),nil)
                end
            end
            if not effectapplied then 
                if ticker > Config.visualclicks then 
                    effectapplied = true 
                    ScreenEffect("DEADEYE",1.0)
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
---------------------------------- Command  BOOKMARK
-- view invites
RegisterCommand(Config.viewinvites, function(source, args, rawCommand)
    viewinvites()
end)

AddEventHandler("syn_scene:stopscene", function(x)
    allllow = x 
end)

-- command to confirm relocation
RegisterCommand(Config.relocatecommand, function(source, args, rawCommand)
    if isrelocating then 
        local coords = GetEntityCoords(PlayerPedId())
        local town = Citizen.InvokeNative(0x43AD8FC02B429D33, coords, 1)
        local spawnable = vector3(0, 0, 0)
        local spawnable2 = vector3(0, 0, 0)
        local nothing, roadpoint = GetClosestRoad(coords.x,coords.y,coords.z,0.0,25,spawnable,spawnable2,0,0,0.0,true)
        local disttoroad = GetDistanceBetweenCoords(coords,roadpoint, false)
        if disttoroad >= Config.roaddistcheck then 
            if isregionaccepted(coords) then 
                if not closetomissionpoint(coords) then 
                    if not istownbanned(town) and allllow then
                        if  not tooclose(camps,coords) then
                            if  not IsEntityInWater(PlayerPedId()) then 
                                isrelocating = false 
                                inmenu = false 
                                TriggerServerEvent("syn_clan:activemenu",relocateid,false)
                                TriggerServerEvent("syn_clan:confirmrelocate",relocateid,coords)
                                constructanim()
                            else
                                TriggerEvent("vorp:TipBottom", language.inwater, 6000)
                            end
                        else
                            TriggerEvent("vorp:TipBottom", language.closecamp, 6000)
                        end
                    else
                        TriggerEvent("vorp:TipBottom", language.closetown, 6000)
                    end
                else
                    TriggerEvent("vorp:TipBottom", language.closemission, 6000)
                end
            else
                TriggerEvent("vorp:TipBottom", language.outsidezone, 6000)
            end
        else
            TriggerEvent("vorp:TipBottom", language.closeroad, 6000)
        end
    end
end, false)
if Config.debug then 
    RegisterCommand("hunt", function(source, args, rawCommand)
        local playerCoords = GetEntityCoords(PlayerPedId()) 
         local farm2 = GetHashKey(args[1])       
         RequestModel(farm2)
         while not HasModelLoaded(farm2) do
             Wait(10)
         end
        farm2 = CreatePed(args[1], playerCoords.x, playerCoords.y, playerCoords.z, true, true, true)
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, 1, 0)
        SetBlockingOfNonTemporaryEvents(farm2, true)
    end, false)
end

------------------------------------ EVENTS BOOKMARK
RegisterNetEvent('syn_clan:recsupplycooldown')
AddEventHandler('syn_clan:recsupplycooldown', function(x,y)
    supplycooldown = x 
    deliverycooldown = y
    checking = false 
end)
RegisterNetEvent('syn_clan:cleansepoison')
AddEventHandler('syn_clan:cleansepoison', function()
    TriggerEvent("vorp_inventory:CloseInv")
    TriggerServerEvent("syn_clan:removepoison")
    ticker = 0 
    poisoned = false 
    local propEntity = CreateObject(`p_bottlejd01x`, GetEntityCoords(PlayerPedId()), false, true, false, false, true)
    local anim = TaskItemInteraction_2(PlayerPedId(), -1199896558, propEntity, GetHashKey('p_bottleJD01x_ph_r_hand'), GetHashKey('DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_TABLE_HOLD'), 1, 0, -1.0)
    Wait(5000)
    AnimpostfxStop("DEADEYE")
    DeleteEntity(propEntity)
    Wait(5000)
    ClearPedTasks(PlayerPedId())
    ClearPedSecondaryTask(PlayerPedId())
end)
RegisterNetEvent('syn_clan:cookstew')
AddEventHandler('syn_clan:cookstew', function()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    Wait(10000)
    ClearPedTasks(PlayerPedId())
end)
RegisterNetEvent('syn_clan:recwagoninfo')
AddEventHandler('syn_clan:recwagoninfo', function(x)
    wagoninfo = x 
end)

RegisterNetEvent("syn_clan:recplayerfurni")
AddEventHandler("syn_clan:recplayerfurni", function(playerfurniitems)
    furnilist(playerfurniitems)
end)
TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)

AddEventHandler('menuapi:closemenu', function()
    closemenu()
end)

AddEventHandler("syn:closeinv", function()
    closemenu()
    TriggerServerEvent("syn_clan:activemenu",globalclanid,false)
end)
RegisterNetEvent('syn_clan:recactive')
AddEventHandler('syn_clan:recactive', function(x)
    activemenu = x 
end)

RegisterNetEvent("syn_clan:relocate")
AddEventHandler("syn_clan:relocate", function(id,state)
    if state then 
        relocateid = id 
        isrelocating = state 
    else
        inmenu = state 
        TriggerServerEvent("syn_clan:activemenu",id,state)
    end

end)


RegisterNetEvent("syn_clan:getdrunk")
AddEventHandler("syn_clan:getdrunk", function(effect,duration,drunkness)
    AnimpostfxStop(lasteffect)
    lasteffect = effect
    ScreenEffect(effect,duration)
    Citizen.InvokeNative(0x406CCF555B04FAD3 , PlayerPedId(), 1,drunkness)
end)


-- update clan blip info
RegisterNetEvent("syn_clan:blip")
AddEventHandler("syn_clan:blip", function()
    globalclanid = getclan()
    if globalclanid ~= 0 then 
        local mycampinfo = campsinfo[globalclanid]
        if mycampinfo ~= nil and next(mycampinfo) ~= nil then 
            local coords = mycampinfo.info.coords
            local name = mycampinfo.info.name
            local colorindex = mycampinfo.info.bcolor
            local color = miscinfo.blipcolors[colorindex]
            RemoveBlip(blip)
            blip = N_0x554d9d53f696d002(1664425300, coords.x, coords.y, coords.z)
            SetBlipSprite(blip, Config.blip, 1)
            SetBlipScale(blip, 0.8)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, name)
            Citizen.InvokeNative(0x662D364ABF16DE2F,blip,GetHashKey(color))
        end
    end
end)
-- remove blip
RegisterNetEvent("syn_clan:removeblip")
AddEventHandler("syn_clan:removeblip", function(clanid)
    if globalclanid ~= clanid then 
        RemoveBlip(tempblip[clanid])
    else
        RemoveBlip(blip)
    end
    RemoveBlip(bliparea[clanid])
end)

-- recieve updates from server
RegisterNetEvent('syn_clan:recfullinfo')
AddEventHandler('syn_clan:recfullinfo', function(y,z)
    locational = y
    campsinfo = z
    TriggerEvent("syn_clan:blip")
end)

RegisterNetEvent('syn_clan:requestwagons')
AddEventHandler('syn_clan:requestwagons', function(x,a)
    supplymissionactivewagons = x 
    deliverywagonsactive = a
end)

RegisterNetEvent('syn_clan:recspeinfo')
AddEventHandler('syn_clan:recspeinfo', function(y,z,id)
    if y ~= 0 then 
        locational[id] = y
    end
    if z ~= 0 then 
        campsinfo[id] = z
    end
    waitingforinfo = false 
end)
RegisterNetEvent('syn_clan:reclocationinfo')
AddEventHandler('syn_clan:reclocationinfo', function(x,y,z)
    camplocations = x 
end)

-- recieve player clothing data
RegisterNetEvent('syn_clan:recclothes')
AddEventHandler('syn_clan:recclothes', function(x,y)
    playerclothes = x 
    playerskin = y 
end)
-- recieve list of player horses
RegisterNetEvent('syn_clan:rechorses')
AddEventHandler('syn_clan:rechorses', function(x,y)
    playerhorses = x 
    playerwagons = y
end)
-- recieve clan id 
RegisterNetEvent("syn_clan:recclan")
AddEventHandler("syn_clan:recclan", function(x)
    clanid = x
end)

-- recieve clan id 
RegisterNetEvent("syn_clan:recinvite")
AddEventHandler("syn_clan:recinvite", function(clanid,clanname)
    claninvites[clanname] = clanid
end)
-- get the user's character id 
RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(x)
    charid = x 
    TriggerServerEvent("syn_clan:signclanid",charid)

    Wait(1000)
    globalclanid = getclan()
    TriggerServerEvent("syn_clan:requestfullinfo",charid)


    
    if Config.saveserver then 
        Wait(10000)
        TriggerServerEvent("syn_clan:getpoison",charid)
    end

end)

RegisterNetEvent('syn_clan:recinfo2')
AddEventHandler('syn_clan:recinfo2', function(x)
    charid = x 
    TriggerServerEvent("syn_clan:signclanid",charid)
    Wait(1000)
    globalclanid = getclan()
    TriggerServerEvent("syn_clan:requestfullinfo",charid)
    if Config.saveserver then 
        TriggerServerEvent("syn_clan:getpoison",charid)
    end
end)
RegisterNetEvent('syn_clan:recpoison')
AddEventHandler('syn_clan:recpoison', function(x)
    poisoned = x
end)

-- logic of comparing camp locations to make sure they are not being put in cities and are far apart from each other
RegisterNetEvent("syn_clan:useflag")
AddEventHandler("syn_clan:useflag", function(x)
    camps = x 
    TriggerEvent("vorp_inventory:CloseInv")
    local coords = GetEntityCoords(PlayerPedId())
    local town = Citizen.InvokeNative(0x43AD8FC02B429D33, coords, 1)
    local spawnable = vector3(0, 0, 0)
    local spawnable2 = vector3(0, 0, 0)
    local nothing, roadpoint = GetClosestRoad(coords.x,coords.y,coords.z,0.0,25,spawnable,spawnable2,0,0,0.0,true)
    local disttoroad = GetDistanceBetweenCoords(coords,roadpoint, false)
    if disttoroad >= Config.roaddistcheck then 
        if isregionaccepted(coords) then 
            if not closetomissionpoint(coords) then
                if not istownbanned(town) and allllow then
                    if  not tooclose(camps,coords) then
                        if  not IsEntityInWater(PlayerPedId()) then 
                            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.clanname, function(cb)
	            		    	local name =     tostring(cb)
                                if name ~= nil and name ~= "" then
                                    constructanim()
                                    TriggerServerEvent("syn_clan:createclan",coords,name)
                                end
                            end)
                        else
                            TriggerEvent("vorp:TipBottom", language.inwater, 6000)
                        end
                    else
                        TriggerEvent("vorp:TipBottom", language.closecamp, 6000)
                    end
                else
                    TriggerEvent("vorp:TipBottom", language.closetown, 6000)
                end
            else
                TriggerEvent("vorp:TipBottom", language.closemission, 6000)
            end
        else
            TriggerEvent("vorp:TipBottom", language.outsidezone, 6000)
        end
    else
        TriggerEvent("vorp:TipBottom", language.closeroad, 6000)
    end
end)

RegisterNetEvent("syn_clan:removeallfurni")
AddEventHandler("syn_clan:removeallfurni", function(clanid)
    if renderedobjects[clanid] ~= nil and next(renderedobjects[clanid]) ~= nil and render[clanid] ~= nil and render[clanid] == true then 
        for x,y in pairs(renderedobjects[clanid]) do
            if y.cata == "prop" then 
                SetEntityAsMissionEntity(y.object)
                DeleteObject(y.object)
                renderedobjects[clanid][x] = nil 
            elseif y.cata == "set" then 
                Citizen.InvokeNative(0x58AC173A55D9D7B4,y.object,1,1)
                renderedobjects[clanid][x] = nil 
            end
        end
        Wait(500)
        MenuData.CloseAll()
        campsinfo[renderedclanid] = {}
        renderedclanid = 0
        render[clanid] = false  
    end
end)


------------------------------------ MENU BOOKMARK

function outfitsmenu()
	MenuData.CloseAll()
	local elements = {
    }
    for k,v in pairs(playerclothes) do 
        table.insert (elements , {label = v.title, value = v.comps , desc =  v.id })
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.wardrobe,
		subtext    = "",
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
        manageoutfit(data.current)
	end,
	function(data, menu)
		menu.close()
	end)
end


function manageoutfit(outfitinfo)
	MenuData.CloseAll()
	local elements = {
        {label = language.puton, value = "puton" , desc =  language.puton2},
        {label = language.delout, value = "del" , desc =  language.delout2},

    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.wardrobe,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "outfitsmenu",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        elseif (data.current.value == 'puton') then
            local outfit = json.encode(outfitinfo.value)
            changeclothinganim()
            SetPlayerComponent(json.decode(outfit),json.decode(playerskin))
            TriggerServerEvent("syn_clan:setoutfit", outfit)
            closemenu()
        elseif (data.current.value == 'del') then
            TriggerServerEvent("syn_clan:deloutfit", outfitinfo.desc)
            closemenu()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function viewinvites()
	local elements = {  
    }
    for k,v in pairs(claninvites) do 
        table.insert( elements,{label = k, value = v , desc = language.joinclan})
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.claninvites,
		subtext    = language.claninvites2,
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
		if(data.current) then
            local clanid = data.current.value
            local clanname = data.current.label
            confirminvite(clanid,clanname)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function confirminvite(clanid,clanname)
	MenuData.CloseAll()
	local elements = {
        {label = language.accept, value = 'accept' , desc = language.accept2},
        {label = language.decline, value = 'decline' , desc = language.decline2}
    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.claninvites,
		subtext    = language.claninvites2,
		align    = 'top-left',
		elements = elements,
        lastmenu = "viewinvites",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
		if(data.current.value == 'accept') then
			TriggerServerEvent("syn_clan:acceptclaninvite",clanid,clanname)
            claninvites[clanname] = nil
            viewinvites()
		end
        if(data.current.value == 'decline') then
			claninvites[clanname] = nil
            viewinvites()
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function furnilist(playerfurniitems)
	MenuData.CloseAll()
    local clan = campsinfo[renderedclanid]
	local elements = {
    }
    for k,v in pairs(playerfurniitems) do 
        table.insert( elements,{label = v.label, value = k , desc = language.countitem..v.count})
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = language.clanid..activeclanid,
		align    = 'top-left',
		elements = elements,
        lastmenu = "furni",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else
            TriggerServerEvent("syn_clan:addfurniture",playerfurniitems[data.current.value],activeclanid)
            closemenu()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

-- main camp menu 
function campmenu()
	MenuData.CloseAll()
    local clan = campsinfo[renderedclanid]
    local restartperday = Config.restatsperday
    if restartperday == nil then 
        restartperday = 1
    end
	local elements = {
    }
    local info = campsinfo[renderedclanid].info
    if status == "leader" or status == "member" then 
        table.insert( elements,{label = language.ledger2, value = 'ledger' , desc = language.manageledger})
        table.insert( elements,{label = language.managemembers, value = 'members' , desc = language.managemembers2})
        table.insert( elements,{label = language.furniture, value = 'furni' , desc = language.furniture2})
    end
    if status == "leader" then 
        table.insert( elements,{label = language.blipinfo, value = 'blipinfo' , desc = language.blipinfo2})
        table.insert( elements,{label = language.movecamp, value = 'relocate' , desc = language.relocate})
        table.insert( elements,{label = language.disband, value = 'disband' , desc = language.disband2})
        if Config.allowuserwebhook then 
            table.insert( elements,{label = language.addwebhook, value = 'webhook' , desc = language.discordwebhook})
        end
    end
    if status == "member" then
        table.insert( elements,{label = language.leaveclan, value = 'leave' , desc = language.leaveclan2})
    end
    if Config.rading and status == "none" and not beingraided then 
        if not iscampraided then 
            if info.raid == 0 or Config.raidcooldown == false then 
                local canraid = true 
                if Config.campownerraidonly then 
                    if globalclanid == 0 then 
                        canraid = false 
                    end
                end
                if canraid then 
                    table.insert( elements,{label = language.raidcamp, value = 'raidcamp' , desc = language.raidcamp2})
                end
            else
                table.insert( elements,{label = language.raided, value = 'raided' , desc = language.raided2})
            end
        elseif iscampopen then 
            table.insert( elements,{label = language.takecash..campsinfo[renderedclanid].cash, value = 'takecash' , desc = ""})
            if campsinfo[renderedclanid].invlimit ~= 0 then 
                table.insert( elements,{label = language.openinv, value = 'openinv' , desc = ""})
            end

        end
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = language.clanid..activeclanid.."<br>"..language.daysup..(ToInteger(info.lifecycle/restartperday)),
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
        if(data.current.value == 'takecash') then
            if tonumber(campsinfo[renderedclanid].cash) > 0 then 
                TriggerServerEvent("syn_clan:takeallcash", renderedclanid)
            else
                TriggerEvent("vorp:TipBottom", language.nothingtotake, 6000)
            end
            closemenu()
		end
        if(data.current.value == 'openinv') then
            MenuData.CloseAll()
            TriggerServerEvent("syn_clan:reloadCampInventory", renderedclanid)
            TriggerEvent("vorp_inventory:OpenClanInventory", language.campstorage, renderedclanid,campsinfo[renderedclanid].invlimit)
		end
        if(data.current.value == 'raidcamp') then
            closemenu()
            TriggerServerEvent("syn_clan:checktoraid",activeclanid)
		end
		if(data.current.value == 'leave') then
            confirmleave()
		end
        if(data.current.value == 'blipinfo') then
            blipinfo()
		end
        if(data.current.value == 'furni') then
            furni()
		end
        if(data.current.value == 'ledger') then
            manageledger()
		end
        if(data.current.value == 'members') then
            managemembers()
		end
        if(data.current.value == 'disband') then
            disbandclan()
		end
        if(data.current.value == 'relocate') then
            FreezeEntityPosition(PlayerPedId(),false)
	        ClearPedTasks(PlayerPedId())
            MenuData.CloseAll()
            TriggerServerEvent("syn_clan:relocationrequest",activeclanid)
		end
        if(data.current.value == 'webhook') then
            closemenu()
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.webhook, function(cb)
				local webhook =     tostring(cb)
                if webhook ~= nil and webhook ~= "" and searchfun(webhook) then
                    TriggerServerEvent("syn_clan:addwebhook",activeclanid,webhook)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidformat, 6000)
                end
            end)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function confirmleave()
	MenuData.CloseAll()
    local clan = campsinfo[renderedclanid]
	local elements = {
        {label = language.yes, value = 'yes'  , desc = ''},
        {label = language.no, value = 'no'  , desc = ''}
    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.areyousure,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "campmenu",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
		if(data.current.value == 'yes') then
            closemenu()
            TriggerServerEvent("syn_clan:leaveclan",activeclanid)
		end

        if(data.current.value == 'no') then
			campmenu()
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function managefurni()
	MenuData.CloseAll()
    local clan = campsinfo[renderedclanid]
	local elements = {
    }
    for k,v in pairs(clan.info.furni) do 
        if v.prop ~= Config.clanflagprop then 
            if v.active then 
                table.insert( elements,{label = "<span style=color:Green;> "..v.label.."</span>", value = k , desc = language.furniid..v.id.." <br> "..language.active..tostring(v.active)})
            else
                table.insert( elements,{label = "<span style=color:Red;> "..v.label.."</span>", value = k , desc = language.furniid..v.id.." <br> "..language.active..tostring(v.active)})
            end
        end
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = language.clanid..activeclanid,
		align    = 'top-left',
		elements = elements,
        lastmenu = "furni",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else
            managepiece(clan.info.furni[data.current.value])
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function managepiece(piece)
	MenuData.CloseAll()
    pieceselected = true 
    movedpiece = piece 
    local clan = campsinfo[renderedclanid]
	local elements = {
        {label = language.movepiece, value = 'move'  , desc = language.movepiece2},
        {label = language.removepiece, value = 'remove'  , desc = language.removepiece2},
    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = language.active..tostring(piece.active),
		align    = 'top-left',
		elements = elements,
        lastmenu = "furni",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
            pieceselected = false 
        end
        if(data.current.value == 'remove') then
            closemenu()
            TriggerServerEvent("syn_clan:removefurnipiece",activeclanid,piece.id,piece.item)
            pieceselected = false 
            Reload = true
        end
        if(data.current.value == 'move') then
            if piece.active then 
                TriggerServerEvent("syn_clan:ismoving",activeclanid,piece.id)
            end
            FreezeEntityPosition(PlayerPedId(),false)
	        ClearPedTasks(PlayerPedId())
            MenuData.CloseAll()
            pieceselected = false 
            ismoving = true 
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function furni()
	MenuData.CloseAll()
    local clan = campsinfo[renderedclanid]
	local elements = {
        {label = language.addfurni, value = 'addfurni'  , desc = ''},
        {label = language.managefurni, value = 'managefurni'  , desc = ''},
    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = language.clanid..activeclanid,
		align    = 'top-left',
		elements = elements,
        lastmenu = "campmenu",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
		if(data.current.value == 'addfurni') then
            TriggerServerEvent("syn_clan:getplayerfurni")
            MenuData.CloseAll()
		end
        if(data.current.value == 'managefurni') then
            managefurni()
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function disbandclan()
	MenuData.CloseAll()
    local clan = campsinfo[renderedclanid]
	local elements = {
        {label = language.yes, value = 'yes'  , desc = ''},
        {label = language.no, value = 'no'  , desc = ''}
    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.areyousure,
		subtext    = language.warning,
		align    = 'top-left',
		elements = elements,
        lastmenu = "campmenu",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
		if(data.current.value == 'yes') then
            TriggerServerEvent("syn_clan:deleteclan",activeclanid)
            closemenu()
		end

        if(data.current.value == 'no') then
			campmenu()
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function managemembers()
	MenuData.CloseAll()
    local clan = campsinfo[renderedclanid]
    local members = clan.info.members
	local elements = {
    }
    if status == "leader" then 
        table.insert( elements,{label = language.invite, value = 'invite' , desc = language.invite2})
    end
    table.insert( elements,{label = language.viewmembers, value = 'viewmembers' , desc = language.viewmembers2})
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = language.membercount..#members,
		align    = 'top-left',
		elements = elements,
        lastmenu = "campmenu",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
		if(data.current.value == 'invite') then
			TriggerEvent("syn_inputs:sendinputs", language.confirm, language.serverid, function(cb)
				local id =     ToInteger(tonumber(cb))
                if id ~= nil and id ~= "" and id > 0 then
                    TriggerServerEvent("syn_clan:invitetoclan",activeclanid,id)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                end
            end)
            closemenu()
		end

        if(data.current.value == 'viewmembers') then
			viewmembers()
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function viewmembers()
	MenuData.CloseAll()
    local clan = campsinfo[renderedclanid]
    local members = clan.info.members
	local elements = {
    }
    if status == "leader" then 
        for k,v in pairs(members) do 
            table.insert( elements,{label = v.name, value = v.charid  , desc = language.selectforoptions})
        end
    else
        for k,v in pairs(members) do 
            table.insert( elements,{label = v.name, value = nil , desc = ""})
        end
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = language.membercount..#members,
		align    = 'top-left',
		elements = elements,
        lastmenu = "managemembers",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        elseif data.current.value ~= nil then 
            membersoptions(data.current.value,data.current.label)
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function membersoptions(charidx,charnamex)
	MenuData.CloseAll()
    local clan = campsinfo[renderedclanid]
    local members = clan.info.members
	local elements = {
        {label = language.kick, value = "kick"  , desc = language.kick2},
        {label = language.transfer, value = "transfer"  , desc = language.transfer2}
    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = charnamex,
		align    = 'top-left',
		elements = elements,
        lastmenu = "managemembers",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else 
            confirmoptions(charidx,charnamex,data.current.value)
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function confirmoptions(charid,charname,value)
	MenuData.CloseAll()
	local elements = {
        {label = language.yes, value = 'yes'  , desc = ''},
        {label = language.no, value = 'no'  , desc = ''}
    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = language.areyousure,
		align    = 'top-left',
		elements = elements,
        lastmenu = "viewmembers",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
        if(data.current.value == 'yes') then
            if value == "kick" then 
                TriggerServerEvent("syn_clan:removemember",charid,charname,activeclanid)
                closemenu()
            elseif value == "transfer" then 
                TriggerServerEvent("syn_clan:transferleader",charid,charname,activeclanid)
                closemenu()
            end
        end
        if(data.current.value == 'no') then
            viewmembers()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function manageledger()
	MenuData.CloseAll()
    local clan = campsinfo[renderedclanid]
	local elements = {
        {label = language.withdraw, value = 'withdraw' , desc = language.withdraw2},
        {label = language.deposit, value = 'deposit' , desc = language.deposit2},
    }
    if clan.taxmoney ~= 0 then 
        table.insert( elements,{label = language.taxmoney..round(clan.taxmoney,2), value = 'tax' , desc = language.taxmoney2..language.taxmoney3..Config.taxcost})
    else
        table.insert( elements,{label = language.taxmoney.."<span style=color:Red;> "..clan.taxmoney.."</span>", value = 'tax' , desc = language.taxmoney2..language.taxmoney3..Config.taxcost})
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = language.ledger.."<span style=color:Green;> "..round(clan.cash,2).."</span>",
		align    = 'top-left',
		elements = elements,
        lastmenu = "campmenu",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
		if(data.current.value == 'withdraw') then
			TriggerEvent("syn_inputs:sendinputs", language.confirm, language.amount, function(cb)
				local amount =     round(tonumber(cb), 2)
                if amount ~= nil and amount ~= "" and amount > 0 then
                    TriggerServerEvent("syn_clan:withdraw",activeclanid,amount)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                end
            end)
            closemenu()
		end
        if(data.current.value == 'deposit') then
			TriggerEvent("syn_inputs:sendinputs", language.confirm, language.amount, function(cb)
				local amount =     round(tonumber(cb), 2)
                if amount ~= nil and amount ~= "" and amount > 0 then
                    TriggerServerEvent("syn_clan:deposit",activeclanid,amount)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                end
            end)
            closemenu()
		end
        if(data.current.value == 'tax') then
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.amount, function(cb)
				local amount =     round(tonumber(cb), 2)
                if amount ~= nil and amount ~= "" and amount > 0 then
                    if Config.allocationlimit >= amount then 
                        TriggerServerEvent("syn_clan:addtaxmoney",activeclanid,amount)
                    else
                        TriggerEvent("vorp:TipBottom", language.allowcationlimit..Config.allocationlimit, 6000)
                    end
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                end
            end)
            closemenu()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function blipinfo()
	MenuData.CloseAll()
    local info = campsinfo[renderedclanid].info
    local name = info.name
    local colorindex = info.bcolor - 1
	local elements = {
        {label = language.changename, value = 'name' , desc = language.cngname},
        {label = language.blipcolor,tag = "bcolor", value = colorindex  ,desc = language.changeblip , type = "slider" , min =0 , max =keysx(miscinfo.blipcolors)-1, hop= 1},
        {label = language.confirm, value = 'confirm' , desc = language.cost..Config.changeblipcost}
    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.campmenu,
		subtext    = '',
		align    = 'top-left',
		elements = elements,
        lastmenu = "campmenu",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
		if(data.current.value == 'name') then
			TriggerEvent("syn_inputs:sendinputs", language.confirm, language.clanname, function(cb)
				local namex =     tostring(cb)
                if namex ~= nil and namex ~= "" then
                    name = namex
                end
            end)
		end
        if(data.current.tag == 'bcolor') then
            colorindex = data.current.value+1
            Citizen.InvokeNative(0x662D364ABF16DE2F,blip,GetHashKey(miscinfo.blipcolors[colorindex]))
        end
        if(data.current.value == 'confirm') then
            closemenu()
            TriggerServerEvent("syn_clan:saveclanblip",activeclanid,name,colorindex)
            notebookanim()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
-------------------------------Stewpot


function stewpotmenu()
    local info = campsinfo[renderedclanid].info
    local stewlevel = info.stewlevel
	MenuData.CloseAll()
	local elements = {
    }
    if stewlevel > 0 then 
        table.insert (elements , {label = language.havestew..Config.stewpot[stewlevel].name, value = "havestew" , desc =  "" })
    else
        table.insert (elements , {label = language.preparestew, value = "preparestew" , desc =  language.preparestew2 })
    end
    
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.stewpot,
		subtext    = "",
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
        if data.current.value == "havestew" then 
            closemenu()
            local stew = Config.stewpot[stewlevel]
            eatstew()
            Wait(5000)
            TriggerEvent("fred_meta:consume",stew.stats.hunger,stew.stats.thirst,stew.stats.metabolism,stew.stats.innercorestamina,stew.stats.innercorestaminagold,stew.stats.outercorestaminagold,stew.stats.innercorehealth,stew.stats.innercorehealthgold,stew.stats.outercorehealthgold)
        end
        if data.current.value == "preparestew" then 
            preparestew()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function preparestew()
	MenuData.CloseAll()
	local elements = {
    }
    for k,v in pairs(Config.stewpot) do 
        table.insert(elements, {label = v.name, value = k , time = v.timeinminutes, desc =  language.havestew2..v.timeinminutes})
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.stewpot,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "stewpotmenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else 
            makestew(data.current.value,data.current.time)
        end
        
	end,
	function(data, menu)
		menu.close()
	end)
end

function makestew(level,time)
	MenuData.CloseAll()
	local elements = {
    }
    for k,v in pairs(Config.stewpot[level].recipie) do 
        table.insert(elements, {label = v.label, value = "" , desc = language.amount..": "..v.count})
    end
    table.insert(elements, {label =language.preparestew , value = "cook" , desc = language.havestew2..time})
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.stewpot[level].name,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "preparestew",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        elseif data.current.value == "cook" then 
            closemenu()
            TriggerServerEvent("syn_clan:stewitemcheck",renderedclanid,level)
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

------------------------------ WAGON




function checkstashmenu() -- find me 
	MenuData.CloseAll()
	local elements = {
    }
    for k,v in pairs(wagoninfo.stash) do 
        local nameofanimal = findanimalname(v.model,v.outfit,v.isskin,v.humanbody)
        table.insert(elements, {label = nameofanimal, value = v.animalnetwork , desc =  language.takeoutanimal,type = v.isskin, datax = v.data, human = v.humanbody } )
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.wagonstash,
		subtext    = "",
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
        MenuData.CloseAll()
        --local animal = NetToPed(data.current.value)
        --local cart = VehToNet(closewagon)
        local datax = data.current.datax
        local coords = GetEntityCoords(PlayerPedId())
        local anii = 0
        if not data.current.type then
            RequestModel(datax.model2)
		    while not HasModelLoaded(datax.model2) do
		    	Wait(50)
		    end
            while anii == 0 do
                anii = CreatePed(datax.model2, coords.x, coords.y, coords.z, 0, true, true)
                Wait(500)
            end
            SetEntityHealth(anii, 0, PlayerPedId())
            if not data.current.human then
                SetPedQuality(anii, datax.quality)
                SetPedDamageCleanliness(anii, datax.damage)
            else
                local networkanimal = NetworkGetNetworkIdFromEntity(anii)
                TriggerServerEvent("syn_clan:setnetworkstate",networkanimal,data.current.value)
                --Entity(anii).state.network = data.current.value -- newlinee
            end
            if datax.skinned then
                Citizen.InvokeNative(0x6BCF5F3D8FFE988D, anii, true)
                ApplyCarcasMetaTag(anii, datax.metatag)
                EquipMetaPedOutfit(anii, datax.outfit)
            else
                EquipMetaPedOutfit(anii, datax.outfit)
                UpdatePedVariation(anii)
            end
        else
            anii = CreateObject(datax.model2, coords.x, coords.y, coords.z, true, true, true, 0, 0)
            Citizen.InvokeNative(0x78B4567E18B54480, anii)                                                                       
            Citizen.InvokeNative(0xF0B4F759F35CC7F5, anii, Citizen.InvokeNative(0x34F008A7E48C496B, anii, 0), PlayerPedId(), 7, 512) 
            Citizen.InvokeNative(0x399657ED871B3A6C, anii, datax.peltquality)

            local networkanimal = NetworkGetNetworkIdFromEntity(anii)
            TriggerServerEvent("syn_clan:setnetworkstate",networkanimal,data.current.value)
            --Entity(anii).state.network = data.current.value -- newlinee
            Citizen.InvokeNative(0x18FF3110CF47115D, anii, 21, true) 
            TaskPickupCarriableEntity(PlayerPedId(), anii)
            SetEntityVisible(anii, false)
            FreezeEntityPosition(anii, true)

            TaskStatus(`SCRIPT_TASK_PICKUP_CARRIABLE_ENTITY`)

            FreezeEntityPosition(anii, false)
            SetEntityVisible(anii, true)
            Citizen.InvokeNative(0x18FF3110CF47115D, anii, 21, false) 
        end

        TriggerServerEvent("syn_clan:removeanimal",data.current.value,wagonserverid)

        local ratio = ((keysx(wagoninfo.stash)-1)/10) + 0.0
        if not Citizen.InvokeNative(0xD798DF5DB67B1659, closewagon) then 
            Citizen.InvokeNative(0x75F90E4051CC084C, closewagon, GetHashKey("pg_mp005_huntingWagonTarp01"))
            Citizen.InvokeNative(0x31F343383F19C987, closewagon, ratio, true)
        else
            Citizen.InvokeNative(0x31F343383F19C987, closewagon, ratio, true)
        end
        SetModelAsNoLongerNeeded(datax.model2)

        closemenu()
	end,
	function(data, menu)
		menu.close()
	end)
end

function stablemenu()
    local info = campsinfo[renderedclanid].info
	MenuData.CloseAll()
	local elements = {
        {label = language.ownedhorses, value = "myhorses" , desc =  language.ownedhorses2 },
        {label = language.ownedwagons, value = "mywagons" , desc =  language.ownedwagons2 },
    }
    if info.hwagon == 0 then 
        table.insert (elements , {label = language.buyhuntingwagon, value = "buyhuntingwagon" , desc =  language.price..Config.huntingwagoncost })
    else
        table.insert (elements , {label = language.callwagon, value = "callwagon" , desc =  language.callwagon2 })
    end
    
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.openstable,
		subtext    = "",
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
        if data.current.value == "myhorses" then 
            horsesmenu()
        end
        if data.current.value == "mywagons" then 
            wagonsmenu()
        end
        if data.current.value == "buyhuntingwagon" then 
            TriggerServerEvent("syn_clan:buywagon", renderedclanid)
            closemenu()
        end
        if data.current.value == "callwagon" then 
            closemenu()
            inmenu = true 
            callwagon = true 
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function wagonsmenu2(wagoninfo)
	MenuData.CloseAll()
	local elements = {
        {label = language.selecthorse, value = "select", desc = ""  },
        {label = language.changenamehorse, value = "changename" , desc =  "" }
    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.openstable,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "wagonsmenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
        if data.current.value == "select" then 
            if wagoninfo.selected ~= 1 then 
                TriggerServerEvent("syn_clan:setactivewagon", wagoninfo.id, wagoninfo.name)
                closemenu()
            else
                TriggerEvent("vorp:TipBottom", language.horsealreadyselected, 6000)
            end
        end
        if data.current.value == "changename" then 
            closemenu()
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.changenamehorse, function(cb)
				local newname =     tostring(cb)
                if newname ~= nil and newname ~= "" then
                    TriggerServerEvent("syn_clan:changename",wagoninfo.id,newname,"wagon")
                else
                    TriggerEvent("vorp:TipBottom", language.invalidformat, 6000)
                end
                
            end)
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function wagonsmenu()
	MenuData.CloseAll()
	local elements = {
    }
    for k,v in pairs(playerwagons) do 
        local selectedwagon = language.notselected
        if v.selected == 1 then 
            selectedwagon = language.selected
        end
        table.insert (elements , {label = v.name, value = v , desc =  selectedwagon })
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.openstable,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "stablemenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else
            wagonsmenu2(data.current.value)
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function horsesmenu()
	MenuData.CloseAll()
	local elements = {
    }
    for k,v in pairs(playerhorses) do 
        local selectedhorse = language.notselected
        if v.selected == 1 then 
            selectedhorse = language.selected
        end
        table.insert (elements , {label = v.name, value = v , desc =  selectedhorse })
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.openstable,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "stablemenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        else
            horsesmenu2(data.current.value)
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function horsesmenu2(horseinfo)
	MenuData.CloseAll()
	local elements = {
        {label = language.selecthorse, value = "select", desc = ""  },
        {label = language.changenamehorse, value = "changename" , desc =  "" }
    }
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.openstable,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "horsesmenu",
	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        end
        if data.current.value == "select" then 
            if horseinfo.selected ~= 1 then 
                TriggerServerEvent("syn_clan:setactivehorse", horseinfo.id, horseinfo.name)
                closemenu()
            else
                TriggerEvent("vorp:TipBottom", language.horsealreadyselected, 6000)
            end
        end
        if data.current.value == "changename" then 
            closemenu()
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.changenamehorse, function(cb)
				local newname =     tostring(cb)
                if newname ~= nil and newname ~= "" then
                    TriggerServerEvent("syn_clan:changename",horseinfo.id,newname,"horse")
                else
                    TriggerEvent("vorp:TipBottom", language.invalidformat, 6000)
                end
                
            end)
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function trappermenu()
	MenuData.CloseAll()
    local info = campsinfo[renderedclanid].info
    local maxstock = info.maxstock
    local material = info.material
    local stock = info.stock
    local supply = info.supply
	local elements = {}
    if (Config.stockprocessing*Config.supplyperstock) > supply then 
        table.insert(elements,{label = language.lowsupplies, value = "" , desc =  language.lowsupplies2..(Config.stockprocessing*Config.supplyperstock)..language.lowsupplies3})
    end
    table.insert(elements,{label = language.materials..round(material,2), value = "" , desc =  ""})
    table.insert(elements,{label = language.stock..round(stock,2).." / "..maxstock, value = "" , desc =  ""})
    table.insert(elements,{label = language.supply..supply, value = "" , desc =  ""})
    table.insert(elements,{label = language.buysupply, value = "buysupply" , desc =  Config.supplyprice..language.buysupply2})
    if not supplycooldown then 
        table.insert(elements,{label = language.supplymission, value = "supplymission" , desc =  language.supplymission2})
    end
    if not deliverycooldown then 
        if stock >= Config.smalldelivery then 
            table.insert(elements,{label = language.smalldelivery, value = "deliverymission" , type = "smalldelivery", desc =  language.deliveryinfo..Config.smalldelivery..language.deliveryinfo2})
        end
        if stock >= Config.middelivery then 
            table.insert(elements,{label = language.middelivery, value = "deliverymission" ,type = "middelivery", desc =  language.deliveryinfo..Config.middelivery..language.deliveryinfo2})
        end
        if stock >= Config.largedelivery then 
            table.insert(elements,{label = language.largedelivery, value = "deliverymission" ,type = "largedelivery", desc =  language.deliveryinfo..Config.largedelivery..language.deliveryinfo2})
        end
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = language.trapper,
		subtext    = "",
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
        if (data.current.value == 'buysupply') then
            closemenu()
            TriggerEvent("syn_inputs:sendinputs", language.confirm, language.amount, function(cb)
                local amount =     ToInteger(tonumber(cb))
                if amount ~= nil and amount ~= "" and amount ~= 0 and amount > 0 then
                    TriggerServerEvent("syn_clan:buysupplies",renderedclanid,amount)
                else
                    TriggerEvent("vorp:TipBottom", language.invalidamount, 6000)
                end
            end)
        end
        if (data.current.value == 'supplymission') then
            startsupplymission()
        end
        if (data.current.value == 'deliverymission') then
            missionstockcount = Config[data.current.type]
            missionlength = data.current.type
            checkingformissions = true
            TriggerServerEvent("syn_clan:getmissions","delivery")
            while  checkingformissions do 
                Wait(100)
            end
            local coords = GetEntityCoords(PlayerPedId())
            local region 
            local region2
            local region3
            local closest = 100000000000
            local distances = {}
            for k,v in pairs(Config.missionregion) do 
                local dist = GetDistanceBetweenCoords( coords,v.x,v.y,v.z , true)
                table.insert(distances,{k,dist})
            end
            distance = sorttable(distances)
            region = distances[1][1]
            region2 = distances[2][1]
            region3 = distances[3][1]
            if missionlength == "smalldelivery" then 
                selectedregion = region
            elseif missionlength == "middelivery" then
                selectedregion = region2
            elseif missionlength == "largedelivery" then
                selectedregion = region3
            end
            if next(missiontables[selectedregion]) == nil then 
                TriggerEvent("vorp:TipBottom", language.nomissionsavailable, 6000)
                closemenu()
            else
                FreezeEntityPosition(PlayerPedId(),false)
	            ClearPedTasks(PlayerPedId())
                MenuData.CloseAll()
                spawnmissionwagon = true
            end 
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if not ondeliverymission and next(deliverywagonsactive) ~= nil then 
            local wagon = GetVehiclePedIsEntering(PlayerPedId())
            if wagon ~= 0 then 
                local network = VehToNet(wagon)
                local model = GetEntityModel(wagon)
                local iscontained, info = vehnetworkcontained(deliverywagonsactive,network)
                if model == `wagon05x` and iscontained  then
                    local wagonblip = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, wagon)
                    SetBlipSprite(wagonblip,`blip_ambient_coach`,true)
                    Citizen.InvokeNative(0x662D364ABF16DE2F,wagonblip,`BLIP_MODIFIER_MP_COLOR_28`)
                    Citizen.InvokeNative(0x9CB1A1623062F402, wagonblip, info.reward..language.deliverywagon)
                    missionwagonnetwork = network
                    ondeliverymission = true 
                    missionstockcount = info.reward
                    occupiedregion = info.missionkeys[1]
                    occupiedrandom = info.missionkeys[2]
                    startdeliverymission(info.missionkeys)
                end
            end
        end
    end
end)

RegisterNetEvent('syn_clan:recmissioninfo')
AddEventHandler('syn_clan:recmissioninfo', function(x)
    missiontables = x
    checkingformissions = false 
end)
-- delivery mission
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if spawnmissionwagon then 
            local coords = GetEntityCoords(PlayerPedId())
            if renderedclanid ~= nil and campsinfo[renderedclanid] ~= nil and campsinfo[renderedclanid].info ~= nil then 
                local campcoords = campsinfo[renderedclanid].info.coords
                sleep = false 
                local dist = GetDistanceBetweenCoords(coords,campcoords.x,campcoords.y,campcoords.z, true)
                local label  = CreateVarString(10, 'LITERAL_STRING',language.wagonspawner)
                PromptSetActiveGroupThisFrame(prompts5, label)
                if Citizen.InvokeNative(0xC92AC953F0A982AE,callwagonprompt) then
                    if Config.render > dist then 
                        local randomizer = math.random(1,keysx(missiontables[selectedregion]))
                        occupiedregion = selectedregion
                        occupiedrandom = randomizer
                        TriggerServerEvent("syn_clan:takemissionout","delivery",occupiedregion,occupiedrandom)
                        local missionkeys = {selectedregion,randomizer}
                        DoScreenFadeOut(500)
	                    while IsScreenFadingOut() do
	                      Wait(0)
	                    end
                        local wagon = `wagon05x`
                        RequestModel(wagon)
                        while not HasModelLoaded(wagon) do
                            Citizen.Wait(0)
                        end
                        local wagon = CreateVehicle(wagon, coords.x+1, coords.y+1, coords.z, 0.0, true, true)
                        Citizen.InvokeNative(0xA91E6CF94404E8C9,wagon)
                        SetVehicleOnGroundProperly(wagon)
                        local network = NetworkGetNetworkIdFromEntity(wagon)
                        missionwagonnetwork = network 
                        local wagonblip = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, wagon)
                        SetBlipSprite(wagonblip,`blip_ambient_coach`,true)
                        Citizen.InvokeNative(0x662D364ABF16DE2F,wagonblip,`BLIP_MODIFIER_MP_COLOR_28`)
                        Citizen.InvokeNative(0x9CB1A1623062F402, wagonblip, missionstockcount..language.deliverywagon)
                        SetPedIntoVehicle(PlayerPedId(), wagon, -1)
                        DoScreenFadeIn(1000)
                        while IsScreenFadingIn() do
                            Wait(0)
                        end
                        ondeliverymission = true 
                        local wagoninfo = {network = network, reward = missionstockcount,missionkeys = missionkeys}
                        TriggerServerEvent("syn_clan:starteddelivery",renderedclanid) -- start cool down for delivery missions of camp
                        TriggerServerEvent("syn_clan:registerdeliverywagon",renderedclanid,wagoninfo)
                        startdeliverymission(missionkeys)
                        spawnmissionwagon = false 
                        closemenu()
                        SetModelAsNoLongerNeeded(wagon) 
                        --Citizen.InvokeNative(0xD80FAF919A2E56EA, wagon, -1742109836)

                    else
                        TriggerEvent("vorp:TipBottom", language.outofbounds, 6000)    
                    end
                end
            else
                sleep = false 
                drawtext(language.outofbounds, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)  
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
function startdeliverymission(missionkeys)
    TriggerEvent("vorp:TipBottom", language.deliverwagontosale, 6000)
    activedeliverymissioninfo = Config.deliverymissions[missionkeys[1]][missionkeys[2]]
    RemoveBlip(missionblip)
    ClearGpsMultiRoute()
    StartGpsMultiRoute(`COLOR_RED`, true, true)
    AddPointToGpsMultiRoute(activedeliverymissioninfo.coords.x, activedeliverymissioninfo.coords.y, activedeliverymissioninfo.coords.z)
    SetGpsMultiRouteRender(true)
    missionblip = N_0x554d9d53f696d002(1664425300, activedeliverymissioninfo.coords.x, activedeliverymissioninfo.coords.y, activedeliverymissioninfo.coords.z)
    SetBlipSprite(missionblip, Config.supplymissionblipspire, 1)
    SetBlipScale(missionblip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, missionblip, language.missionlocation)
    Citizen.InvokeNative(0x662D364ABF16DE2F,missionblip,0x6F85C3CE)
    deliverymissionrender = true 
end
------------------------------------------------ Misssions here 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local sleep = true 
        if deliverymissionrender then 
            sleep = false 
            local coords = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(coords,activedeliverymissioninfo.coords.x,activedeliverymissioninfo.coords.y,activedeliverymissioninfo.coords.z, true)
            if not locationreached2 then 
                if Config.locationdistancecheck > dist then 
                    if next(deliverywagonsactive) ~= nil and IsPedInAnyVehicle(PlayerPedId()) then 
                        local wagon = GetVehiclePedIsIn(PlayerPedId(),false)
                        local driver = Citizen.InvokeNative(0x2963B5C1637E8A27,wagon)
                        if PlayerPedId() == driver then
                            deliverywagonthatreached = wagon 
                            local network = VehToNet(wagon)
                            local model = GetEntityModel(wagon)
                            if  model == `wagon05x` and vehnetworkcontained(deliverywagonsactive,network) then
                                TriggerServerEvent("syn_clan:deliverywagonreached",network)
                                TriggerServerEvent("syn_clan:addmissionback","delivery",occupiedregion,occupiedrandom)
                                for k,v in pairs(deliverywagonsactive) do 
                                    if v.network == network then 
                                        deliverywagonsactive[k] = nil 
                                    end
                                end
                                locationreached2 = true 
                                RemoveBlip(missionblip)
                                ClearGpsMultiRoute()
                                spawnenemies(activedeliverymissioninfo.enemies)
                            end
                        end
                    end
                end
            end
            if enemiesspawned then 
                if Config.locationdistancecheck > dist then 
                    for k,v in pairs(enemies) do 
                        if IsEntityDead(v) then
                            enemies[k] = nil 
                        end
                    end
                    if next(enemies) == nil then 
                        local wagon = GetVehiclePedIsIn(PlayerPedId(),false)
                        drawtext(language.gotosell, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                        if wagon == deliverywagonthatreached then 
                            if whenKeyJustPressed(Config.keys["X"]) then
                                DoScreenFadeOut(500)
                                while IsScreenFadingOut() do
                                  Wait(0)
                                end
                                enemiesspawned = false 
                                while not NetworkHasControlOfEntity(wagon)  do
                                    Wait(100)
                                    NetworkRequestControlOfEntity(wagon)
                                end
                                SetEntityAsMissionEntity(wagon, true, true)
                                DeleteVehicle(wagon)
                                TriggerServerEvent("syn_clan:rewardsale",globalclanid,missionstockcount)
                                deliverymissionrender = false 
                                ondeliverymission = false 
                                locationreached2 = false  
                                for k,v in pairs(enemies) do 
                                    DeleteEntity(v)
                                end
                                for k,v in pairs(enemyhorses) do 
                                    DeleteEntity(v)
                                end
                                enemies = {}
                                RemoveBlip(missionblip)
                                ClearGpsMultiRoute()
                                Wait(500)
                                DoScreenFadeIn(1000)
                                while IsScreenFadingIn() do
                                    Wait(0)
                                end
                            end
                        end
                    end
                    if IsEntityDead(PlayerPedId()) then
                        enemiesspawned = false 
                        deliverymissionrender = false 
                        ondeliverymission = false 
                        locationreached2 = false  
                        for k,v in pairs(enemies) do 
                            DeleteEntity(v)
                        end
                        for k,v in pairs(enemyhorses) do 
                            DeleteEntity(v)
                        end
                        enemies = {}
                        RemoveBlip(missionblip)
                        ClearGpsMultiRoute()
                    end
                end
                if dist > Config.missionoverdistance then 
                    enemiesspawned = false 
                    deliverymissionrender = false 
                    ondeliverymission = false 
                    locationreached2 = false  
                    for k,v in pairs(enemies) do 
                        DeleteEntity(v)
                    end
                    for k,v in pairs(enemyhorses) do 
                        DeleteEntity(v)
                    end
                    enemies = {}
                    RemoveBlip(missionblip)
                    ClearGpsMultiRoute()
                    TriggerEvent("vorp:TipBottom", language.leftmissionarea, 6000)
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)

function startsupplymission()
    -- finding closest region
    local coords = GetEntityCoords(PlayerPedId())
    local region 
    local closest = 100000000000
    for k,v in pairs(Config.missionregion) do 
        local dist = GetDistanceBetweenCoords( coords,v.x,v.y,v.z , true)
        if closest > dist then 
            region = k
            closest = dist
        end
    end
    checkingformissions = true
    TriggerServerEvent("syn_clan:getmissions","supply")
    while  checkingformissions do 
        Wait(100)
    end
    closemenu()
    if next(missiontables[region]) == nil then 
        TriggerEvent("vorp:TipBottom", language.nomissionsavailable, 6000)
    else
        TriggerServerEvent("syn_clan:startedsupplymission",renderedclanid)
        local randomizer = math.random(1,keysx(missiontables[region]))
        occupiedregion = region
        occupiedrandom = randomizer
        TriggerServerEvent("syn_clan:takemissionout","supply",occupiedregion,occupiedrandom)
        -- ranomize mission based on pool of missions in the found closest region
        supplymission = missiontables[region][randomizer]
        local count = 0
        while  supplymission == nil do 
            local randomizer = math.random(1,keysx(missiontables[region]))
            supplymission = missiontables[region][randomizer]
            count = count + 1
            print("randomized again ",count)
            if count > 10 then 
                break
            end
        end
        -- build blip and start gps route to mission location
        RemoveBlip(missionblip)
        ClearGpsMultiRoute()
        StartGpsMultiRoute(`COLOR_RED`, true, true)
        print(json.encode(supplymission),region,randomizer,json.encode(missiontables))
        AddPointToGpsMultiRoute(supplymission.coords.x, supplymission.coords.y, supplymission.coords.z)
        SetGpsMultiRouteRender(true)
        missionblip = N_0x554d9d53f696d002(1664425300, supplymission.coords.x, supplymission.coords.y, supplymission.coords.z)
        SetBlipSprite(missionblip, Config.supplymissionblipspire, 1)
        SetBlipScale(missionblip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, missionblip, language.missionlocation)
        Citizen.InvokeNative(0x662D364ABF16DE2F,missionblip,0x6F85C3CE)
        supplymissionactive = true
    end 
end
-- supply mission 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local sleep = true 
        if supplymissionactive then 
            sleep = false 
            local coords = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(coords,supplymission.coords.x,supplymission.coords.y,supplymission.coords.z, false)
            if not locationreached then 
                if Config.locationdistancecheck > dist then 
                    print("location reached")
                    locationreached = true 
                    RemoveBlip(missionblip)
                    ClearGpsMultiRoute()
                    spawnenemies(supplymission.enemies)
                end
            end
            if enemiesspawned then
                if Config.locationdistancecheck > dist then  
                    for k,v in pairs(enemies) do 
                        if IsEntityDead(v) then
                            enemies[k] = nil 
                        end
                    end
                    if next(enemies) == nil then 
                        print(" all enemies dead ")
                        enemiesspawned = false 
                        TriggerServerEvent("syn_clan:addmissionback","supply",occupiedregion,occupiedrandom)
                        -- spawn wagon event
                        local wagon = `wagon05x`
                        RequestModel(wagon)
                        while not HasModelLoaded(wagon) do
                            Citizen.Wait(0)
                        end
                        local wagon = CreateVehicle(wagon, supplymission.coords.x, supplymission.coords.y, supplymission.coords.z, 0.0, true, true)
                        Citizen.InvokeNative(0xA91E6CF94404E8C9,wagon)
                        SetVehicleOnGroundProperly(wagon)
                        local network = NetworkGetNetworkIdFromEntity(wagon)

                        local wagonblip = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, wagon)
                        SetBlipSprite(wagonblip,`blip_ambient_coach`,true)
                        Citizen.InvokeNative(0x662D364ABF16DE2F,wagonblip,`BLIP_MODIFIER_MP_COLOR_28`)
                        Citizen.InvokeNative(0x9CB1A1623062F402, wagonblip, language.supplywagon)

                        local wagoninfo = {network = network, reward = supplymission.reward, itemreward = supplymission.itemreward}
                        TriggerServerEvent("syn_clan:sendsupplywagoninfo",wagoninfo)
                        TriggerEvent("vorp:TipBottom", language.deliverthewagon, 6000)
                        supplymissionactive = false 
                        locationreached = false 
                        supplymission = {}
                        enemies = {}
                        RemoveBlip(missionblip)
                        ClearGpsMultiRoute()
                        --Citizen.InvokeNative(0xD80FAF919A2E56EA, wagon, -1742109836)
                        SetModelAsNoLongerNeeded(wagon) 

                    end
                    if IsEntityDead(PlayerPedId()) then
                        print("player died")
                        enemiesspawned = false 
                        supplymissionactive = false 
                        locationreached = false 
                        supplymission = {}
                        for k,v in pairs(enemies) do 
                            DeleteEntity(v)
                        end
                        for k,v in pairs(enemyhorses) do 
                            DeleteEntity(v)
                        end
                        enemies = {}
                        RemoveBlip(missionblip)
                        ClearGpsMultiRoute()
                        TriggerServerEvent("syn_clan:addmissionback","supply",occupiedregion,occupiedrandom)
                    end
                end
                if dist > Config.missionoverdistance then 
                    print("player left area ",occupiedregion,occupiedrandom)
                    enemiesspawned = false 
                    supplymissionactive = false 
                    locationreached = false 
                    TriggerServerEvent("syn_clan:addmissionback","supply",occupiedregion,occupiedrandom)
                    supplymission = {}
                    for k,v in pairs(enemies) do 
                        DeleteEntity(v)
                    end
                    for k,v in pairs(enemyhorses) do 
                        DeleteEntity(v)
                    end
                    enemies = {}
                    RemoveBlip(missionblip)
                    ClearGpsMultiRoute()
                    TriggerEvent("vorp:TipBottom", language.leftmissionarea, 6000)
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
RegisterNetEvent('syn_clan:recsupplywagoninfo')
AddEventHandler('syn_clan:recsupplywagoninfo', function(key,info,type,net)
    if type == "supply" then 
        supplymissionactivewagons[key] = info 
    elseif type == "delivery" then 
        if deliverymissionrender then 
            if net == missionwagonnetwork then 
                missionwagonnetwork = nil
                deliverymissionrender = false 
                ondeliverymission = false 
                RemoveBlip(missionblip)
                ClearGpsMultiRoute()
            end
        end
        deliverywagonsactive[key] = info 
    end
end)
function spawnenemies(npcinfo)
    local relationgroup 
	for k,v in pairs(npcinfo) do 
		local model = GetHashKey(v.model)
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(50)
		end
		local createdped = 0
		while createdped == 0 do
			local heading = 0
			createdped = CreatePed(model,  v.x, v.y , v.z, heading, true, true, false, 0, 0)
			Wait(500)
		end
        Citizen.InvokeNative(0x283978A15512B2FE, createdped, true) 
        if relationgroup == nil then 
            relationgroup = Citizen.InvokeNative(0x7DBDD04862D95F04, createdped) -- get group hash 
        end
        Citizen.InvokeNative(0xC80A74AC829DDD92, createdped,relationgroup) -- set group hash 
        Citizen.InvokeNative(0x0EF1AFB18649E015, createdped,false,relationgroup) -- disable damage from group
        SetModelAsNoLongerNeeded(model)
        if v.horse ~= nil and v.horse ~= 0 then 
            local model = v.horse
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(50)
            end
            local horse = 0
            while horse == 0 do
                local heading = 0
                horse = CreatePed(model,  v.x, v.y , v.z, heading, true, true, false, 0, 0)
                Wait(500)
            end
            Citizen.InvokeNative(0x283978A15512B2FE, horse, true) 
            Citizen.InvokeNative(0xC80A74AC829DDD92, horse,relationgroup) -- set group hash 
            Citizen.InvokeNative(0x0EF1AFB18649E015, horse,false,relationgroup) -- disable damage from group
            Citizen.InvokeNative(0x028F76B6E78246EB,createdped,horse,-1,true) -- set ped on mount
            table.insert(enemyhorses,horse)
            SetModelAsNoLongerNeeded(model)
        end
        
		if Config.blipai then  
			Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped) 
		end
		SetPedCombatMovement(createdped,3)
		GiveWeaponToPed_2(createdped, v.weapon, 1000, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
		SetCurrentPedWeapon(createdped, v.weapon, true)
		SetPedCombatAttributes(createdped,46,true)
		TaskCombatPed(createdped, PlayerPedId())
		table.insert(enemies,createdped)
	end
	enemiesspawned = true 
end

----- Resource Stop Handler BOOKMARK
AddEventHandler("onResourceStop",function(resourceName)
    if resourceName == GetCurrentResourceName() then
        DoScreenFadeIn(1000)
        RemoveBlip(missionblip)
        ClearGpsMultiRoute()
        for k,v in pairs(enemies) do 
            DeleteEntity(v)
        end
        for k,v in pairs(enemyhorses) do 
            DeleteEntity(v)
        end
        if IsItemsetValid(itemSet) then
            Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet)
        end
            
        for k,v in pairs(renderedobjects) do
            for x,y in pairs(v) do 
                if y.cata == "prop" then 
                    SetEntityAsMissionEntity(y.object)
                    DeleteObject(y.object)
                    grass2(y.veg_modifier_sphere)
                    renderedobjects[k][x] = nil 
                elseif y.cata == "set" then 
                    Citizen.InvokeNative(0x58AC173A55D9D7B4,y.object,1,1)
                    renderedobjects[k][x] = nil 
                end
            end
        end
        
        if shadowobject ~= nil then
            DeleteObject(shadowobject)
            shadowobject = nil 
        end
        AnimpostfxStop("DEADEYE")
        RemoveBlip(blip)
        for k,v in pairs(bliparea) do 
            RemoveBlip(v)
        end
        for k,v in pairs(tempblip) do 
            RemoveBlip(v)
        end
        if Config.publicbutcher then 
            for k,v in pairs(butcherblips) do 
                RemoveBlip(v)
            end
        end
        for k,v in pairs(renderednpc) do 
            if v.npc ~= nil then 
                DeleteEntity(v.npc)
            end
        end
    end
end)

----------------------------------------------

local clothinghash = {
    Hat = 0x9925C067,
    EyeWear = 0x5E47CA6,
    Mask = 0x7505EF42,
    NeckWear = 0x5FC29285,
    NeckTies = 0x7A96FACA,
    Shirt = 0x2026C46D,
    Suspender = 0x877A2CF7,
    Vest = 0x485EE834,
    Coat = 0xE06D30CE,
    CoatClosed = 0x0662AC34,
    Poncho = 0xAF14310B,
    Cloak = 0x3C1A74CD,
    Glove = 0xEABE0032,
    RingRh = 0x7A6BBD0B,
    RingLh = 0xF16A1D23,
    Bracelet = 0x7BC10759,
    Gunbelt = 0x9B2C8B89,
    Belt = 0xA6D134C6,
    Buckle = 0xFAE9107F,
    Holster = 0xB6B6122D,
    Skirt = 0x8E84A2AA,
    bow = 0x9925C067,
    armor = 0x72E6EF74,
    teeth = 0x72E6EF74,
    Chap = 0x3107499B,
    Boots = 0x777EC6EF,
    Spurs = 0x18729F39,
    Spats = 0x514ADCEA,
    Gauntlets = 0x91CE9B20,
    Loadouts = 0x83887E88,
    Accessories = 0x79D7DF96,
    Satchels = 0x94504D26,
    GunbeltAccs = 0xF1542D11,
    Pant = 0x1D4C528A,

}

function SetPlayerComponent(clothing,oldclothing)
    local ped = PlayerPedId()
    for k,v in pairs(oldclothing) do 
        local comp = v
        if comp ~= -1 then 
            local cata = clothinghash[k]
            if Citizen.InvokeNative(0xFB4891BD7578CDC1,ped,cata) then 
                Citizen.InvokeNative(0xD710A5007C2AC539,ped,cata,0)
            end
        end
    end
    for k,v in pairs(clothing) do 
        local comp = v
        if comp ~= -1 then 
            local cata = clothinghash[k]
            if IsPedMale(PlayerPedId()) then
                Citizen.InvokeNative(0x59BD177A1A48600A,ped,cata)
                Citizen.InvokeNative(0xD3A7B003ED343FD9,ped,comp,true,false,false)
                Citizen.InvokeNative(0xD3A7B003ED343FD9,ped,comp,true,true,false)

            else
                Citizen.InvokeNative(0x59BD177A1A48600A,ped,cata)
                Citizen.InvokeNative(0xD3A7B003ED343FD9,ped,comp,true,false,true)
                Citizen.InvokeNative(0xD3A7B003ED343FD9,ped,comp,true,true,true)
            end
        end
    end
    if clothing["Skirt"] ~= -1 then
        Citizen.InvokeNative(0xD710A5007C2AC539,ped,clothinghash["Pant"],0)
    end
    Citizen.InvokeNative(0xCC8CA3E88256E58F,ped,0,1,1,1,false)
end

