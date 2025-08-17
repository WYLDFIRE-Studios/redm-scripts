local cruise = "off"
local speedx
local blips = {}
local inmenu = false
local playerjob
local letbuyz = 0
local candrive = 0
local checking = false
local ownedtrains = {}
local activetrains = {}
local pass = 0
local consume = false
local update = 0
local mats = {}
local fixing = false 
local topspeeds 
local currentcons
local currentchoice
local currentchoice2
local speedupgrade
local engineupgrade
local found = false 
local infox
local allowcruise = false
local circuit
local missiontrainnetwork
local activemission = {}
local missionstarted = false 
local missionblip
local waiting = false
local inmenu2 = false
local prompts = GetRandomIntInRange(0, 0xffffff)
local prompts2 = GetRandomIntInRange(0, 0xffffff)
local prompts3 = GetRandomIntInRange(0, 0xffffff)
local sitonchair 
local getoffchair 
local issitting = false 
local checkinginfo = false 

TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)

AddEventHandler('menuapi:closemenu', function()
    closemenu()
end)

function closemenu()
    if inmenu then 
        inmenu = false
        ClearPedTasks(PlayerPedId())
        FreezeEntityPosition(PlayerPedId(),false)
    end
    if inmenu2 then 
        inmenu2 = false
    end
end

function upgradesmenu()
	MenuData.CloseAll()
	local elements = {
        {label = Config.Language.coalmaint, value = 'engine'  , desc = ''}
    }
    if 30 > topspeeds then 
        table.insert(elements, {label = Config.Language.speedupgrades, value = 'speed'  , desc = ''})
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.upgrades,
		subtext    = "",
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
		if(data.current.value == 'speed') then
            speedupgrades()
		end

        if(data.current.value == 'engine') then
			engineupgrades()
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function speedupgrades()
	MenuData.CloseAll()
	local elements = {
        
    }
    for k,v in pairs(Config.speedupgrades) do 
        if tonumber(k) == (speedupgrade+1) then
            for x,y in pairs(v.materials) do 
                local imgPath ="<img style='max-height:55px;max-width:55px; float:left; margin-top: -5px;' src='nui://vorp_inventory/html/img/items/"..x..".png'>"
                table.insert(elements, {label = imgPath..y.label.." : "..y.count, value = ""  , desc = ""})
            end
            table.insert(elements, {label = Config.Language.confirm, value = k  , desc = ""})
        end
    end
    
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.speedupgrades,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "upgradesmenu",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        elseif (data.current.value ~= "") then
            MenuData.CloseAll()
            fixing = true 
            local playerPed = PlayerPedId()
            local train = Citizen.InvokeNative(0xF92691AED837A5FC,playerPed)
            Wait(500)
            FreezeEntityPosition(playerPed,true)
            TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 30000, true, false, false, false)
            exports['progressBars']:startUI(30000, Config.Language.upgrading)
            Citizen.Wait(30000)
            TriggerServerEvent("syn_train:upgradetrain",infox,1,data.current.value)
            ClearPedTasks(playerPed)
            FreezeEntityPosition(playerPed,false)
            Wait(500)
            TaskLeaveVehicle(PlayerPedId(),train,0,1)
            fixing = false 
            closemenu()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function engineupgrades()
	MenuData.CloseAll()
	local elements = {
        
    }

    for k,v in pairs(Config.engineupgrades) do 
        if tonumber(k) == (engineupgrade+1) then
            for x,y in pairs(v.materials) do 
                local imgPath ="<img style='max-height:55px;max-width:55px; float:left; margin-top: -5px;' src='nui://vorp_inventory/html/img/items/"..x..".png'>"
                table.insert(elements, {label = imgPath..y.label.." : "..y.count, value = ""  , desc = ""})
            end
            table.insert(elements, {label = Config.Language.confirm, value = k  , desc = ""})
        end
    end    
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.coalmaint,
		subtext    = "",
		align    = 'top-left',
		elements = elements,
        lastmenu = "upgradesmenu",

	},
	function(data, menu)
        if data.current == "backup" then 
            _G[data.trigger]()
        elseif (data.current.value ~= "") then
            MenuData.CloseAll()
            fixing = true 
            local playerPed = PlayerPedId()
            local train = Citizen.InvokeNative(0xF92691AED837A5FC,playerPed)
            Wait(500)
            FreezeEntityPosition(playerPed,true)
            TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 30000, true, false, false, false)
            exports['progressBars']:startUI(30000, Config.Language.upgrading)
            Citizen.Wait(30000)
            TriggerServerEvent("syn_train:upgradetrain",infox,2,data.current.value)
            ClearPedTasks(playerPed)
            FreezeEntityPosition(playerPed,false)
            Wait(500)
            TaskLeaveVehicle(PlayerPedId(),train,0,1)
            fixing = false 
            closemenu()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end



