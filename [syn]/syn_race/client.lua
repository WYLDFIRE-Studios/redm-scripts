local cp = {}
local blips = {}
local recordrace = false 
local recorded = Config2.Language.no
local racename = ""
local fee = 0
local playerracers = {}
local racenamez
local locz = {}
local startrace = false
local blipstart
local currentpoint = 0
local firstloc = {}
local lastptkey = 0
local raceid 
local timerstarted = false 
local timer = Config2.registerdelay - 1
local timeout = false 
local openrace = {}
local therace = {}
local veh
local mount
local racestarted = false 
local timer2 = Config2.racestartdelay -- reset on race end
local timeout2 = false
local countx = false 
local fail = true 
local num = 0
local key = 0
local check = false
local value = 0
local first = 4000
local horses = {}
local priceofhorse = 0
local horseinfo 
local next = next
local playerjob
local randomized = {}
local waittimerofspawn = Config2.randomtimer * 1000 


RegisterCommand(Config2.racecommand, function(source, args, rawCommand)
    if timeout2 == false and recordrace == false then 
        for k,v in pairs(blips) do 
            RemoveBlip(v.blipz)
        end
        blips = {}
        fee = 0
        racename = ""
        cp = {}
        recorded = Config2.Language.no
        firstloc = {}
        currentpoint = 0
        lastptkey = 0
        TriggerServerEvent("syn_race:getrecordedrace")
        Citizen.Wait(500)
        WarMenu.OpenMenu('races')
    end
end, false)

RegisterCommand(Config2.cancelracecommand, function(source, args, rawCommand)
    if timeout2 ~= false then 
        if therace.raceowner == GetPlayerServerId(GetPlayerIndex()) then 
            TriggerServerEvent("syn_race:canceltherace",therace,therace.id)
        end
    end
end, false)

function round(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

Citizen.CreateThread(function()
    while true do
        
       Citizen.Wait(10)
       local sleep = true 
        if recordrace then
            sleep = false 
            drawtext(Config2.Language.pressg, 0.15, 0.55, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config2.Language.openmap, 0.15, 0.50, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if IsWaypointActive() then
                local coord = GetWaypointCoords()
                table.insert(cp,coord)
                Citizen.Wait(500)
                SetWaypointOff()
                local blip =  N_0x554d9d53f696d002(1664425300, coord.x, coord.y, coord.z)
                SetBlipScale(blip, 0.2)
                SetBlipSprite(blip, 1116438174, 1) 
                Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config2.Language.racepoint)
                table.insert(blips, {
                  blipz = blip
                })
            end
            if whenKeyJustPressed(Config2.keys["G"]) then
                recorded = Config2.Language.yes
                recordrace = false 
                WarMenu.OpenMenu('createrace')
                Citizen.Wait(500)
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)
function contains2(table, element)
    for k, v in pairs(table) do
        if v == element then
            return true
        end
    end
  return false
  end
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(10)
        for k,v in pairs(openrace) do 
            if v.regopen == 1 then
                local coords = GetEntityCoords(PlayerPedId())
                local dist = GetDistanceBetweenCoords(coords.x,coords.y,coords.z, v.firstpt.x,v.firstpt.y,v.firstpt.z, false)
                if dist < Config2.registrationradius then
                    local playerz = GetPlayerServerId(GetPlayerIndex())
                    if not contains2(v.partx, playerz) then 
                        DrawText3D(coords.x, coords.y, coords.z, Config2.Language.presstostart..v.fee.." $")
                        if whenKeyJustPressed(Config2.keys["ENTER"]) then
                            Wait(500)
                            TriggerServerEvent("syn_race:updateraces",v,v.id)
                            Wait(500)
                            therace = v
                            Wait(500)
                        end
                    end
                end
            end
        end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
	    if timer2 >= 0 and countx then
	    	Citizen.Wait(1000)
	    	if timer2 > 0 then
	    		timer2 = timer2 - 1
	    	end
            if 0 >= timer2 and countx then 
                timeout2 = true  -- clear on race end 
                timer2 = Config2.racestartdelay
                local player = PlayerPedId()
                if IsPedInAnyVehicle(player) then 
                    FreezeEntityPosition(veh,false)
                end
                if IsPedOnMount(player)  then 
                    FreezeEntityPosition(mount,false)
                end
                FreezeEntityPosition(player,false)
            end
	    end
    end
end)



