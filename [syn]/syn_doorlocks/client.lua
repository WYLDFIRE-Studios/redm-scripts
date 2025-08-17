function DrawTexture(textureStreamed,textureName,x, y, width, height,rotation,r, g, b, a, p11)
	if not HasStreamedTextureDictLoaded(textureStreamed) then
	   RequestStreamedTextureDict(textureStreamed, false);
	else
		DrawSprite(textureStreamed, textureName, x, y, width, height, rotation, r, g, b, a, p11);
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

  function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

function GetPlayers()
	local players = {}
    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
        end
    end
    return players
end

function getEntity(player)                                          
    local result, entity = GetEntityPlayerIsFreeAimingAt(player)    
    return entity                                                   
end  

function contains(table, element)

		for k, v in pairs(table) do
	  		if v[2] == element then
				return true
			end
		end

	return false
end

function contains3(table, element)
    for k, v in pairs(table) do
          if v.id == element then
            return false
        end
    end
return true
end
function drawicon(x, y, z, text , state)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    if state then
        DrawSprite("generic_textures", "lock", _x, _y+0.0125, 0.04, 0.045, 0.1, 100, 1, 1, 255, 0)
    else
        DrawSprite("generic_textures", "lock", _x, _y+0.0125, 0.04, 0.045, 0.1, 67, 160, 71, 255, 0)
    end
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
function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

local doorlocksevent = false
local doorhash
local objc
local doorname
local entit
local objYaw3
local objYaw1
local objYaw2
local coord
local show3d = false
local changeloc = false
local o,p,q
local x,y,z
local doorinfo = {}
local lockeddoors = {}
local doorset = Config.Language.notset
local job1 = Config.Language.nojob
local job2 = Config.Language.nojob
local job3 = Config.Language.nojob
local item = Config.Language.noitem
local pinv = {}
local jobtitle = {}
local doorid
local secid
local locked = Config.Language.locked
local breakin = Config.Language.deny
local breakin2 = 0
local playerjob = nil
local allowpick = 0 
function allow(table, element)
    for k, v in pairs(table) do
          if v == element  then
            return true
        end
    end
  return false
end