function viewmission()
	MenuData.CloseAll()
	local elements = {
       
    }
    for k,v in pairs(activemission.items) do 
        table.insert(elements, {label = v.label.." : "..v.count, value = ''  , desc = ''})
    end

   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.deliver2,
		subtext    = "",
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
		
	end,
	function(data, menu)
		menu.close()
	end)
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        sleep = true 
        local DataStruct = DataView.ArrayBuffer(256 * 4) 
        local is_data_exists = Citizen.InvokeNative(0x345EC3B7EBDE1CB5, GetEntityCoords(PlayerPedId()), 1.0, DataStruct:Buffer(), 10)
        for i = 1, 10, 1 do
            local scenario = DataStruct:GetInt32(8 * i)
            if scenario ~= 0 then
                if GetHashKey("PROP_VEHICHLE_SEAT_PASSENGER_TRAIN_TG") == Citizen.InvokeNative(0xA92450B5AE687AAF,scenario) then 
                    sleep = false 
                    if not issitting then 
                        local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.trainchair)
                        PromptSetActiveGroupThisFrame(prompts, label)
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,sitonchair) then
                            ClearPedTasksImmediately(PlayerPedId())
                            Citizen.InvokeNative(0xFCCC886EDE3C63EC,PlayerPedId(),false,true)
                            TaskUseScenarioPoint(PlayerPedId(), scenario ,  "" , -1.0, true, false, 0, false, -1.0, true)
                            issitting = true 
                            Wait(10000)
                        end
                    else
                        local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.trainchair)
                        PromptSetActiveGroupThisFrame(prompts2, label)
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,getoffchair) then
                            ClearPedTasks(PlayerPedId())
                            issitting = false 
                            Wait(10000)
                        end
                    end
                end
                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 2546.7, -1299.1, 48.7, true) < 100 then
                    if GetHashKey("PROP_HUMAN_SEAT_CHAIR") == Citizen.InvokeNative(0xA92450B5AE687AAF,scenario) then 
                        sleep = false 
                        if not issitting then 
                            local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.trainchair)
                            PromptSetActiveGroupThisFrame(prompts, label)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,sitonchair) then
                                ClearPedTasksImmediately(PlayerPedId())
                                Citizen.InvokeNative(0xFCCC886EDE3C63EC,PlayerPedId(),false,true)
                                TaskUseScenarioPoint(PlayerPedId(), scenario ,  "" , -1.0, true, false, 0, false, -1.0, true)
                                issitting = true 
                                Wait(10000)
                            end
                        else
                            local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.trainchair)
                            PromptSetActiveGroupThisFrame(prompts2, label)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,getoffchair) then
                                ClearPedTasks(PlayerPedId())
                                issitting = false 
                                Wait(10000)
                            end
                        end
                    end
                end
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)


Citizen.CreateThread(function()
    Citizen.Wait(1000)

    local str = Config.Language.sitonchair
	sitonchair = PromptRegisterBegin()
	PromptSetControlAction(sitonchair, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(sitonchair, str)
	PromptSetEnabled(sitonchair, 1)
    PromptSetVisible(sitonchair, 1)
	PromptSetStandardMode(sitonchair,1)
	PromptSetGroup(sitonchair, prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,sitonchair,true)
	PromptRegisterEnd(sitonchair)

    local str = Config.Language.getoffchair
	getoffchair = PromptRegisterBegin()
	PromptSetControlAction(getoffchair, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(getoffchair, str)
	PromptSetEnabled(getoffchair, 1)
    PromptSetVisible(getoffchair, 1)
	PromptSetStandardMode(getoffchair,1)
	PromptSetGroup(getoffchair, prompts2)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,getoffchair,true)
	PromptRegisterEnd(getoffchair)

    local str = Config.Language.trainmenug
	companymenu = PromptRegisterBegin()
	PromptSetControlAction(companymenu, Config.keys["G"])
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(companymenu, str)
	PromptSetEnabled(companymenu, 1)
    PromptSetVisible(companymenu, 1)
	PromptSetStandardMode(companymenu,1)
	PromptSetGroup(companymenu, prompts3)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,companymenu,true)
	PromptRegisterEnd(companymenu)


    local str = Config.Language.switchLeft
    trackleft = PromptRegisterBegin()
    PromptSetControlAction(trackleft, Config.keys["LEFT"]) 
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(trackleft, str)
    PromptSetEnabled(trackleft, false)
    PromptSetVisible(trackleft, false)
    PromptSetStandardMode(trackleft,1)
    PromptRegisterEnd(trackleft)

    local str = Config.Language.switchRight
    trackright = PromptRegisterBegin()
    PromptSetControlAction(trackright, Config.keys["RIGHT"]) 
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(trackright, str)
    PromptSetEnabled(trackright, false)
    PromptSetVisible(trackright, false)
    PromptSetStandardMode(trackright,1)
    PromptRegisterEnd(trackright)

    local str = Config.Language.upgradetrain
    upgradetrain = PromptRegisterBegin()
    PromptSetControlAction(upgradetrain, Config.keys["X"]) 
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(upgradetrain, str)
    PromptSetEnabled(upgradetrain, false)
    PromptSetVisible(upgradetrain, false)
    PromptSetStandardMode(upgradetrain,1)
    PromptRegisterEnd(upgradetrain)

    local str = Config.Language.traininv
    traininv = PromptRegisterBegin()
    PromptSetControlAction(traininv, Config.keys["2"]) 
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(traininv, str)
    PromptSetEnabled(traininv, false)
    PromptSetVisible(traininv, false)
    PromptSetStandardMode(traininv,1)
    PromptRegisterEnd(traininv)

    local str = Config.Language.viewmission
    showmission = PromptRegisterBegin()
    PromptSetControlAction(showmission, Config.keys["UP"]) 
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(showmission, str)
    PromptSetEnabled(showmission, false)
    PromptSetVisible(showmission, false)
    PromptSetStandardMode(showmission,1)
    PromptRegisterEnd(showmission)

    local str = Config.Language.cancelmission
    cancelmission = PromptRegisterBegin()
    PromptSetControlAction(cancelmission, Config.keys["DOWN"]) 
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(cancelmission, str)
    PromptSetEnabled(cancelmission, false)
    PromptSetVisible(cancelmission, false)
    PromptSetStandardMode(cancelmission,1)
    PromptRegisterEnd(cancelmission)


    traininfo = PromptRegisterBegin()
    PromptSetControlAction(traininfo, Config.keys["U"]) 
    PromptSetEnabled(traininfo, false)
    PromptSetVisible(traininfo, false)
    PromptSetStandardMode(traininfo,1)
    PromptRegisterEnd(traininfo)

    coalmanage = PromptRegisterBegin()
    PromptSetControlAction(coalmanage, Config.keys["D"]) 
    PromptSetEnabled(coalmanage, false)
    PromptSetVisible(coalmanage, false)
    PromptSetStandardMode(coalmanage,1)
    PromptRegisterEnd(coalmanage)

    trainmaint = PromptRegisterBegin()
    PromptSetControlAction(trainmaint, Config.keys["W"]) 
    PromptSetEnabled(trainmaint, false)
    PromptSetVisible(trainmaint, false)
    PromptSetStandardMode(trainmaint,1)
    PromptRegisterEnd(trainmaint)


    TriggerEvent("syn_train:ReturnRight", -988268728,1,1)
    TriggerEvent("syn_train:ReturnLeft", -988268728,0,1)

	for k,v in pairs(Config.Companylocations) do 
		local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
    	SetBlipSprite(blip, v.blipsprite, 1)
    	SetBlipScale(blip, 0.2)
    	Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
        table.insert(blips, blip)
	end
end)