RegisterNetEvent("syn_race:startthebigrace")
AddEventHandler("syn_race:startthebigrace", function()
racestarted = true 
end)
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(10)
        if racestarted then 
            countx = true -- reset to false on race end
            local player = PlayerPedId()
            if IsPedInAnyVehicle(player) then 
                veh = GetVehiclePedIsIn(player, false)
                FreezeEntityPosition(veh,true)
            end
            if IsPedOnMount(player)  then 
                mount = GetMount(player)
                FreezeEntityPosition(mount,true)
            end
            FreezeEntityPosition(player,true)            
            racestarted = false
        end
        if not timeout2 and countx then 
            drawtext(Config2.Language.racestartsin.. "[~e~"..timer2.."~q~]", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)
        end
    end
end)
RegisterNetEvent("syn_race:updateracec")
AddEventHandler("syn_race:updateracec", function(allraces)
    openrace = allraces
end)
RegisterNetEvent("syn_race:updateracecx")
AddEventHandler("syn_race:updateracecx", function()
    TriggerEvent("syn_race:joinedarace")
end)
RegisterNetEvent("syn_race:cancelrace")
AddEventHandler("syn_race:cancelrace", function(allraces)
    openrace = allraces
end)
RegisterNetEvent("syn_race:cancelrace2")
AddEventHandler("syn_race:cancelrace2", function()
    therace = {}
    countx = false 
    timerstarted = false 
    timer2 = Config2.racestartdelay
    timeout = false 
    timeout2 = false 
    timer = Config2.registerdelay - 1
    fee = 0
    racename = ""
    cp = {}
    recorded = Config2.Language.no
    firstloc = {}
    currentpoint = 0
    lastptkey = 0
    for k,v in pairs(blips) do 
        RemoveBlip(v.blipz)
    end
    blips = {}
    ClearGpsCustomRoute()
    SetGpsCustomRouteRender(false, 16, 16)
end)


Citizen.CreateThread(function() -- checkpoint calculation
    while true do
        Citizen.Wait(10)
        if timeout2 then 
            for x,y in pairs(therace.loc) do
                if x ==currentpoint+1 and currentpoint ~= lastptkey then 
                    local coords = GetEntityCoords(PlayerPedId())
                    local dist = GetDistanceBetweenCoords(coords.x,coords.y,coords.z, y.x,y.y,y.z, false)
                    drawtext(Config2.Language.nextp.."[~e~"..round(dist) - Config2.checkpointradius.."~q~]", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)
                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, y.x, y.y, coords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 6.0, 6.0, 8.0, 100, 1, 1, 190, false, true, 2, false, false, false, false)
                    if dist < Config2.checkpointradius then
                        currentpoint = currentpoint+1 
                        for k,v in pairs(blips) do 
                            if k == currentpoint - 1 then 
                                RemoveBlip(v.blipz)
                            end
                            if k == currentpoint then 
                                Citizen.InvokeNative(0x9CB1A1623062F402, v.blipz, Config2.Language.thenextblip)
                                Citizen.InvokeNative(0x662D364ABF16DE2F,v.blipz,0x6F85C3CE) -- red color blip
                            end
                        end
                    end
                elseif currentpoint == lastptkey then 
                    local coords = GetEntityCoords(PlayerPedId())
                    local dist = GetDistanceBetweenCoords(coords.x,coords.y,coords.z, y.x,y.y,y.z, false)
                    drawtext(Config2.Language.nextp.."[~e~"..round(dist) - Config2.checkpointradius.."~q~]", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)
                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, y.x, y.y, coords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 6.0, 6.0, 8.0, 100, 1, 1, 190, false, true, 2, false, false, false, false)
                    if dist < 10 then
                        TriggerServerEvent("syn_race:finishedrace",therace,therace.id)
                        ClearGpsCustomRoute()
                        SetGpsCustomRouteRender(false, 16, 16)
                        therace = {}
                        countx = false 
                        timerstarted = false 
                        timer2 = Config2.racestartdelay
                        timeout = false 
                        timeout2 = false 
                        timer = Config2.registerdelay - 1
                        fee = 0
                        racename = ""
                        cp = {}
                        recorded = Config2.Language.no
                        firstloc = {}
                        currentpoint = 0
                        lastptkey = 0
                        for k,v in pairs(blips) do 
                            RemoveBlip(v.blipz)
                        end
                        blips = {}    
                    end
                end
            end
        end
    end