local function playLockpickAnimation(ped, animDict, animName)
    RequestAnimDict(animDict)
    local timeout = 0
    while not HasAnimDictLoaded(animDict) and timeout < 5000 do
        Citizen.Wait(100)
        timeout = timeout + 100
    end

    if HasAnimDictLoaded(animDict) then
        TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
    else
        print("Failed to load animation dictionary:", animDict)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), false
        if next(lockeddoors) ~= nil then
            for k,v in pairs(lockeddoors) do
                for l ,m in pairs(v.doorinfo) do
                    local doordistance = vector3(m.x, m.y, m.z)
                    local distance = #(playerCoords - doordistance)
                    local maxDistance, displayText = 3, 'open'
                    if distance < 4 then
                        doorid = v.id
                        letSleep = false   
                        secid = 0                     
                        if m.locked then
                            if DoorSystemGetOpenRatio(m.objc) ~= 0.0 then
                                DoorSystemSetOpenRatio(m.objc, 0.0, true)
                                local object = Citizen.InvokeNative(0xF7424890E4A094C0, m.objc, 0)
                                SetEntityRotation(object, m.objYaw1, m.objYaw2, m.objYaw3, 2, true)
                            end
                            if DoorSystemGetDoorState(m.objc) ~= 1 then
                                Citizen.CreateThread(function()
                                    Citizen.InvokeNative(0xD99229FE93B46286,m.objc,1,1,0,0,0,0)
                                end) 
                                local object = Citizen.InvokeNative(0xF7424890E4A094C0, m.objc, 0)
                                SetEntityRotation(object, m.objYaw1, m.objYaw2, m.objYaw3, 2, true)
                                Citizen.InvokeNative(0x6BAB9442830C7F53,m.objc,1)
                            end 
                            
                        else
                            if DoorSystemGetDoorState(m.objc) ~= 0 then
                                Citizen.CreateThread(function()
                                    Citizen.InvokeNative(0xD99229FE93B46286,m.objc,1,1,0,0,0,0)
                                end) 
                                local object = Citizen.InvokeNative(0xF7424890E4A094C0, m.objc, 0)
                                SetEntityRotation(object, m.objYaw1, m.objYaw2, m.objYaw3, 2, true)
                                Citizen.InvokeNative(0x6BAB9442830C7F53,m.objc,0)
                            end 
                        end
                    end
                    if distance < maxDistance then
                        drawicon(m.o, m.p, m.q, " ", m.locked)
                        if IsControlPressed(0, Config.keys["SHIFT"]) then
                            if IsControlJustReleased(0, Config.keys["ALT"]) then
                                if v.breakin == 0 then 
                                    TriggerServerEvent("syn_doorlocks:updatedoorstate", doorid, secid, v.job, v.item, v.doorinfo, GetPlayers())
                                    Wait(2000)
                                else
                                    TriggerServerEvent("syn_doorlocks:findjob", v.item)
                                    Wait(500)
                                    if allow(v.job, playerjob) then 
                                        TriggerServerEvent("syn_doorlocks:updatedoorstate", doorid, secid, v.job, v.item, v.doorinfo, GetPlayers())
                                        Wait(2000)
                                    else
                                        if m.locked and allowpick >= 1 then
                                            local ped = PlayerPedId()
                                            local animDict = "script_proc@rustling@olar@player_picklock"
                                            local animName = "base"
                                            playLockpickAnimation(ped, animDict, animName)
                    
                                            local testplayer = exports["lockpick"]:lockpick()
                    
                                            while testplayer == nil do
                                                Citizen.Wait(100)
                                            end
                    
                                            ClearPedTasks(ped)
                                            RemoveAnimDict(animDict)
                    
                                            if testplayer then
                                                TriggerServerEvent('syn_doorlocks:resettimer', doorid, v.doorinfo, GetPlayers())
                                                TriggerServerEvent("syn_doorlocks:updatedoorstate2", doorid, v.doorinfo, GetPlayers())
                                                Wait(2000)
                                            else
                                                TriggerServerEvent("syn_doorlocks:removeitem", v.item)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                
            end
        end
        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent("syn_doorlocks:playanimation")
AddEventHandler("syn_doorlocks:playanimation", function()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
    local prop_name = 'P_KEY02X'
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")
    local key = false
    if not IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
        local waiting = 0
        RequestAnimDict("script_common@jail_cell@unlock@key")
        while not HasAnimDictLoaded("script_common@jail_cell@unlock@key") do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                break
            end
        end
        Wait(100)
        TaskPlayAnim(ped, 'script_common@jail_cell@unlock@key', 'action', 8.0, -8.0, 2500, 31, 0, true, 0, false, 0, false)
        Wait(1000)
        AttachEntityToEntity(prop, ped,boneIndex, 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)
        key = true
        while key do
            if IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
                Wait(100)
            else
                ClearPedSecondaryTask(ped)
                DeleteObject(prop)
                RemoveAnimDict("script_common@jail_cell@unlock@key")
                key = false
                break
            end
        end
    end   
end)

RegisterNetEvent("syn_doorlocks:deletedoor")
AddEventHandler("syn_doorlocks:deletedoor", function()
    if doorid ~= nil then
        TriggerServerEvent("syn_doorlocks:deletedoors2",doorid,GetPlayers())
    end
end)




RegisterNetEvent("syn_doorlocks:finddoors")
AddEventHandler("syn_doorlocks:finddoors", function(doorslocations)
    lockeddoors = doorslocations
end)

RegisterNetEvent("syn_doorlocks:getjob")
AddEventHandler("syn_doorlocks:getjob", function(job,x)
    playerjob = job
    allowpick = x 
end)

RegisterNetEvent("syn_doorlocks:getjob")
AddEventHandler("syn_doorlocks:getjob", function(job,inventory)
    pinv = inventory
    jobtitle = job
end)