RegisterCommand(Config.deletevehiclecommand, function()--Delete Vehicle
    local playerPed = PlayerPedId()
    local vehicle   = GetVehiclePedIsIn(playerPed, true)
    local hash = GetEntityModel(vehicle)
    if IsThisModelATrain(hash) then 
        local network = NetworkGetNetworkIdFromEntity(vehicle)
        TriggerServerEvent("syn_train:removetrain",network)
    end
    if IsPedInAnyBoat(PlayerPedId()) then  
        TriggerEvent("wsrp:parkboat")
    else
        while not NetworkHasControlOfEntity(vehicle)  do
            Wait(100)
            NetworkRequestControlOfEntity(vehicle)
        end
        SetEntityAsMissionEntity(vehicle, true, true)
        DeleteVehicle(vehicle)
    end
end)


AddEventHandler("onResourceStop",function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for k,v in pairs(blips) do 
            RemoveBlip(v)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local sleep = true 
        for k, v in pairs(Config.Companylocations) do
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2 and not inmenu then
                sleep = false
                local label  = CreateVarString(10, 'LITERAL_STRING', Config.Language.trainmenug2)
                PromptSetActiveGroupThisFrame(prompts3, label)
                if Citizen.InvokeNative(0xC92AC953F0A982AE,companymenu) then
                    checkinginfo = true 
                    TriggerServerEvent("syn_train:checkjob")
                    TriggerServerEvent("syn_train:getactivetrains")
                    TriggerEvent("syn_train:getallinfo")
                    while checkinginfo do 
                        Wait(100)
                    end
                    if playerjob == v.jobname then
                        inmenu = true
                        circuit = v.circuit
                        SetNuiFocus(true,true)
                        SendNUIMessage({
                            action = "show",
                            trains = Config.trains,
                            title = v.Name,
                            owned = ownedtrains,
                            keyprice = Config.keyprice,
                            maint = Config.maintmaterial,
                        })
                    end
                end
            end
        end
        if sleep then 
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function() 
    Wait(1000)
    if Config.debug  then 
        TriggerServerEvent("syn_train:checkjob")
        TriggerServerEvent("syn_train:getactivetrains")
    end
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    Citizen.Wait(5000)
    TriggerServerEvent("syn_train:checkjob")
    TriggerServerEvent("syn_train:getactivetrains")
end)

local gettingowned = false
RegisterNetEvent("syn_train:getallinfo")
AddEventHandler("syn_train:getallinfo", function()
    gettingowned = true 
    TriggerServerEvent("syn_train:getownedtrains")
    while gettingowned do 
        Wait(100)
    end
    TriggerServerEvent("syn_train:gettrainitems",ownedtrains)
end)
RegisterNetEvent("syn_train:gettrains")
AddEventHandler("syn_train:gettrains", function(trains)
    ownedtrains = trains
    gettingowned = false 
    checkinginfo = false 
end)