end)

RegisterNetEvent("syn_race:joinedarace")
AddEventHandler("syn_race:joinedarace", function()
    local blip
    local currentpointx
    local player = PlayerPedId()
    for k,v in pairs(blips) do 
        RemoveBlip(v.blipz)
    end
    blips = {}
    currentpoint = 1 -- use to find race points
    lastptkey = lastkey(therace.loc) -- use to find last point in race
    ClearGpsCustomRoute()
    StartGpsMultiRoute(0, true, true)
    for x,y in pairs(therace.loc) do
        if x ~= currentpoint then
             blip =  N_0x554d9d53f696d002(1664425300, y.x, y.y, y.z)
            SetBlipScale(blip, 0.2)
            SetBlipSprite(blip, 1116438174, 1) 
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config2.Language.racepoint)
             currentpointx = x
            if x == currentpoint+1 then 
                Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config2.Language.thenextblip)
                Citizen.InvokeNative(0x662D364ABF16DE2F,blip,0x6F85C3CE) -- red color blip
            end
            table.insert(blips, {
                blipz = blip,
                currentpointx = currentpointx,
              })
        end
        AddPointToGpsMultiRoute(y.x, y.y, y.z)
    end
    SetGpsCustomRouteRender(true, 8, 8)
    
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
	    if timer >= 0 and timerstarted then
	    	Citizen.Wait(1000)
	    	if timer > 0 then
	    		timer = timer - 1
	    	end
            if 0 >= timer then 
                timerstarted = false
                timer = Config2.registerdelay - 1
                timeout = true 
            end
	    end
    end
end)
local timer3 = Config2.endracetimer - 5
local timerstarted3 = false
local timeout3 = false

RegisterNetEvent("syn_race:endtimerclients")
AddEventHandler("syn_race:endtimerclients", function()
    timerstarted3 = true
end)