RegisterNetEvent("syn_doorlocks:createdoor")
AddEventHandler("syn_doorlocks:createdoor", function()
    if doorlocksevent then 
        doorlocksevent = false
    else
        doorlocksevent = true
    end
    if show3d  then 
        show3d = false
    end
    doorset = Config.Language.notset
    doorinfo = {}
    changeloc = false   
    job1 = Config.Language.nojob
    job2 = Config.Language.nojob
    job3 = Config.Language.nojob
    item = Config.Language.noitem
end)

Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(0)
        if doorlocksevent then
            drawtext(Config.Language.aimingatdoor, 0.15, 0.10, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.pressb, 0.15, 0.13, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.createhousecancel, 0.15, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
            if IsPlayerFreeAiming(PlayerId()) then         
                local entity = getEntity(PlayerId())       
                local coords = GetEntityCoords(entity) 
                local player = GetEntityCoords(PlayerPedId())       
                local heading = GetEntityHeading(entity)    
                local model = GetEntityModel(entity) 
                if model ~= 0 and model ~= nil then
                    if contains(DOOR_HASHES, model) then
                        for k,v in pairs(DOOR_HASHES) do 
                            if model == v[2] then
                                local doorcoords = vector3(v[4],v[5], v[6])
                                local a,b,c = table.unpack(doorcoords)
                                local d,f,g = table.unpack(coords)
                                local distance = GetDistanceBetweenCoords(a, b, c, d, f, g, false)
                                if 1 > distance then
                                    doorname = v[3]
                                    doorhash = v[2]
                                    objc = v[1]
                                    entit = entity
                                    --print(objc)
                                end
                            end
                        end
                        local x,y,z = table.unpack(GetEntityRotation(entity))
                        DrawTexture("inventory_items", "consumable_lock_breaker", 0.5, 0.5, 0.05, 0.05, 0.0, 255, 0, 0, 180, true)
                        if whenKeyJustPressed(Config.keys["G"]) then
                            local x,y,z = table.unpack(GetEntityRotation(entit))
                            objYaw3 = z
                            objYaw1= x
                            objYaw2 = y
                            coord = GetEntityCoords(entit)
                            o,p,q = table.unpack(coord)
                            show3d = true
                            WarMenu.OpenMenu('createdoormenu')
                            doorlocksevent = false 
                            --print(objc)
                           -- print(objYaw1)
                            --print(objYaw2)
                           -- print(objYaw3)
                        end
                    end
                end
            end
            if whenKeyJustPressed(Config.keys["B"]) then
                local playerCoords = GetEntityCoords(PlayerPedId())
                local closestDistance = 9999
                local closestDoor = nil
                local entit = nil

                -- Iterate over all objects in the game world
                for _, entity in pairs(GetGamePool('CObject')) do
                    local model = GetEntityModel(entity)
                    -- Check if the model is in DOOR_HASHES
                    for k, v in pairs(DOOR_HASHES) do
                        if model == v[2] then -- v[2] is the door object model hash
                            local doorCoords = vector3(v[4], v[5], v[6])
                            local entityCoords = GetEntityCoords(entity)
                            -- Check if the entity is at the expected coordinates
                            local distanceToDoorCoords = #(entityCoords - doorCoords)
                            if distanceToDoorCoords < 1.0 then -- Adjust the threshold as needed
                                local distanceToPlayer = #(playerCoords - entityCoords)
                                if distanceToPlayer < closestDistance then
                                    closestDistance = distanceToPlayer
                                    closestDoor = v
                                    entit = entity
                                    doorname = v[3]
                                    doorhash = v[2]
                                    objc = v[1]
                                end
                            end
                        end
                    end
                end

                if entit then
                    -- Proceed with your desired actions
                    local x, y, z = table.unpack(GetEntityRotation(entit))
                    objYaw3 = z
                    objYaw1 = x
                    objYaw2 = y
                    coord = GetEntityCoords(entit)
                    print(coord)
                    o, p, q = table.unpack(coord)
                    show3d = true
                    WarMenu.OpenMenu('createdoormenu')
                    doorlocksevent = false 
                    -- Additional actions or prints if necessary
                else
                    print("No matching door entity found nearby.")
                end
            end 
        end  
        
     end
end)  


Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(0)
        if show3d then
            drawicon(o, p, q, " " ,true)
            if changeloc  then 
                drawtext(Config.Language.pressenterconfirm, 0.15, 0.13, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.createhousecancel, 0.15, 0.16, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.uparrowicon, 0.15, 0.19, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.downarrowicon, 0.15, 0.22, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.rightarrowicon, 0.15, 0.25, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.leftarrowicon, 0.15, 0.28, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.bracketrighticon, 0.15, 0.31, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                drawtext(Config.Language.bracketlefticon, 0.15, 0.34, 0.3, 0.3, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config.keys["UP"]) then
                    q = q + 0.1
                end
                if whenKeyJustPressed(Config.keys["DOWN"]) then
                    q = q-0.1
                end
                if whenKeyJustPressed(Config.keys["LEFTBRACKET"]) then
                    p = p+0.1
                end
                if whenKeyJustPressed(Config.keys["RIGHTBRACKET"]) then
                    p = p-0.1
                end
                if whenKeyJustPressed(Config.keys["RIGHT"]) then
                    o = o+0.1
                end
                if whenKeyJustPressed(Config.keys["LEFT"]) then
                    o = o-0.1
                end
                if whenKeyJustPressed(Config.keys["ENTER"]) then
                    if changeloc then
                        changeloc = false
                        WarMenu.OpenMenu('door')
                    end
                end
            end
        end
        
    end
end)

