local tobuy = {}
local things = {}
local spawn = false 
local tospawn = {}
local isadmin = false
local blips = {}
local jobpeds = {}
local inmenu = false
local allow = false

-- testing
--[[ local propset_id
RegisterCommand("tbb", function(source, args)
    Citizen.InvokeNative(0x58AC173A55D9D7B4,propset_id,1,1)
    local propset_name = args[1]
    local propset_hash = GetHashKey(propset_name)
    local ped_coords = GetEntityCoords(PlayerPedId())
    local x,y,z =  table.unpack(ped_coords + vector3(0.0,5.0,0.0))
 	Citizen.InvokeNative(0xF3DE57A46D5585E9,propset_hash) -- REQUEST_PROPSET
    local counter = 1
    while not Citizen.InvokeNative(0x48A88FC684C55FDC,propset_hash) and counter <= 20 do   -- HAS_PROPSET_LOADED
      counter = counter + 1
      Citizen.Wait(50)
    end
    if Citizen.InvokeNative(0x48A88FC684C55FDC,propset_hash) then  -- HAS_PROPSET_LOADED
        propset_id = Citizen.InvokeNative(0x899C97A1CCE7D483,propset_hash, x,y,z, 0, 60.0, 1200.0, true, true)   -- CREATE_PROPSET_2
    end
    Citizen.InvokeNative(0xB1964A83B345B4AB, propset_hash)  -- RELEASE_PROPSET
end) ]]