RegisterNetEvent("syn_race:findjob")
AddEventHandler("syn_race:findjob", function(job)
    playerjob = job
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
	    if timer3 >= 0 and timerstarted3 then
	    	Citizen.Wait(1000)
	    	if timer3 > 0 then
	    		timer3 = timer3 - 1
	    	end
            if 0 >= timer3 then 
                timeout3 = true 
            end
	    end
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if timeout3 then 
            timer3 = Config2.endracetimer - 5
            timerstarted3 = false
            timeout3 = false
        end
        if timerstarted3 then
            drawtext(Config2.Language.timetillover.."[~e~"..timer3.."~q~]", 0.15, 0.55, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if timer >= 0 and timerstarted and not timeout then
            drawtext(Config2.Language.registrationendsin.. "[~e~"..timer.."~q~]", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)
        end
    end
end)

RegisterNetEvent("syn_race:startedracec")
AddEventHandler("syn_race:startedracec", function(allraces)
    openrace = allraces
end)


local onco
function getoncooldown()
    TriggerServerEvent("syn_race:checkcoool")
    while onco == nil do 
        Wait(500)
    end
    local onco2 = onco
    onco = nil 
    return onco2
end

RegisterNetEvent("syn_race:reconco")
AddEventHandler("syn_race:reconco", function(x)
    onco = x
end)

Citizen.CreateThread( function()
    WarMenu.CreateMenu('races', Config2.Language.races)
    WarMenu.CreateMenu('stable', Config2.Language.stable)
    WarMenu.CreateSubMenu('saved', 'races', Config2.Language.savedraces)
    WarMenu.CreateSubMenu('createrace', 'races', Config2.Language.createrace)
    WarMenu.CreateSubMenu('managerace', 'races', Config2.Language.managerace)
    while true do
        if WarMenu.IsMenuOpened('races') then
            if WarMenu.MenuButton(Config2.Language.createrace, 'createrace') then end
            if WarMenu.MenuButton(Config2.Language.savedraces, 'saved') then end

        elseif WarMenu.IsMenuOpened('stable') then 
            if WarMenu.Button(Config2.Language.sellhorse..priceofhorse * Config2.sellpercentage) then 
                if IsPedOnMount(PlayerPedId()) and not IsPedRagdoll(PlayerPedId())  then 
                    priceofhorse = priceofhorse * Config2.sellpercentage
                    local network = NetworkGetNetworkIdFromEntity(GetMount(PlayerPedId()))
                    TriggerServerEvent("syn_race:sellhorse",priceofhorse,network)
                    for k,v in pairs(horses) do 
                        if v == mount then 
                            v = nil
                        end
                    end
                    WarMenu.CloseMenu() 
                    --TriggerServerEvent("syn_race:cooldown")
                end
            end
            if WarMenu.Button(Config2.Language.stablehorse..Config2.regfee * priceofhorse) then 
                if IsPedOnMount(PlayerPedId())  then 
                    TriggerEvent("vorpinputs:getInput", Config2.Language.confirm, Config2.Language.horsename, function(cb)
                        local count =     cb
                        if count ~= nil and count ~= "" and count ~= "close" then
                            local name = count
                            local price = Config2.regfee * priceofhorse
                            local network = NetworkGetNetworkIdFromEntity(GetMount(PlayerPedId()))
                            TriggerServerEvent("syn_race:stablehorse",horseinfo,name,price,network)
                        else
                            TriggerEvent("vorp:TipBottom", Config2.Language.invalid, 4000)
                        end
                    end)
                end
                WarMenu.CloseMenu()
                --TriggerServerEvent("syn_race:cooldown")  
            end
        elseif WarMenu.IsMenuOpened('managerace') then
            if WarMenu.Button(Config2.Language.fee.." = "..fee) then 
                TriggerEvent("vorpinputs:getInput", Config2.Language.confirm, Config2.Language.amount, function(cb)
                    local count =     tonumber(cb)
                    if count ~= nil and count ~= 0 and count > 0 then
                        fee = count
                    else
                        TriggerEvent("vorp:TipBottom", Config2.Language.invalidamount, 4000)
                    end
                end)
            end
            if WarMenu.Button(Config2.Language.startrace) then 
                TriggerEvent("vorp:TipBottom", Config2.Language.gotostart, 4000)
                WarMenu.CloseMenu() 
                for k,v in pairs(blips) do 
                    if k == 1 then 
                        Citizen.InvokeNative(0x9CB1A1623062F402, v.blipz, Config2.Language.racepoint1st)
                        Citizen.InvokeNative(0x662D364ABF16DE2F,v.blipz,0x6F85C3CE) -- red color blip
                    end
                end
                for x,y in pairs(locz) do 
                    if x == 1 then 
                        firstloc = y
                    end
                end
                local part = {}
                local race = {name = racenamez,raceowner=GetPlayerServerId(GetPlayerIndex()),loc = locz,id = raceid, firstpt = firstloc ,partx = part,regopen = 1,fee=fee,pot=0,first = 0,sec = 0,third = 0}
                TriggerServerEvent("syn_race:startedraces",race,raceid)
                timerstarted = true
            end
            if WarMenu.Button(Config2.Language.deleterace) then
                TriggerServerEvent("syn_race:deleterace",raceid)
                --frace()
                WarMenu.CloseMenu()
            end
        elseif WarMenu.IsMenuOpened('saved') then
            for i = 1, #playerracers do
                if WarMenu.MenuButton(playerracers[i].name,'managerace') then
                    racenamez = playerracers[i].name
                    locz = playerracers[i].loc
                    raceid = playerracers[i].id
                    TriggerEvent("syn_race:createblips")
                end
            end
        elseif WarMenu.IsMenuOpened('createrace') then
            if WarMenu.Button(Config2.Language.racename.." : "..racename) then 
                TriggerEvent("vorpinputs:getInput", Config2.Language.confirm, Config2.Language.racename, function(cb)
                    local count =     cb
                    if count ~= nil  then
                     racename = count
                    end
                end)
            end
            if WarMenu.Button(Config2.Language.setuppoints.." : "..recorded) then 
                recordrace = true
                WarMenu.CloseMenu()
            end 
            if recorded == Config2.Language.yes and  racename ~= "" then 
                if WarMenu.Button(Config2.Language.confirm) then 
                    local loc2 = cp
                    for k,v in pairs(blips) do 
                        RemoveBlip(v.blipz)
                    end
                    TriggerServerEvent("syn_race:saverace",racename,loc2)
                    blips = {}
                    fee = 0
                    racename = ""
                    cp = {}
                    recorded = Config2.Language.no
                    firstloc = {}
                    currentpoint = 0
                    lastptkey = 0
                    WarMenu.CloseMenu()
                end
            end
        end
    WarMenu.Display()
    Citizen.Wait(0)
    end
end)


RegisterNetEvent("syn_race:createblips")
AddEventHandler("syn_race:createblips", function()
  for k,v in pairs(locz) do 
    local blip =  N_0x554d9d53f696d002(1664425300, v.x, v.y, v.z)
    SetBlipScale(blip, 0.2)
    SetBlipSprite(blip, 1116438174, 1) 
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, "racepoint")
    table.insert(blips, {
      blipz = blip
    })
  end
end)