Citizen.CreateThread( function()
    WarMenu.CreateMenu('createdoormenu', Config.Language.createdoormenu)
    WarMenu.CreateSubMenu('door', 'createdoormenu', Config.Language.setupprimdoor)
    WarMenu.CreateSubMenu('confirm', 'createdoormenu', Config.Language.confirm)
    WarMenu.CreateSubMenu('cancel', 'createdoormenu', Config.Language.aresure)

    while true do
        if WarMenu.IsMenuOpened('createdoormenu') then
            if doorset == Config.Language.notset then
                if WarMenu.MenuButton(Config.Language.setupprimodoor..doorset, 'door') then end
            else
                if WarMenu.Button(Config.Language.job1.." : "..job1) then 
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.job1, function(cb)
                        local testprice =     cb
                        if testprice ~= nil and testprice ~= 0 and testprice ~= "close" and testprice ~= confirm then
                            job1 = testprice
                        else
                            job1 = Config.Language.nojob
                        end
                    end)
                end
                if WarMenu.Button(Config.Language.job2.." : "..job2) then 
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.job2, function(cb)
                        local testprice =     cb
                        if testprice ~= nil and testprice ~= 0 and testprice ~= "close" and testprice ~= confirm then
                            job2 = testprice
                        else
                            job2 = Config.Language.nojob
                        end
                    end)
                end
                if WarMenu.Button(Config.Language.job3.." : "..job3) then 
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.job3, function(cb)
                        local testprice =     cb
                        if testprice ~= nil and testprice ~= 0 and testprice ~= "close" and testprice ~= confirm then
                            job3 = testprice
                        else
                            job3 = Config.Language.nojob
                        end
                    end)
                end
                if WarMenu.Button(Config.Language.item.." : "..item) then 
                    TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.item, function(cb)
                        local testprice =     cb
                        if testprice ~= nil and testprice ~= 0 and testprice ~= "close" and testprice ~= confirm then
                            item = testprice
                        else
                            item = Config.Language.noitem
                        end
                    end)
                end
                if WarMenu.Button(Config.Language.lockedd..locked) then 
                    if locked == Config.Language.notlocked then 
                        locked = Config.Language.locked
                    else
                        locked = Config.Language.notlocked
                    end
                end
                if WarMenu.Button(Config.Language.breakin..breakin) then 
                    if breakin == Config.Language.deny then 
                        breakin = Config.Language.allow
                        breakin2 = 1
                    else
                        breakin = Config.Language.deny
                        breakin2 = 0
                    end
                end

                if WarMenu.MenuButton(Config.Language.confirm, 'confirm') then end
                if WarMenu.MenuButton(Config.Language.cancel, 'cancel') then end
            end
        elseif WarMenu.IsMenuOpened('cancel') then

            if WarMenu.Button(Config.Language.yes) then 
                WarMenu.CloseMenu()      
                doorlocksevent = false
                show3d = false
                changeloc = false   
                doorset = Config.Language.notset
                doorinfo = {}
                job1 = Config.Language.nojob
                job2 = Config.Language.nojob
                job3 = Config.Language.nojob
                item = Config.Language.noitem
            end
            if WarMenu.MenuButton(Config.Language.no, 'createdoormenu') then end
        elseif WarMenu.IsMenuOpened('confirm') then
            if WarMenu.Button(Config.Language.yes) then 
                TriggerServerEvent("syn_doorlocks:reigsterdoor", doorinfo,job1,job2,job3,item,breakin2) 
                doorlocksevent = false
                show3d = false
                changeloc = false   
                doorset = Config.Language.notset
                doorinfo = {}
                job1 = Config.Language.nojob
                job2 = Config.Language.nojob
                job3 = Config.Language.nojob
                item = Config.Language.noitem
                WarMenu.CloseMenu()      
            end
            if WarMenu.MenuButton(Config.Language.no, 'createdoormenu') then end

        elseif WarMenu.IsMenuOpened('door') then
            if WarMenu.Button(Config.Language.doorname..doorname.."") then end
            if WarMenu.Button(Config.Language.changedooriconloc) then 
                changeloc = true
                WarMenu.CloseMenu()
            end
            if WarMenu.MenuButton(Config.Language.confirmdoor..": "..doorset, 'createdoormenu') then
                show3d = false
                doorset = Config.Language.set
                local x,y,z = table.unpack(coord)
                local locked2 = false
                if locked == Config.Language.notlocked then 
                    locked2 = false
                else
                    locked2 =true
                end

                table.insert(doorinfo, {
                    o = o,
                    p = p,
                    q = q,
                    x = x,
                    y = y,
                    z = z,
                    doorname = doorname, 
                    doorhash = doorhash,
                    objc = objc,
                    entit = entit,
                    objYaw3 = objYaw3,
                    objYaw1 = objYaw1,
                    objYaw2 = objYaw2,  
                    locked = locked2,
                })
            end
        end ----- end of menu
        WarMenu.Display()
        Citizen.Wait(0)
    end