RegisterNetEvent("syn_train:getjob")
AddEventHandler("syn_train:getjob", function(job)
    playerjob = job
end)
RegisterNetEvent("syn_train:coalz")
AddEventHandler("syn_train:coalz", function(info)
    TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.amount, function(cb)
        local count = tonumber(cb)
        if count ~= nil and count ~= 'close' and count ~= '' then
            local total = count + info.coal
            if info.coalcap >= total then 
                TriggerEvent("syn_train:coalz2",info,count)
            end
        else
            TriggerEvent("vorp:TipBottom", Config.Language.invalid, 4000)
        end
    end)
end)

RegisterNetEvent("syn_train:coalz2")
AddEventHandler("syn_train:coalz2", function(info,count)
    TriggerServerEvent("syn_train:checkcoal",count)
    Wait(1000)
    if pass == 1 then 
        info.coal = info.coal + count
        TriggerServerEvent("syn_train:addactivetrain",info)
        TriggerServerEvent("syn_train:addcoal",info)
        pass = 0
    else
        TriggerEvent("vorp:TipBottom", Config.Language.invalid, 4000)
    end
end)
RegisterNetEvent("syn_train:itempass")
AddEventHandler("syn_train:itempass", function(letpass)
    candrive = letpass
end)

RegisterNetEvent("syn_train:itempass2")
AddEventHandler("syn_train:itempass2", function(letpass)
    pass = letpass
end)

RegisterNetEvent("syn_train:moneypass")
AddEventHandler("syn_train:moneypass", function(letbuy)
    letbuyz = letbuy
end)

RegisterNetEvent("syn_train:setactive")
AddEventHandler("syn_train:setactive", function(spawnedtrains)
    activetrains = spawnedtrains
end)

RegisterNUICallback('closeui', function(data)
    SetNuiFocus(false,false) 
    inmenu = false
end)

RegisterNUICallback('buykey', function(data)
    SetNuiFocus(false,false) 
    TriggerServerEvent("syn_train:moneycheck",Config.keyprice)
    Wait(500)
    if letbuyz == 1 then 
        TriggerEvent("vorp:TipBottom", Config.Language.boughtkey..Config.keyprice, 4000)
        inmenu = false
        TriggerServerEvent("syn_train:buykey")
    else
        TriggerEvent("vorp:TipBottom", Config.Language.nomoney, 4000)
        inmenu = false
    end
end)

RegisterNUICallback('buytrain', function(data)
    SetNuiFocus(false,false) 
    TriggerServerEvent("syn_train:moneycheck",data.price)
    Wait(500)
    if letbuyz == 1 then 
        TriggerEvent("syn_inputs:sendinputs", Config.Language.confirm, Config.Language.name, function(cb)
            local count = cb
            if count ~= nil and count ~= 'close' and count ~= '' then
                local name = count
                TriggerEvent("vorp:TipBottom", Config.Language.boughtatrain..data.price, 4000)
                TriggerServerEvent("syn_train:buytrain",data.hash,data.speed,data.coalcon,data.price,data.coalcap,playerjob,name,data.img)
            else
                TriggerEvent("vorp:TipBottom", Config.Language.invalid, 4000)
            end
        end)
        inmenu = false
    else
        TriggerEvent("vorp:TipBottom", Config.Language.invalid, 4000)
        inmenu = false
    end
end)

function int2float(integer)
    return integer + 0.0
end

RegisterNUICallback('spawntrain', function(data)
    SetNuiFocus(false,false) 
    inmenu = false
    local id = data.id
    for k,v in pairs(ownedtrains) do 
        if id == v.id then 
            local trainHash = tonumber(v.hash)
            local trainWagons = N_0x635423d55ca84fc8(trainHash)
            for wagonIndex = 0, trainWagons - 1 do
                local trainWagonModel = N_0x8df5f6a19f99f0d5(trainHash, wagonIndex)
                while not HasModelLoaded(trainWagonModel) do
                    Citizen.InvokeNative(0xFA28FE3A6246FC30,trainWagonModel,1)
                    Citizen.Wait(100)
                end
            end
            DoScreenFadeOut(2000)
            Wait(2000)
            local train = N_0xc239dbd9a57d2a71(trainHash, GetEntityCoords(PlayerPedId()), tonumber(data.direction), 0, 1, 1)
            SetTrainSpeed(train, 0.0)
            SetTrainCruiseSpeed(train,int2float(v.speed))
            Citizen.InvokeNative(0x9F29999DFDF2AEB8,train,int2float(v.speed))
            TaskWarpPedIntoVehicle(PlayerPedId(), train, -1)
            local blipname = "Train"
            local bliphash = -399496385
            local blip = Citizen.InvokeNative(0x23f74c2fda6e7c61, bliphash, train) -- BLIPADDFORENTITY
            SetBlipScale(blip, 1.5)
            local networkid = NetworkGetNetworkIdFromEntity(train)
            local inventoryid = v.contid
            local atrain = {networkid = networkid, id = v.id,inv = inventoryid,coalup = v.coalup,speedup = v.speedup,speeds = v.speed, coal = v.coal, coalcap = v.coalcap, coalcon = v.coalcon, maint = v.maint}
            TriggerServerEvent("syn_train:addactivetrain",atrain)
            Wait(100)
            TaskLeaveVehicle(PlayerPedId(),train,0,1)
            Wait(1000)
            DoScreenFadeIn(2000)
            Wait(2000)
        end
    end
end)
function keyz(table)
    local keys = 0
    for k,v in pairs(table) do
       keys = keys + 1
    end
    return keys