Citizen.CreateThread(function()
    Citizen.Wait(1000)
	for k,v in pairs(Config.outfittersnpc) do 
        if v.showblip then 
		    local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
    	    SetBlipSprite(blip, v.blipsprite, 1)
    	    SetBlipScale(blip, 0.2)
    	    Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
            table.insert(blips, blip)
        end
        -----
        local hashModel = GetHashKey(v.npcmodel) 
        if IsModelValid(hashModel) then 
            RequestModel(hashModel)
            while not HasModelLoaded(hashModel) do                
                Wait(100)
            end
        end
        local npc = CreatePed(hashModel, v.Pos.x, v.Pos.y, v.Pos.z - 1.0,v.Pos.h, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
        SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        Wait(1000)
        FreezeEntityPosition(npc, true) -- NPC can't escape
        SetBlockingOfNonTemporaryEvents(npc, true) -- NPC can't be scared
        table.insert(jobpeds, npc)
	end
end)

AddEventHandler("onResourceStop",function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for k,v in pairs(blips) do 
            RemoveBlip(v)
        end
        for k,v in pairs(jobpeds) do 
            DeletePed(v)   
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local sleep = true 
        for k, v in pairs(Config.outfittersnpc) do
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 5 and not inmenu then
                sleep = false
                DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, Config.Language.outfittersmenu)
                if IsControlJustReleased(0, Config.keys["G"]) then
                    TriggerServerEvent("syn_outfitter:findadmin2")
                    Wait(500) 
                    WarMenu.OpenMenu('buy')
                    inmenu = true
                   Wait(500)
                end
            end
        end
        if sleep then 
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent("syn_outfitter:closemenu")
AddEventHandler("syn_outfitter:closemenu", function()
    inmenu = false
end)
RegisterCommand(Config.command, function(source, args)
    if Config.command_enable then 
        TriggerServerEvent("syn_outfitter:pull")
        Wait(500)
        WarMenu.OpenMenu('outfitter')
    end
end)

RegisterNetEvent("syn_outfitter:open")
AddEventHandler("syn_outfitter:open", function()
    TriggerServerEvent("syn_outfitter:pull")
    Wait(500)
    WarMenu.OpenMenu('outfitter')
end)

RegisterNetEvent("syn_outfitter:pullinfotoclient")
AddEventHandler("syn_outfitter:pullinfotoclient", function(propsx)
    things = propsx
end)

RegisterNetEvent("syn_outfitter:findadmin")
AddEventHandler("syn_outfitter:findadmin", function(admin)
    isadmin = admin
end)

Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(10)
        if spawn then 
            drawtext(Config.Language.pressg, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if tospawn.type == 1 then 
                if whenKeyJustPressed(Config.keys["G"]) then
                    local pedCoords = GetEntityCoords(PlayerPedId())
		            local town_hash = Citizen.InvokeNative(0x43AD8FC02B429D33, pedCoords, 1)
                    if IsTownBanned(town_hash) then
                        spawn = false
                        TriggerEvent("vorp:TipBottom", Config.Language.townclose, 4000)
                    else
                        spawn = false
                        local propset_name = tospawn.hash
                        local propset_hash = GetHashKey(propset_name)
                        local ped_coords = GetEntityCoords(PlayerPedId())
                        local x,y,z =  table.unpack(ped_coords + vector3(0.0,2.0,0.0))
 	                    Citizen.InvokeNative(0xF3DE57A46D5585E9,propset_hash) -- REQUEST_PROPSET
                        local counter = 1
                        while not Citizen.InvokeNative(0x48A88FC684C55FDC,propset_hash) and counter <= 20 do   -- HAS_PROPSET_LOADED
                          counter = counter + 1
                          Citizen.Wait(50)
                        end
                        if Citizen.InvokeNative(0x48A88FC684C55FDC,propset_hash) then  -- HAS_PROPSET_LOADED
                          local propset_id = Citizen.InvokeNative(0x899C97A1CCE7D483,propset_hash, x,y,z, 0, 60.0, 1200.0, true, true)   -- CREATE_PROPSET_2
                        end
                        Citizen.InvokeNative(0xB1964A83B345B4AB, propset_hash)  -- RELEASE_PROPSET
                        TriggerServerEvent("syn_outfitter:used",tospawn,x,y,z) 
                    end
                end
            else
                if whenKeyJustPressed(Config.keys["G"]) then
                    local pedCoords = GetEntityCoords(PlayerPedId())
		            local town_hash = Citizen.InvokeNative(0x43AD8FC02B429D33, pedCoords, 1)
                    if IsTownBanned(town_hash) then
                        spawn = false
                        TriggerEvent("vorp:TipBottom", Config.Language.townclose, 4000)
                    else
                        spawn = false
                        local propset_name = tospawn.hash
                        local propset_hash = GetHashKey(propset_name)
                        local ped_coords = GetEntityCoords(PlayerPedId())
                        local x,y,z =  table.unpack(ped_coords + vector3(0.0,0.0,0.0))
                        local prop = CreateObject(propset_hash, x, y, z, true, false, true)
                        PlaceObjectOnGroundProperly(prop)
                        TriggerServerEvent("syn_outfitter:used",tospawn,x,y,z)
                    end 
                end
            end
        end
    end
end)

function keysx(table)
    local keys = 0
    for k,v in pairs(table) do
        if v.spawned == 1 then 
            keys = keys + 1
        end
    end
    return keys
end

Citizen.CreateThread( function()
    WarMenu.CreateMenu('outfitter', Config.Language.outfitters)
    WarMenu.CreateMenu('buy', Config.Language.outfitters)
    WarMenu.CreateSubMenu('spawn', 'outfitter', Config.Language.spawn)
    WarMenu.CreateSubMenu('despawn', 'outfitter', Config.Language.despawn)
    WarMenu.CreateSubMenu('propsets', 'buy', Config.Language.propsets)
    WarMenu.CreateSubMenu('props', 'buy', Config.Language.props)
    WarMenu.CreateSubMenu('confirm', 'buy', Config.Language.confirm)

    while true do
        if WarMenu.IsMenuOpened('outfitter') then
            if Config.spawnlimit > keysx(things) then 
                if WarMenu.MenuButton(Config.Language.spawn, 'spawn') then end
            else
                if WarMenu.Button(Config.Language.toomany..Config.spawnlimit) then end
            end
            if WarMenu.MenuButton(Config.Language.despawn, 'despawn') then end
        elseif WarMenu.IsMenuOpened('spawn') then
            for k,v in pairs(things) do 
                if v.spawned == 0 then 
                    if WarMenu.Button(""..v.name.."") then
                        spawn = true 
                        tospawn = v
                        WarMenu.CloseMenu()
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('despawn') then
            for k,v in pairs(things) do 
                if v.spawned == 1 then 
                    if v.type == 1 then 
                        if WarMenu.Button(""..v.name.."") then
                            local theprop = Citizen.InvokeNative(0xC061E50F8D299F95,GetHashKey(v.hash),v.x,v.y,v.z)
                            Citizen.InvokeNative(0x58AC173A55D9D7B4,theprop,1,1)
                            TriggerServerEvent("syn_outfitter:used2",v) 
                            WarMenu.CloseMenu()
                        end
                    else
                        if WarMenu.Button(""..v.name.."") then
                            local object1 = GetClosestObjectOfType(v.x, v.y, v.z, 2.5, GetHashKey(v.hash), 0)
                            DeleteObject(object1)
                            TriggerServerEvent("syn_outfitter:used2",v) 
                            WarMenu.CloseMenu()
                        end
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('buy') then
            if WarMenu.MenuButton(Config.Language.propsets, 'propsets') then end
            if WarMenu.MenuButton(Config.Language.props, 'props') then end
        elseif WarMenu.IsMenuOpened('propsets') then
            for k,v in pairs(Config.propsets) do 
                if v.admin == 1 then 
                    if isadmin then 
                        if WarMenu.MenuButton(""..v.name.." / "..Config.Language.price..v.price,'confirm') then 
                            tobuy = v 
                        end
                    end
                else
                    if WarMenu.MenuButton(""..v.name.." / "..Config.Language.price..v.price,'confirm') then 
                        tobuy = v 
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('props') then
            for k,v in pairs(Config.props) do 
                if v.admin == 1 then 
                    if isadmin then 
                        if WarMenu.MenuButton(""..v.name.." / "..Config.Language.price..v.price,'confirm') then 
                            tobuy = v 
                        end
                    end
                else
                    if WarMenu.MenuButton(""..v.name.." / "..Config.Language.price..v.price,'confirm') then 
                        tobuy = v 
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('confirm') then
            if WarMenu.Button(Config.Language.yes) then
                TriggerServerEvent("syn_outfitter:buyitem",tobuy) 
                WarMenu.CloseMenu()
            end
            if WarMenu.MenuButton(Config.Language.no,'buy') then end

        end ----- end of menu
        WarMenu.Display()
        Citizen.Wait(0)
    end
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    Wait(10000)
    TriggerServerEvent("syn_outfitter:reset") 
end)

function contains(table, element)
    for k, v in pairs(table) do
          if v == element then
            return true
        end
    end
return false
end

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end
function drawtext(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    if enableShadow then 
        SetTextDropshadow(1, 0, 0, 0, 255)
    end
    Citizen.InvokeNative(0xADA9255D, 10);
    DisplayText(str, x, y)
end

IsTownBanned = function (town)
	for k,v in pairs(Config.BannedTowns) do
		if town == GetHashKey(v) then
			return true
		end
	end
	return false
end

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	if onScreen then
	  SetTextScale(0.30, 0.30)
	  SetTextFontForCurrentCommand(1)
	  SetTextColor(255, 255, 255, 215)
	  SetTextCentre(1)
	  DisplayText(str,_x,_y)
	  local factor = (string.len(text)) / 225
	  DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
	end
end