RegisterNetEvent("syn_race:getraces")
AddEventHandler("syn_race:getraces", function(recordedraces)
  playerracers = recordedraces
end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end
function lastkey(table)
    for i,v in pairs(table) do
        last = #table - 0
    end
    return last
end
function removek(table,id)
    for k,v in pairs(table) do 
        if v.id == id then 
            table.remove(table,k)
        end
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
AddEventHandler("onResourceStop",function(resourceName)
    if resourceName == GetCurrentResourceName() then
        ClearGpsCustomRoute()
        SetGpsCustomRouteRender(false, 16, 16)
        for k,v in pairs(blips) do 
            RemoveBlip(v.blipz)
        end
        local player = PlayerPedId()
        if IsPedInAnyVehicle(player) then 
            FreezeEntityPosition(veh,false)
        end
        if IsPedOnMount(player)  then 
            FreezeEntityPosition(mount,false)
        end
        FreezeEntityPosition(player,false)
        for k,v in pairs(randomized) do 
            DeletePed(v)
        end
    end
end)


---------------------------------------------------
function keysx(table)
    local keys = 0
    for k,v in pairs(table) do
       keys = keys + 1
    end
    return keys
end
local totalkeys = keysx(Config2.randomized)


function GetPlayers()
	local players = {}
	for i = 0, 256 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, GetPlayerServerId(i))
		end
	end
	return players
end
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    TriggerServerEvent("syn_race:sethost")
end)

RegisterNetEvent("syn_race:findmain")
AddEventHandler("syn_race:findmain", function()
    TriggerServerEvent("syn_race:sethost2",GetPlayers())
end)

local host
RegisterNetEvent("syn_race:setmain")
AddEventHandler("syn_race:setmain", function(main)
    host = main
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if Config2.synstable then 
            if Config2.randomizednum ~= 0 then 
                Wait(1000)
                if GetPlayerServerId(PlayerId()) == host then 
                    for k,v in pairs(randomized) do 
                        DeletePed(v)
                    end
                    for i =1, Config2.randomizednum do 
                        local random = math.random(1,totalkeys)
                        for k,v in pairs(Config2.randomized) do 
                            if k == random then 
                                local hashModel = GetHashKey(v.model) 
                                if IsModelValid(hashModel) then 
                                    RequestModel(hashModel)
                                    while not HasModelLoaded(hashModel) do                
                                        Wait(100)
                                    end
                                end        
                                local npc = CreatePed(hashModel, v.loc.x, v.loc.y, v.loc.z, 0, true, true, true, true)
                                Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
                                Citizen.InvokeNative(0xAEB97D84CDF3C00B, npc, true)
                                table.insert(randomized,npc)
                            end
                        end
                    end
                    Wait(waittimerofspawn) 
                else
                    Wait(5000)
                end
            else
                Wait(5000)
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if Config2.synstable then 
            if check then 
                key = tostring(value)
                drawtext(Config2.Language.press.."[~e~"..key.."~q~]", 0.10, 0.50, 0.1, 0.6, true, 255, 255, 255, 255, true, 10000)
                if whenKeyJustPressed(Config2.keys[key]) then
                    fail = false 
                    check = false
                end
            end
        else
            Wait(1000)
        end
    end
end)