end
local missioniscooldown


RegisterNetEvent("syn_train:cooldown")
AddEventHandler("syn_train:cooldown", function(cooldown)
    missioniscooldown = cooldown
end)

AddEventHandler("onResourceStop",function(resourceName)
    if resourceName == GetCurrentResourceName() then
        ClearGpsCustomRoute()
        SetGpsCustomRouteRender(false, 16, 16)
        RemoveBlip(missionblip)
    end
end)



RegisterNUICallback('startmission', function(data) -- findme
    --Wait(5000)
    --SetNuiFocus(false,false) 
    --missioniscooldown = nil 
    --TriggerServerEvent("syn_train:checkcooldown")
    --while missioniscooldown == nil do 
    --    Wait(0)
    --end
    --if missioniscooldown == false then 
        TaskStandStill(PlayerPedId(), -1)
        FreezeEntityPosition(PlayerPedId(),true)
        missionselect(data.id)
    --else
    --    TriggerEvent("vorp:TipBottom", Config.Language.cooldown, 4000)
    --end


    --[[ activemission = {}
    inmenu = false
    local id = data.id
    for k,v in pairs(activetrains) do 
        if v.id == id then 
            for m,n in pairs(Config.missions) do 
                if m == circuit then 
                    local num = keyz(n)
                    local random = math.random(1,num)
                    for x,y in pairs(n) do 
                        if x == random then 
                            activemission = y
                            missionstarted = true 
                        end
                    end
                end
            end
            ClearGpsCustomRoute()
            StartGpsMultiRoute(`COLOR_RED`, true, true)
            local gps = activemission.loc
            AddPointToGpsMultiRoute(gps.x, gps.y, gps.z)
            SetGpsCustomRouteRender(true, 8, 8)
            missiontrainnetwork = v.networkid
            missionblip = N_0x554d9d53f696d002(1664425300, gps.x, gps.y, gps.z)
    	    SetBlipSprite(missionblip, -1546805641, 1)
    	    SetBlipScale(missionblip, 0.2)
    	    Citizen.InvokeNative(0x9CB1A1623062F402, missionblip, Config.Language.deliver)
            Citizen.InvokeNative(0x662D364ABF16DE2F,missionblip,0x6F85C3CE)
        end
    end ]]
end)

function missionselect(trainid)
	MenuData.CloseAll()
	local elements = {
       
    }
    for k,v in pairs(Config.missions[circuit]) do 
        table.insert(elements, {label = v.label.." : $"..v.reward, value = k  , desc = ''})
    end

   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.deliver2,
		subtext    = "",
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
        if data.current then 
            menu.close()
            starttingmission(data.current.value,trainid)
        end
	end,
	function(data, menu)
		menu.close()
	end)
end
function starttingmission(missionkey,trainid)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(),false)
    inmenu = false 
    activemission = Config.missions[circuit][missionkey]
    for k,v in pairs(activetrains) do 
        if v.id == trainid then 
            missionstarted = true 
            ClearGpsCustomRoute()
            StartGpsMultiRoute(`COLOR_RED`, true, true)
            local gps = activemission.loc
            AddPointToGpsMultiRoute(gps.x, gps.y, gps.z)
            SetGpsCustomRouteRender(true, 8, 8)
            missiontrainnetwork = v.networkid
            missionblip = N_0x554d9d53f696d002(1664425300, gps.x, gps.y, gps.z)
            SetBlipSprite(missionblip, -1546805641, 1)
            SetBlipScale(missionblip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, missionblip, Config.Language.deliver)
            Citizen.InvokeNative(0x662D364ABF16DE2F,missionblip,0x6F85C3CE)
        end
    end 