end)

AddEventHandler(
    "onResourceStart",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            Citizen.Wait(10000)
            TriggerServerEvent('syn_doorlocks:Load')
            Wait(5000)
            local type = 1
            TriggerServerEvent("syn_doorlocks:find", type)

        end
    end
)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    local type = 1
    TriggerServerEvent("syn_doorlocks:find", type)
end)

local info1 = {}
local info2 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true
        for k,doorID in ipairs(Config.premadedoors) do
            local distance
            if doorID.doors then
                distance = #(playerCoords - doorID.doors[1].objCoords)
            else
                distance = #(playerCoords - doorID.textCoords)
            end
            local maxDistance, displayText = 1.25, 'open'
            if doorID.distance then
                maxDistance = doorID.distance
            end
            if distance < 10 then
                letSleep = false
                if doorID.locked then
                    if DoorSystemGetOpenRatio(doorID.object) ~= 0.0 then
                        DoorSystemSetOpenRatio(doorID.object, 0.0, true)
                        local object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object, 0)
                        SetEntityRotation(object, 0.0, 0.0, doorID.objYaw, 2, true)
                        if doorID.object2 ~= nil then
                            DoorSystemSetOpenRatio(doorID.object2, 0.0, true)
                            object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object2, 0)
                            SetEntityRotation(object, 0.0, 0.0, doorID.objYaw2, 2, true)
                        end
                    end
                    if DoorSystemGetDoorState(doorID.object) ~= 1 then
                        Citizen.CreateThread(function()
                            Citizen.InvokeNative(0xD99229FE93B46286,doorID.object,1,1,0,0,0,0)
                        end)
                        local object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object, 0)
                        Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object,doorID.locked)
                        SetEntityRotation(object, 0.0, 0.0, doorID.objYaw, 2, true)
                        if doorID.object2 ~= nil then
                            Citizen.CreateThread(function()
                                Citizen.InvokeNative(0xD99229FE93B46286,doorID.object2,1,1,0,0,0,0)
                            end)
                            object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object2, 0)
                            Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object2,doorID.locked)
                            SetEntityRotation(object, 0.0, 0.0, doorID.objYaw2, 2, true)
                        end
                    end
                else
                    if DoorSystemGetDoorState(doorID.object) ~= 0 then
                        Citizen.CreateThread(function()
                            Citizen.InvokeNative(0xD99229FE93B46286,doorID.object,1,1,0,0,0,0)
                        end)
                        Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object,doorID.locked)
                        if doorID.object2 ~= nil then
                            Citizen.CreateThread(function()
                                Citizen.InvokeNative(0xD99229FE93B46286,doorID.object2,1,1,0,0,0,0)
                            end)
                            Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object2,doorID.locked)
                        end
                    end
                end
            end
            if distance < maxDistance then
                DrawText3D(doorID.textCoords.x, doorID.textCoords.y, doorID.textCoords.z, " " ,doorID.locked)
                if IsControlPressed(0, Config.keys["SHIFT"]) then
                    if IsControlJustPressed(2, Config.keys["ALT"]) then 
                        info1 = doorID.textCoords
                        info2 = k
                        TriggerServerEvent("syn_doorlocks:updatedoorsv", k)
                        Wait(2000)
                    end
                end
            end
        end
        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