local mountx 
local taming = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if taming then 
            Citizen.InvokeNative(0xAEB97D84CDF3C00B, mountx, true)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if Config2.synstable then
            if IsPedOnMount(PlayerPedId()) then 
                local mount = GetMount(PlayerPedId())
                if Citizen.InvokeNative(0x3B005FF0538ED2A9, mount) and Config2.quickactions > num and not contains2(horses,mount) then 
                    mountx = mount
                    taming = true
                    Wait(first)
                    value = math.random(1,8)
                    check = true
                    first = 1500
                    Wait(first)
                    if fail then 
                        TaskHorseAction(mount, 2,0,0)
                        num = 0
                        check = false
                        first = 4000
                    else
                        num = num + 1
                        fail = true 
                    end
                    if Citizen.InvokeNative(0x660639BC60157048,PlayerPedId(),mount) then 
                        num = 0
                        check = false
                        first = 4000
                    end
                end
                if num >= Config2.quickactions then 
                    num = 0
                    TriggerEvent("vorp:TipBottom", Config2.Language.horsetamed, 4000)
                    table.insert(horses,mount)
                    local network = NetworkGetNetworkIdFromEntity(mount)
                    TriggerServerEvent("syn_race:addtamed",network)
                    Citizen.InvokeNative(0xAEB97D84CDF3C00B, mount, false)
                    taming = false
                end
            end
        else
            Wait(1000)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if Config2.synstable then
            for k,v in pairs(Config2.stables) do 
                local coords = GetEntityCoords(PlayerPedId())
                local dist = GetDistanceBetweenCoords(coords.x,coords.y,coords.z, v.pos.x,v.pos.y,v.pos.z, false)
                if 3 > dist then 
                    if IsPedOnMount(PlayerPedId()) then 
                        local mount = GetMount(PlayerPedId())
                        --if contains2(horses,mount) then 
                            DrawText3D(v.pos.x, v.pos.y, v.pos.z, "Press G to open menu")
                            if whenKeyJustPressed(Config2.keys['G2']) then
                                if not getoncooldown() then 
                                    if Config2.jobonly then 
                                        TriggerServerEvent("syn_race:checkjob")
                                        Wait(500)
                                        for j,h in pairs(Config.horsetrainer) do 
                                            if playerjob == h then 
                                                for k,v in pairs(Config.Horses) do 
                                                    for x,y in pairs(v) do 
                                                        if x ~= "name" then 
                                                            local mount2 = GetEntityModel(mount)
                                                            if mount2 == GetHashKey(x) then
                                                                priceofhorse = y[3] 
                                                                horseinfo = x
                                                                WarMenu.OpenMenu('stable')
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        for k,v in pairs(Config.Horses) do 
                                            for x,y in pairs(v) do 
                                                if x ~= "name" then 
                                                    local mount2 = GetEntityModel(mount)
                                                    if mount2 == GetHashKey(x) then
                                                        priceofhorse = y[3] 
                                                        horseinfo = x
                                                        WarMenu.OpenMenu('stable')
                                                    end
                                                end
                                            end
                                        end
                                    end
                                else
                                    TriggerEvent("vorp:TipBottom", Config2.Language.oncooldown, 4000)
                                end
                            Wait(500)
                            end
                        --end
                    end
                end
            end
        else
            Wait(1000)
        end
    end
end)

RegisterNetEvent("syn_race:deleteped")
AddEventHandler("syn_race:deleteped", function()
    TriggerServerEvent("syn_race:cooldown")
    local mount = GetMount(PlayerPedId())
    for k,v in pairs(horses) do 
        if v == mount then 
            v = nil
        end
    end
    DeletePed(mount)
end)