end




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if missionstarted then 
            local gps = activemission.loc
            local coords = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(coords.x,coords.y,coords.z, gps.x,gps.y,gps.z, false)
            if dist < activemission.distcheck then 
                local train = GetPlayersLastVehicle()
                if train == nil then 
                    train = GetVehiclePedIsIn(PlayerPedId(), false)
                end
                if train ~= nil and DoesEntityExist(train) then 
                    local network = NetworkGetNetworkIdFromEntity(train)
                    if network == missiontrainnetwork and not waiting then 
                        drawtext(Config.Language.pressdeliver, 0.15, 0.79, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                        if whenKeyJustPressed(Config.keys["5"]) then
                            waiting = true 
                            TriggerServerEvent("syn_train:checkmissionitems",activemission,missiontrainnetwork)
                            Wait(500)
                        end
                    end
                end
            end
        end
    end
end)
RegisterNetEvent("syn_train:deliverycanceled")
AddEventHandler("syn_train:deliverycanceled", function()
    waiting = false
    missionstarted = false
    ClearGpsCustomRoute()
    SetGpsCustomRouteRender(false, 16, 16)
    RemoveBlip(missionblip) 
end)
RegisterNetEvent("syn_train:deliveryfinished")
AddEventHandler("syn_train:deliveryfinished", function()
    missionstarted = false
    ClearGpsCustomRoute()
    SetGpsCustomRouteRender(false, 16, 16)
    RemoveBlip(missionblip) 
    waiting = false
    DoScreenFadeOut(2000)
    Wait(4000)
    SetEntityCoords(PlayerPedId(), activemission.loc.x, activemission.loc.y, activemission.loc.z)
    Wait(2000)
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 30000, true, false, false, false)
    DoScreenFadeIn(10000)
    exports['progressBars']:startUI(20000, Config.Language.delivering)
    Citizen.Wait(20000)
    ClearPedTasks(PlayerPedId())
    TriggerEvent("vorp:TipBottom", Config.Language.deliverycomplete..activemission.reward, 4000)
end)


RegisterNetEvent("syn_train:ReturnLeft")
AddEventHandler("syn_train:ReturnLeft", function(track,id,left)
    Citizen.InvokeNative(0xE6C5E2125EB210C1,track, id, left)
    Citizen.InvokeNative(0x3ABFA128F5BF5A70,track, id, left)
end)

RegisterNetEvent("syn_train:ReturnRight")
AddEventHandler("syn_train:ReturnRight", function(track,id,right)
    Citizen.InvokeNative(0xE6C5E2125EB210C1,track, id, right)
    Citizen.InvokeNative(0x3ABFA128F5BF5A70,track, id, right)
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
        if checking == false then 
            checking = true
            if Citizen.InvokeNative(0x1D46B417F926D34D,playerPed) then
                local train = Citizen.InvokeNative(0xF92691AED837A5FC,playerPed)
                local hash = GetEntityModel(train)
                if IsThisModelATrain(hash) then
                    Wait(500) 
                    TriggerServerEvent("syn_train:keycheck")
                    Wait(500)
                    if candrive == 0 then 
                        TaskLeaveVehicle(playerPed,train,0,1)
                    end
                end
            end
            checking = false
        end
    end
end)


Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if consume then 
            local playerPed = PlayerPedId()
            if IsPedInAnyVehicle(playerPed, true) then
                local train   = GetVehiclePedIsIn(playerPed, false)
                local network = NetworkGetNetworkIdFromEntity(train)
                local hash = GetEntityModel(train)
                for k,v in pairs(activetrains) do 
                    if v.networkid == network then
                        v.coal = v.coal - 1
                        if Config.maintmaterial then 
                            v.maint = v.maint - Config.maintrate
                        end
                        local time = v.coalcon * 1000
                        Wait(time)
                        update = update + 1 
                        if update == 2 or v.coal == 0 or (Config.maintmaterial and v.maint == 0) then 
                            TriggerServerEvent("syn_train:addactivetrain",v)
                            TriggerServerEvent("syn_train:addcoal",v)
                            TriggerServerEvent("syn_train:addmaint",v)
                            update = 0
                        end
                    end
                end
            else
                consume = false 
            end
        end
    end
end)
function NearestValue(table, number)
    local smallestSoFar, smallestIndex
    for i, y in pairs(table) do
        local num = tonumber(i)
        if not smallestSoFar or (math.abs(number-num) < smallestSoFar) then
            smallestSoFar = math.abs(number-num)
            smallestIndex = y
        end
    end
    return smallestIndex, table[smallestIndex]
end
RegisterNetEvent("syn_train:startmaint")
AddEventHandler("syn_train:startmaint", function(info)
    fixing = true 
    local playerPed = PlayerPedId()
    local train = Citizen.InvokeNative(0xF92691AED837A5FC,playerPed)
    Wait(500)
    FreezeEntityPosition(playerPed,true)
    TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, Config.Language.fixing)
    Citizen.Wait(30000)
    TriggerServerEvent("syn_train:toaddmaint",info,mats)
    ClearPedTasks(playerPed)
    FreezeEntityPosition(playerPed,false)
    Wait(500)
    TaskLeaveVehicle(PlayerPedId(),train,0,1)
    fixing = false 
end)


RegisterNetEvent("syn_train:trainfixed")
AddEventHandler("syn_train:trainfixed", function(info)
    for k,v in pairs(activetrains) do 
        if v.networkid == info.networkid then
            v.maint = info.maint
        end
    end
end)