function makeEntityFaceEntity( entity1, coords , k)
    local p1 = GetEntityCoords(entity1, true)
    local p2 = coords
    local dx = p2.x - p1.x
    local dy = p2.y - p1.y
    local heading = GetHeadingFromVector_2d(dx, dy)
    SetEntityHeading( entity1, heading )
    Wait(100)
    ClearPedTasks(ped)
    prop_name = 'P_KEY02X'
    local ped = entity1
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")
    local key = false
    if not IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
        local waiting = 0
        RequestAnimDict("script_common@jail_cell@unlock@key")
        while not HasAnimDictLoaded("script_common@jail_cell@unlock@key") do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                break
            end
        end
        Wait(100)
        TaskPlayAnim(ped, 'script_common@jail_cell@unlock@key', 'action', 8.0, -8.0, 2500, 31, 0, true, 0, false, 0, false)
        Wait(750)
        AttachEntityToEntity(prop, ped,boneIndex, 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)
        key = true
        while key do
            if IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
                Wait(100)
            else
                ClearPedSecondaryTask(ped)
                DeleteObject(prop)
                RemoveAnimDict("script_common@jail_cell@unlock@key")
                key = false
                break
            end
        end
    end
end


RegisterNetEvent('syn_doorlocks:changedoor')
AddEventHandler('syn_doorlocks:changedoor', function(doorID)
    makeEntityFaceEntity(PlayerPedId(), info1 , info2 )
    local name   = Config.premadedoors[doorID]
    name.locked = not name.locked
    TriggerServerEvent('syn_doorlocks:updateState',GetPlayers(), doorID, name.locked, function(cb) end)
end)

function DrawText3D(x, y, z, text , state)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    if state then
        DrawSprite("generic_textures", "lock", _x, _y+0.0125, 0.04, 0.045, 0.1, 100, 1, 1, 255, 0)
    else
        DrawSprite("generic_textures", "lock", _x, _y+0.0125, 0.04, 0.045, 0.1, 67, 160, 71, 255, 0)
    end
end

RegisterNetEvent('syn_doorlocks:setState')
AddEventHandler('syn_doorlocks:setState', function(doorID, state)
    Config.premadedoors[doorID].locked = state
end)