RegisterNetEvent("syn_train:trainupgraded")
AddEventHandler("syn_train:trainupgraded", function(infox,currentchoice)
    if currentchoice == 1 then 
        for k,v in pairs(activetrains) do 
            if v.networkid == infox.networkid then
                v.speeds = infox.speeds
                v.speedup = infox.speedup
            end
        end
    elseif currentchoice == 2 then 
        for k,v in pairs(activetrains) do 
            if v.networkid == infox.networkid then
                v.coalcon = infox.coalcon
                v.coalup = infox.coalup
            end
        end
    end
end)



Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, true) then
            local train   = GetVehiclePedIsIn(playerPed, false)
            local hash = GetEntityModel(train)
            if IsThisModelATrain(hash) then 
                local speed = GetEntitySpeed(train)
                local network = NetworkGetNetworkIdFromEntity(train)
                if candrive == 1 and fixing == false and (inmenu == false or inmenu2 == true) then 
                    for k,v in pairs(activetrains) do 
                        if v.networkid == network then 
                            for b,f in pairs(Config.upgjob) do 
                                if f == playerjob then
                                    if speed == 0 and not inmenu2 then 
                                        PromptSetEnabled(upgradetrain, true)
                                        PromptSetVisible(upgradetrain, true)
                                        if Citizen.InvokeNative(0xC92AC953F0A982AE,upgradetrain) then
                                        --drawtext(Config.Language.press3, 0.15, 0.60, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                                        --if whenKeyJustPressed(Config.keys["3"]) and not inmenu2 then
                                            topspeeds = v.speeds
                                            currentcons = v.coalcon
                                            speedupgrade = v.speedup
                                            engineupgrade = v.coalup
                                            infox = v
                                            inmenu = true
                                            inmenu2 = true 
                                            found = false
                                            --[[ Wait(100)
                                            TriggerEvent("vorp:TipBottom", Config.Language.usearrow, 10000)
                                            WarMenu.OpenMenu('upgrades')
                                            Wait(500) ]]
                                            upgradesmenu()
                                        end
                                    else
                                        PromptSetEnabled(upgradetrain, false)
                                        PromptSetVisible(upgradetrain, false)
                                    end
                                end
                            end
                            if Config.maintmaterial then 
                                PromptSetEnabled(trainmaint, true)
                                PromptSetVisible(trainmaint, true)
                                for b,f in pairs(Config.maintjob) do 
                                    if f == playerjob then 
                                        if 90 >= v.maint then 
                                            if speed == 0 then 
                                                local str2 = CreateVarString(10, 'LITERAL_STRING',Config.Language.trainmaints..v.maint)
                                                PromptSetText(trainmaint, str2)
                                                if Citizen.InvokeNative(0xC92AC953F0A982AE,trainmaint) and not inmenu2 then
                                                    if Config.minmaintshow >= v.maint then 
                                                        mats = NearestValue(Config.maintmaterials, v.maint)
                                                        TriggerEvent("syn_train:startmaint",v)
                                                    else
                                                        TriggerEvent("vorp:TipBottom", Config.Language.nomaintneeded, 4000)
                                                    end
                                                end
                                            else
                                                PromptSetEnabled(trainmaint, false)
                                                PromptSetVisible(trainmaint, false)
                                            end
                                        
                                        end
                                    end
                                end
                            end
                            
                            if missionstarted and not inmenu then 
                                PromptSetEnabled(showmission, true)
                                PromptSetVisible(showmission, true)
                                PromptSetEnabled(cancelmission, true)
                                PromptSetVisible(cancelmission, true)
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,showmission) then
                                    inmenu = true 
                                    viewmission()
                                end
                                if Citizen.InvokeNative(0xC92AC953F0A982AE,cancelmission) then
                                    missionstarted = false
                                    ClearGpsCustomRoute()
                                    SetGpsCustomRouteRender(false, 16, 16)
                                    RemoveBlip(missionblip) 
                                    waiting = false
                                end
                            else
                                PromptSetEnabled(showmission, false)
                                PromptSetVisible(showmission, false)
                                PromptSetEnabled(cancelmission, false)
                                PromptSetVisible(cancelmission, false)
                            end
                            
                            PromptSetEnabled(traininv, true)
                            PromptSetVisible(traininv, true)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,traininv) and not inmenu2 then
                                if Config.synsociety then
                                    TriggerEvent("syn_Container:openinventory", Config.Language.train, v.inv)
                                else
                                    TriggerServerEvent("syn_Container:reloadContainerInventory", v.inv)
                                    TriggerEvent("vorp_inventory:OpenContainerInventory", Config.Language.train, v.inv)
                                end
                            end


                            if v.coal == 0 or (Config.maintmaterial and v.maint == 0) or inmenu2 then
                                if cruise == "on" then 
                                    cruise = "off"
                                end
                                DisableControlAction(0,Config.keys["SHIFT"],true)
                                if 0 == speed then 
                                    DisableControlAction(0,Config.keys["CTRL2"],true)
                                end
                            end
                            if speed > 0 and v.coal > 0 and v.maint > 0 then 
                                consume = true 
                            else
                                consume = false
                            end
                            local str2 = CreateVarString(10, 'LITERAL_STRING', Config.Language.coal..v.coal.." / "..v.coalcap)
                            PromptSetText(coalmanage, str2)
                            PromptSetEnabled(coalmanage, true)
                            PromptSetVisible(coalmanage, true)
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,coalmanage) and not inmenu2 then
                                TriggerEvent("syn_train:coalz",v)
                            end
                        end
                    end
                    local str 
                    if Config.cruisecontrol then 
                        str = CreateVarString(10, 'LITERAL_STRING', Config.Language.speedz..round(speed)..Config.Language.mph.." / "..Config.Language.cruisee..cruise)
                        if speed == 0 then 
                            if cruise == "on" then 
                                cruise = "off"
                            end
                        end
                        if controlheld(Config.keys["CTRL2"]) and not inmenu2 then
                            allowcruise = false 
                        else
                            allowcruise = true
                        end
                        if cruise == "on" then 
                            SetTrainSpeed(train,speedx)
                        end
                    else
                        str = CreateVarString(10, 'LITERAL_STRING', Config.Language.speedz..round(speed)..Config.Language.mph)
                    end
                    PromptSetText(traininfo, str)
                    PromptSetEnabled(traininfo, true)
                    PromptSetVisible(traininfo, true)
                    if Config.cruisecontrol then 
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,traininfo) and not inmenu2 then
                            if cruise == "on" then 
                                cruise = "off"
                            elseif cruise == "off" then 
                                speedx = GetEntitySpeed(train)
                                cruise = "on"
                            end
                        end
                    end

                    local low = 100000
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    local heading = GetEntityHeading(playerPed)
                    for k,v in pairs(Config.junctions) do 
                        local dist = GetDistanceBetweenCoords(coords.x,coords.y,coords.z, v.pos.x,v.pos.y,v.pos.z, false)
                        dist = tonumber(dist)
                        if dist < low then 
                            low = dist
                        end
                    end
                    for k,v in pairs(Config.junctions) do
                        local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.pos.x, v.pos.y, v.pos.z, false)
                        if distance == low then 
                            if distance <= Config.junctionsdistance then
                                if heading >= v.heading_min and heading <= v.heading_max then
        
                                    PromptSetEnabled(trackleft, true)
                                    PromptSetVisible(trackleft, true)
                                    PromptSetEnabled(trackright, true)
                                    PromptSetVisible(trackright, true)
                                    
                                    if Citizen.InvokeNative(0xC92AC953F0A982AE,trackleft) then
                                        TriggerServerEvent("syn_train:SendLeft", v.track, v.id, v.left)
                                    elseif Citizen.InvokeNative(0xC92AC953F0A982AE,trackright) then
                                        TriggerServerEvent("syn_train:SendRight", v.track, v.id, v.right)
                                    end
                                else
                                    PromptSetEnabled(trackleft, false)
                                    PromptSetVisible(trackleft, false)
                                    PromptSetEnabled(trackright, false)
                                    PromptSetVisible(trackright, false)
                                end
                            else
                                PromptSetEnabled(trackleft, false)
                                PromptSetVisible(trackleft, false)
                                PromptSetEnabled(trackright, false)
                                PromptSetVisible(trackright, false)
                            end
                        end
                    end
                else
                    PromptSetEnabled(trackleft, false)
                    PromptSetVisible(trackleft, false)
                    PromptSetEnabled(trackright, false)
                    PromptSetVisible(trackright, false)
                    PromptSetEnabled(upgradetrain, false)
                    PromptSetVisible(upgradetrain, false)
                    PromptSetEnabled(showmission, false)
                    PromptSetVisible(showmission, false)
                    PromptSetEnabled(cancelmission, false)
                    PromptSetVisible(cancelmission, false)
                    PromptSetEnabled(traininfo, false)
                    PromptSetVisible(traininfo, false)
                    PromptSetEnabled(traininv, false)
                    PromptSetVisible(traininv, false)
                    PromptSetEnabled(coalmanage, false)
                    PromptSetVisible(coalmanage, false)
                    PromptSetEnabled(trainmaint, false)
                    PromptSetVisible(trainmaint, false)
                end
            end
        else
            PromptSetEnabled(trackleft, false)
            PromptSetVisible(trackleft, false)
            PromptSetEnabled(trackright, false)
            PromptSetVisible(trackright, false)
            PromptSetEnabled(upgradetrain, false)
            PromptSetVisible(upgradetrain, false)
            PromptSetEnabled(showmission, false)
            PromptSetVisible(showmission, false)
            PromptSetEnabled(cancelmission, false)
            PromptSetVisible(cancelmission, false)
            PromptSetEnabled(traininfo, false)
            PromptSetVisible(traininfo, false)
            PromptSetEnabled(traininv, false)
            PromptSetVisible(traininv, false)
            PromptSetEnabled(coalmanage, false)
            PromptSetVisible(coalmanage, false)
            PromptSetEnabled(trainmaint, false)
            PromptSetVisible(trainmaint, false)
        end
    end
end)



function round(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
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

function controlheld(key)
    if Citizen.InvokeNative(0xF3A21BCD95725A4A, 0, key) then
        return true
    else
        return false
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