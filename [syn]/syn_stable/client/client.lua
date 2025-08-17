cam = nil
hided = false
spawnedCamera = nil
choosePed = {}
pedSelected = nil
zoom = 4.0
offset = 0.2
DeleteeEntity = true
local InterP = true
local HorseName2 = ""
local adding = true
local stableopen = false
local generaldata
local showroomHorse_entity
local showroomwagon_entity
local showroomHorse_model
local showroomwagon_model
local entity 
local entity2 
local horsebonding
local MyHorse_entity
local Mywagon_entity
local IdMyHorse
local IdMywagon
local horsemax
local horsecurrent
local horseModel
local horseName
local wagonModel
local wagonName 
local level
local flying = false
local dead = false
local CompData = {}
local playerjob
local hasLoaded = false
local supporterstatus = 0
local selectionofhorses = {}
local selectionofwagons = {}
local SpawnplayerHorse = nil
local Spawnplayerwagon = nil
local disablehorse = false 

local horseComponents = {}
local exp
local horseid
local sex
local wagonid

local initializing = false
local initializing2 = false


local SaddlesUsing
local SaddleclothsUsing
local StirrupsUsing
local BagsUsing
local ManesUsing
local HorseTailsUsing
local AcsHornUsing
local AcsLuggageUsing
local LanternUsing
local MaskUsing
local MustacheUsing
local HorsebridlesUsing
local HorseholsterUsing
local HorseshoesUsing


function getcloseplayers()
	local closestDistance = 5.0
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed, true, true)
	local closestPlayers = {}

	for _, player in pairs(GetActivePlayers()) do
		local target = GetPlayerPed(player)

		if target ~= playerPed then
			local targetCoords = GetEntityCoords(target, true, true)
			local distance = #(targetCoords - coords)

			if distance < closestDistance then
                local serverid = GetPlayerServerId(player)
				table.insert(closestPlayers, serverid)
			end
		end
	end
	return closestPlayers
end

TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)

RegisterNetEvent("syn_stable:disablehorse")
AddEventHandler("syn_stable:disablehorse", function(x)
    disablehorse = x 
end)

RegisterNetEvent("syn_stable:finda")
AddEventHandler("syn_stable:finda", function(x)
    horseid = x 
end)

Citizen.CreateThread(function() -- onesync culling
    while true do
        Citizen.Wait(10)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        if entity ~= nil then 
            local coords2 = GetEntityCoords(entity)
            if GetDistanceBetweenCoords(coords,coords2,  true) > 500 then
                if horseid ~= nil and not IsEntityDead(entity) then 
                    local stamina = Citizen.InvokeNative(0x775A1CA7893AA8B5,entity, Citizen.ResultAsFloat()) --ACTUAL STAMINA CORE GETTER
                    local health = GetEntityHealth(entity, Citizen.ResultAsInteger())
                    local stats = {stamina = stamina, health = health}
                    TriggerServerEvent("syn_stable:savehorsestats",horseid,stats)
                    TriggerServerEvent("syn_stable:removenetwork",horseid)
                end
                DeleteEntity(entity)
                entity = nil
            end
        end
        if entity2 ~= nil then 
            local coords2 = GetEntityCoords(entity2)
            if GetDistanceBetweenCoords(coords,coords2,  true) > 500 then
                DeleteEntity(entity2)
                entity2 = nil
            end
        end
    end
end)

RegisterNetEvent("syn_stable:deleteandrespawn")
AddEventHandler("syn_stable:deleteandrespawn", function(typeof)
    if typeof == "horse" then
        if horseid ~= nil and not IsEntityDead(entity) then 
            local stamina = Citizen.InvokeNative(0x775A1CA7893AA8B5,entity, Citizen.ResultAsFloat()) --ACTUAL STAMINA CORE GETTER
            local health = GetEntityHealth(entity, Citizen.ResultAsInteger())
            local stats = {stamina = stamina, health = health}
            TriggerServerEvent("syn_stable:savehorsestats",horseid,stats)
            TriggerServerEvent("syn_stable:removenetwork",horseid)
        end
        DeleteEntity(entity)    
        if entity ~= nil then
            entity = nil
        end
        WhistleHorse()
    else
        DeleteEntity(entity2)    
        if entity2 ~= nil then
            entity2 = nil
        end
        Whistlewagon()
    end
end)

RegisterNetEvent("syn_stable:deletehorse")
AddEventHandler("syn_stable:deletehorse", function()
    if horseid ~= nil and not IsEntityDead(entity) then 
        local stamina = Citizen.InvokeNative(0x775A1CA7893AA8B5,entity, Citizen.ResultAsFloat()) --ACTUAL STAMINA CORE GETTER
        local health = GetEntityHealth(entity, Citizen.ResultAsInteger())
        local stats = {stamina = stamina, health = health}
        TriggerServerEvent("syn_stable:savehorsestats",horseid,stats)
        TriggerServerEvent("syn_stable:removenetwork",horseid)
    end
    DeleteEntity(entity)    
    if entity ~= nil then
        entity = nil
    end
    DeleteEntity(entity2)    
    if entity2 ~= nil then
        entity2 = nil
    end
end)
RegisterNetEvent("syn_stable:findb")
AddEventHandler("syn_stable:findb", function(x)
 wagonid = x 
end)
local filtercounter = 0 
RegisterNetEvent("syn_stable:findjob")
AddEventHandler("syn_stable:findjob", function(job,supporter)
    filtercounter = 0 
    playerjob = job
    selectionofhorses = {}
    selectionofwagons = {}
    supporterstatus = supporter
    if Config.vorp then 
        selectionofhorses = filter()
        selectionofwagons = filter()
    elseif Config.redem then 
        selectionofhorses = Config.Horses
        selectionofwagons = Config.wagons
    end
end)

CanPlayerBuy = function ()
    if Config.joblock then
	    for k, v in pairs(Config.EnableBuyJobs) do
	    	if playerjob == v then
	    		return true
	    	end
	    end
	    return false
    else
        return true
    end
end



cameraUsing = {
    {
        name = "Horse", -- dont change
        x = 0.2,
        y = 0.0,
        z = 1.8
    },
    {
        name = "wagon", -- dont change
        x = 2.0,
        y = -3.0,
        z = 4.8
    },
    {
        name = "Olhos", -- dont change
        x = 0.0,
        y = -0.4,
        z = 0.65
    }
}

local saddlecloths = {}
local acshorn = {}
local bags = {}
local horsetails = {}
local manes = {}
local saddles = {}
local stirrups = {}
local acsluggage = {}
local lantern = {}
local Mask = {}
local mustache = {} -- new
local horsebridles = {}-- new
local horseholster = {}--
local horseshoes = {}--

function contains6(table, element)
    for k, v in pairs(table) do
	  	if v == element then
		    return true
        end
	end
	return false
end

function deep_copy(orig)
    local copy
    if type(orig) == "table" then
      copy = {}
      for orig_key, orig_value in next, orig, nil do
        copy[deep_copy(orig_key)] = deep_copy(orig_value)
      end
      setmetatable(copy, deep_copy(getmetatable(orig)))
    else
      copy = orig
    end
    return copy
end

function filter()
    local table2 = nil
    if 1 > filtercounter then 
        table2 =  deep_copy(Config.Horses)
    else
        table2 =  deep_copy(Config.wagons)
    end
    if Config.supporterselection then 
        for k,v in pairs(table2) do 
            for x,y in pairs(v) do 
                if x ~= "name" then 
                    if y[5] ~= nil and supporterstatus ~= nil then 
                        if y[5] > supporterstatus then
                            v[x] = nil
                        end
                    end
                end
            end
        end
    end
    if Config.joblock2 then
        for k,v in pairs(table2) do 
            for x,y in pairs(v) do 
                if x ~= "name" then  
                    if not contains6(y[6], playerjob) and not contains6(y[6], "nojob") then 
                        table2[k][x] = nil
                    end
                end
            end
        end
    end
    filtercounter = filtercounter + 1
    return table2
end



function OpenStable()

    inCustomization = true
    horsesp = true
    stableopen = true
    --ExecuteCommand("hud")
    local playerHorse = MyHorse_entity

    SetEntityHeading(playerHorse, 334)
    DeleteeEntity = true
    SetNuiFocus(true, true)
    InterP = true

    local hashm = GetEntityModel(playerHorse)

    if hashm ~= nil and IsPedOnMount(PlayerPedId()) then
        createCamera(PlayerPedId())
    else
        createCamera(PlayerPedId())
    end
    SendNUIMessage(
        {
            action = "show",
            shopData = selectionofhorses,
            CompData = CompData,
            EnableBuy = CanPlayerBuy(),
            wagonData = selectionofwagons
        }
    )
    TriggerServerEvent("syn_stable:AskForMyHorses")
    TriggerServerEvent("syn_stable:AskForMywagons")
    PlayOpenSound()
end

local promptGroup
local varStringCasa = CreateVarString(10, "LITERAL_STRING", "Stable")
local blip
local prompts = {}
local SpawnPoint = {}
local SpawnPoint2 = {}
local StablePoint = {}
local HeadingPoint
local CamPos = {}
local CamPos2 = {}

local lastActivatedPrompt;

-- Show prompts when required
Citizen.CreateThread(
    function()
        while true do
            Wait(1)
            local coords = GetEntityCoords(PlayerPedId())

            for _, prompt in pairs(prompts) do
                if PromptIsJustPressed(prompt) and stableopen == false then
   
                    DisplayHud(false);
                    DisplayRadar(false);

                    lastActivatedPrompt = prompt;
                    PromptSetVisible(prompt, 0);

                    for k, v in pairs(Config.Stables) do
                        if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 7 then 
                            HeadingPoint = v.Heading
                            StablePoint = {v.Pos.x, v.Pos.y, v.Pos.z}
                            CamPos = {v.SpawnPoint.CamPos.x, v.SpawnPoint.CamPos.y}
                            CamPos2 = {v.SpawnPoint2.CamPos.x, v.SpawnPoint2.CamPos.y}
                            SpawnPoint = {x = v.SpawnPoint.Pos.x, y = v.SpawnPoint.Pos.y, z = v.SpawnPoint.Pos.z, h = v.SpawnPoint.Heading}
                            SpawnPoint2 = {x = v.SpawnPoint2.Pos.x, y = v.SpawnPoint2.Pos.y, z = v.SpawnPoint2.Pos.z, h = v.SpawnPoint2.Heading}
                            Wait(300)
                        end
                    end
                    --Wait(500)
                    --TriggerServerEvent('instanceplayer:setNamed', tonumber(GetPlayerServerId(PlayerId()))+Config.bucketblock)
                    --Wait(500)
                    playerjob = nil 
                    TriggerServerEvent("syn_stable:checkjob")
                    while playerjob == nil do 
                        Wait(500)
                    end
                    if 2 > filtercounter then 
                        Wait(500)
                    end
                    OpenStable()
                    
                end
            end
        end
    end
)

--[[ if Config.vorp then
    Citizen.CreateThread(function()  
        Wait(5000)
        TriggerServerEvent("syn_stable:checkjob")
    end)
end
]]
if Config.vorp then
    RegisterNetEvent("vorp:SelectedCharacter")
    AddEventHandler("vorp:SelectedCharacter", function(charid)
        TriggerServerEvent("syn_stable:checkjob")
    end)
end 


if Config.redem then
    RegisterNetEvent("redem:findtheuser")
    AddEventHandler("redem:findtheuser", function()
        TriggerServerEvent("syn_stable:checkjob")
        TriggerServerEvent("syn_stable:getinfo")
    end)
end




Citizen.CreateThread(
    function()
        for _, v in pairs(Config.Stables) do
            if v.showBlip then 
                blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
                SetBlipSprite(blip, 564457427, 1)
                Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.stable)
            end 
            
            local prompt = PromptRegisterBegin()
            PromptSetActiveGroupThisFrame(promptGroup, varStringCasa)
            PromptSetControlAction(prompt, 0xE8342FF2)
            PromptSetText(prompt, CreateVarString(10, "LITERAL_STRING", Config.Language.open))
            PromptSetStandardMode(prompt, true)
            PromptSetEnabled(prompt, 1)
            PromptSetVisible(prompt, 1)
            PromptSetHoldMode(prompt, 1)
            PromptSetPosition(prompt, v.Pos.x, v.Pos.y, v.Pos.z)
            N_0x0c718001b77ca468(prompt, 3.0)
            PromptSetGroup(prompt, promptGroup)
            PromptRegisterEnd(prompt)
            table.insert(prompts, prompt)
        end
    end
)

AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            for _, prompt in pairs(prompts) do
                PromptDelete(prompt)
                RemoveBlip(blip)
            end
        end
    end
)
function rotation(dir)
    if showroomwagon_entity ~= nil then
        local pedRot = GetEntityHeading(showroomwagon_entity) + dir
        SetEntityHeading(showroomwagon_entity, pedRot % 360)
    end
    if showroomHorse_entity ~= nil then
        local pedRot = GetEntityHeading(showroomHorse_entity) + dir
        SetEntityHeading(showroomHorse_entity, pedRot % 360)
    end
    if MyHorse_entity ~= nil then
        local playerHorse = MyHorse_entity
        local pedRot = GetEntityHeading(playerHorse) + dir
        SetEntityHeading(playerHorse, pedRot % 360)
    end
    if Mywagon_entity ~= nil then
        local pedRot = GetEntityHeading(Mywagon_entity) + dir
        SetEntityHeading(Mywagon_entity, pedRot % 360)
    end
end
RegisterNUICallback(
    "rotate",
    function()
        rotation(20)
    end
)

function Close()
    
    stableopen = false
    --Wait(500)
    --TriggerServerEvent('instanceplayer:setNamed', 0)
    --Wait(500)

end

RegisterNUICallback(
    "Close",
    function()
        SetNuiFocus(false, false)
        SendNUIMessage(
            {
                action = "hide"
            }
        )
        SetEntityVisible(PlayerPedId(), true)

        showroomHorse_model = nil

        if showroomHorse_entity ~= nil then
            DeleteEntity(showroomHorse_entity)
        end
        if showroomwagon_entity ~= nil then
            DeleteEntity(showroomwagon_entity)
        end

        if MyHorse_entity ~= nil then
            DeleteEntity(MyHorse_entity)
        end
        if entity ~= nil then
            DeleteEntity(entity)
            entity = nil
        end
        if entity2 ~= nil then
            DeleteEntity(entity2)
            entity2 = nil
        end
        if Mywagon_entity ~= nil then
            DeleteEntity(Mywagon_entity)
            Mywagon_entity = nil
        end
        if SpawnplayerHorse ~= nil then
            DeleteEntity(SpawnplayerHorse)
            SpawnplayerHorse = nil
        end
        if horseModel ~= nil then
            horseModel = nil
        end
        if horseName ~= nil then
            horseName = nil
        end
        DestroyAllCams(true)
        showroomHorse_entity = nil
        showroomwagon_entity = nil
        Close()
        PlayCloseSound()
    end
)


AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if (GetCurrentResourceName() ~= resourceName) then
            return
        end
        SetNuiFocus(false, false)
        SendNUIMessage(
            {
                action = "hide"
            }
        )
    end
)

function createCam(creatorType)
    for k, v in pairs(cams) do
        if cams[k].type == creatorType then
            cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", cams[k].x, cams[k].y, cams[k].z, cams[k].rx, cams[k].ry, cams[k].rz, cams[k].fov, false, 0) -- CAMERA COORDS
            SetCamActive(cam, true)
            RenderScriptCams(true, false, 3000, true, false)
            createPeds()
        end
    end
end

local compnumbers = {
    Saddlecloths = 0,
    AcsHorn = 0,
    Bags = 0,
    HorseTails = 0,
    Manes = 0,
    Saddles = 0,
    Stirrups = 0,
    AcsLuggage = 0,
    Lantern = 0,
    Mask = 0,
    Mustache = 0,
    Horsebridles = 0,
    Horseholster = 0,
    Horseshoes = 0,
}

Citizen.CreateThread(function()
    Citizen.Wait(5000)
        if adding == true then
            for i, v in pairs(HorseComp) do
                if v.category == "Saddlecloths" then
                    table.insert(saddlecloths, {hash = v.Hash, price = v.Price})
                    compnumbers.Saddlecloths = compnumbers.Saddlecloths + 1 

                elseif v.category == "AcsHorn" then
                    table.insert(acshorn, {hash = v.Hash, price = v.Price})
                    compnumbers.AcsHorn = compnumbers.AcsHorn + 1 

                elseif v.category == "Bags" then
                    table.insert(bags, {hash = v.Hash, price = v.Price})
                    compnumbers.Bags = compnumbers.Bags + 1 

                elseif v.category == "HorseTails" then
                    table.insert(horsetails, {hash = v.Hash, price = v.Price})
                    compnumbers.HorseTails = compnumbers.HorseTails + 1 

                elseif v.category == "Manes" then
                    table.insert(manes, {hash = v.Hash, price = v.Price})
                    compnumbers.Manes = compnumbers.Manes + 1 

                elseif v.category == "Saddles" then
                    table.insert(saddles, {hash = v.Hash, price = v.Price})
                    compnumbers.Saddles = compnumbers.Saddles + 1 

                elseif v.category == "Stirrups" then
                    table.insert(stirrups, {hash = v.Hash, price = v.Price})
                    compnumbers.Stirrups = compnumbers.Stirrups + 1 

                elseif v.category == "AcsLuggage" then
                    table.insert(acsluggage, {hash = v.Hash, price = v.Price})
                    compnumbers.AcsLuggage = compnumbers.AcsLuggage + 1 

                elseif v.category == "Lantern" then
                    table.insert(lantern, {hash = v.Hash, price = v.Price})
                    compnumbers.Lantern = compnumbers.Lantern + 1 

                elseif v.category == "Mask" then
                    table.insert(Mask, {hash = v.Hash, price = v.Price})
                    compnumbers.Mask = compnumbers.Mask + 1 
                elseif v.category == "Mustache" then
                    table.insert(mustache, {hash = v.Hash, price = v.Price})
                    compnumbers.Mustache = compnumbers.Mustache + 1 

                elseif v.category == "Horsebridles" then
                    table.insert(horsebridles, {hash = v.Hash, price = v.Price})
                    compnumbers.Horsebridles = compnumbers.Horsebridles + 1 

                elseif v.category == "Horseholster" then
                    table.insert(horseholster, {hash = v.Hash, price = v.Price})
                    compnumbers.Horseholster = compnumbers.Horseholster + 1 

                elseif v.category == "Horseshoes" then
                    table.insert(horseshoes, {hash = v.Hash, price = v.Price})
                    compnumbers.Horseshoes = compnumbers.Horseshoes + 1 

                end
            
            end
            CompData = {
                Saddlecloths = saddlecloths,
                AcsHorn = acshorn,
                Bags = bags,
                HorseTails = horsetails,
                Manes = manes,
                Saddles = saddles,
                Stirrups = stirrups,
                AcsLuggage = acsluggage,
                Lantern = lantern,
                Mask = Mask,
                Mustache = mustache,
                Horsebridles = horsebridles,
                Horseholster = horseholster,
                Horseshoes = horseshoes,
            }
            adding = false
            SendNUIMessage(
            {
                action = "addnumbers",
                numbers = compnumbers
            }
        )
        end
    end
)
 

function contains(table, element)
    for k, v in pairs(table) do
	  	if v.Hash == element then
		    return v.category
        end
	end
	return false
end



RegisterNUICallback(
    "Saddles",
    function(data)
        zoom = 4.0 ------ these dont do anything
        offset = 0.2  ------------
        if tonumber(data.id) == 0 then
            num = 0
            SaddlesUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0xBAA7E618, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. saddles[num].hash) -- add .hash
            setcloth(hash)
            SaddlesUsing = ("0x" .. saddles[num].hash) -- add .hash


        end
    end
)

RegisterNUICallback(
    "Saddlecloths",
    function(data)
        zoom = 4.0----- these dont do anything
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            SaddleclothsUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0x17CEB41A, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. saddlecloths[num].hash) -- add .hash
            setcloth(hash)
            SaddleclothsUsing = ("0x" .. saddlecloths[num].hash) -- add .hash
        end
    end
)

RegisterNUICallback(
    "Stirrups",
    function(data)
        zoom = 4.0----- these dont do anything
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            StirrupsUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0xDA6DADCA, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. stirrups[num].hash) -- add .hash
            setcloth(hash)
            StirrupsUsing = ("0x" .. stirrups[num].hash) -- add .hash
        end
    end
)

RegisterNUICallback(
    "Bags",
    function(data)
        zoom = 4.0 ----- these dont do anything
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            BagsUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0x80451C25, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. bags[num].hash) -- add .hash
            setcloth(hash)
            BagsUsing = ("0x" .. bags[num].hash) -- add .hash
        end
    end
)

RegisterNUICallback(
    "Manes",
    function(data)
        zoom = 4.0 ----- these dont do anything
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            ManesUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0xAA0217AB, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. manes[num].hash) -- add .hash
            setcloth(hash)
            ManesUsing = ("0x" .. manes[num].hash) -- add .hash
        end
    end
)

RegisterNUICallback(
    "HorseTails",
    function(data)
        zoom = 4.0 ----- these dont do anything
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            HorseTailsUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0xA63CAE10, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. horsetails[num].hash) -- add .hash
            setcloth(hash)
            HorseTailsUsing = ("0x" .. horsetails[num].hash) -- add .hash
        end
        
    end
)

RegisterNUICallback(
    "AcsHorn",
    function(data)
        zoom = 4.0
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            AcsHornUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0x5447332, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. acshorn[num].hash) -- add .hash
            setcloth(hash)
            AcsHornUsing = ("0x" .. acshorn[num].hash) -- add .hash
        end
    end
)

RegisterNUICallback(
    "AcsLuggage", 
    function(data)
        zoom = 4.0
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            AcsLuggageUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0xEFB31921, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. acsluggage[num].hash) -- add .hash
            setcloth(hash)
            AcsLuggageUsing = ("0x" .. acsluggage[num].hash) -- add .hash
        end
    end
)

RegisterNUICallback(
    "Lantern",
    function(data)
        zoom = 4.0
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            LanternUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0x1530BE1C, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. lantern[num].hash) -- add .hash
            setcloth(hash)
            LanternUsing = ("0x" .. lantern[num].hash) -- add .hash
        end
    end
)
RegisterNUICallback(
    "Mask",
    function(data)
        zoom = 4.0
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            MaskUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0xD3500E5D, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. Mask[num].hash) -- add .hash
            setcloth(hash)
            MaskUsing = ("0x" .. Mask[num].hash) -- add .hash
        end
    end
)

RegisterNUICallback(
    "Mustache",
    function(data)
        zoom = 4.0
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            MustacheUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0x30DEFDDF, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. mustache[num].hash) -- add .hash
            setcloth(hash)
            MustacheUsing = ("0x" .. mustache[num].hash) -- add .hash
        end
    end
)

RegisterNUICallback(
    "Horsebridles",
    function(data)
        zoom = 4.0
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            HorsebridlesUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0x94B2E3AF, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. horsebridles[num].hash) -- add .hash
            setcloth(hash)
            HorsebridlesUsing = ("0x" .. horsebridles[num].hash) -- add .hash
        end
    end
)

RegisterNUICallback(
    "Horseholster",
    function(data)
        zoom = 4.0
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            HorseholsterUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0xAC106B30, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. horseholster[num].hash) -- add .hash
            setcloth(hash)
            HorseholsterUsing = ("0x" .. horseholster[num].hash) -- add .hash
        end
    end
)

RegisterNUICallback(
    "Horseshoes",
    function(data)
        zoom = 4.0
        offset = 0.2
        if tonumber(data.id) == 0 then
            num = 0
            HorseshoesUsing = num
            local playerHorse = MyHorse_entity
            Citizen.InvokeNative(0xD710A5007C2AC539, playerHorse, 0xFACFC3C0, 0) -- HAT REMOVE
            Citizen.InvokeNative(0xCC8CA3E88256E58F, playerHorse, 0, 1, 1, 1, 0) -- Actually remove the component
        else
            local num = tonumber(data.id)
            hash = ("0x" .. horseshoes[num].hash) -- add .hash
            setcloth(hash)
            HorseshoesUsing = ("0x" .. horseshoes[num].hash) -- add .hash
        end
    end
)




myHorses = {}

function setcloth(hash) 
    local model2 = GetHashKey(tonumber(hash))
    if not HasModelLoaded(model2) then
        Citizen.InvokeNative(0xFA28FE3A6246FC30, model2)
    end
    Citizen.InvokeNative(0xD3A7B003ED343FD9, MyHorse_entity, tonumber(hash), true, true, true)
end

RegisterNUICallback(
    "selectHorse",
    function(data)
        TriggerServerEvent("syn_stable:SelectHorseWithId", tonumber(data.horseID))
    end
)



RegisterNUICallback(
    "selectwagon",
    function(data)
        TriggerServerEvent("syn_stable:SelectwagonWithId", tonumber(data.wagonID))
    end
)

RegisterNUICallback(
    "sellHorse",
    function(data)
        if showroomHorse_entity ~= nil then
            DeleteEntity(showroomHorse_entity)
        end
        if showroomwagon_entity ~= nil then
            DeleteEntity(showroomwagon_entity)
        end

        if MyHorse_entity ~= nil then
            DeleteEntity(MyHorse_entity)
        end
        if entity ~= nil then
            DeleteEntity(entity)
            entity = nil
        end
        if entity2 ~= nil then
            DeleteEntity(entity2)
            entity2 = nil
        end
        if Mywagon_entity ~= nil then
            DeleteEntity(Mywagon_entity)
            Mywagon_entity = nil
        end
        if SpawnplayerHorse ~= nil then
            DeleteEntity(SpawnplayerHorse)
            SpawnplayerHorse = nil
        end
        TriggerServerEvent("syn_stable:SellHorseWithId", tonumber(data.horseID))
        TriggerServerEvent("syn_stable:AskForMyHorses")
        
        alreadySentShopData = false
        
        Wait(300)
        SendNUIMessage(
            {
                action = "show",
                shopData = selectionofhorses,
                CompData = CompData,
                EnableBuy = CanPlayerBuy(),
                wagonData = selectionofwagons

            }
        )
        TriggerServerEvent("syn_stable:AskForMywagons")
        TriggerServerEvent("syn_stable:AskForMyHorses")
        PlayCloseSound();
    end
)

RegisterNUICallback(
    "sellwagon",
    function(data)
        TriggerServerEvent("syn_stable:SellwagonWithId", tonumber(data.wagonID))
        TriggerServerEvent("syn_stable:AskForMywagons")
        
        alreadySentShopData = false

        if Mywagon_entity ~= nil then
            DeleteEntity(Mywagon_entity)
            Mywagon_entity = nil
        end

        if entity2 ~= nil then
            DeleteEntity(entity2)
            entity2 = nil
        end

        if Spawnplayerwagon ~= nil then
            DeleteEntity(Spawnplayerwagon)
            Spawnplayerwagon = nil
        end

        if showroomwagon_entity ~= nil then
            DeleteEntity(showroomwagon_entity)
            showroomwagon_entity = nil
        end

        if SpawnplayerHorse ~= nil then
            DeleteEntity(SpawnplayerHorse)    
            SpawnplayerHorse = nil
        end
        if entity ~= nil then
            DeleteEntity(entity)    
            entity = nil
        end
        if wagonModel ~= nil then
            wagonModel = nil
        end
        if wagonName ~= nil then
            wagonName = nil
        end
        Wait(300)
        SendNUIMessage(
            {
                action = "show",
                shopData = selectionofhorses,
                CompData = CompData,
                EnableBuy = CanPlayerBuy(),
                wagonData = selectionofwagons

            }
        )
        TriggerServerEvent("syn_stable:AskForMywagons")
        TriggerServerEvent("syn_stable:AskForMyHorses")
        PlayCloseSound();

    end
)



RegisterNetEvent("syn_stable:ReceiveHorsesData")
AddEventHandler(
    "syn_stable:ReceiveHorsesData",
    function(dataHorses)
        for k,v in pairs(dataHorses) do 
            dataHorses[k].newcomps = json.decode(v.components)
            for x,y in pairs(dataHorses[k].newcomps) do 
                dataHorses[k].newcomps[x] = string.gsub(dataHorses[k].newcomps[x], "0x", "")
            end
        end
        SendNUIMessage(
            {
                myHorsesData = dataHorses,
                CompData = CompData,
                EnableBuy = CanPlayerBuy(),
            }
        )
    end
)

RegisterNetEvent("syn_stable:ReceivewagonsData")
AddEventHandler(
    "syn_stable:ReceivewagonsData",
    function(datawagons)
        SendNUIMessage(
            {
                mywagondata = datawagons,
                CompData = CompData,
                EnableBuy = CanPlayerBuy(),
            }
        )
    end
)


local alreadySentShopData = false





RegisterNUICallback(
    "loadHorse",
    function(data)
        local horseModel = data.horseModel

        if showroomHorse_model == horseModel then
            return
        end
        

        if showroomHorse_entity ~= nil then
            DeleteEntity(showroomHorse_entity)
            showroomHorse_entity = nil
        end

        if showroomwagon_entity ~= nil then
            DeleteEntity(showroomwagon_entity)
            showroomwagon_entity = nil
        end

        if MyHorse_entity ~= nil then
            DeleteEntity(MyHorse_entity)
            MyHorse_entity = nil
        end

        if Mywagon_entity ~= nil then
            DeleteEntity(Mywagon_entity)
            Mywagon_entity = nil
        end

        showroomHorse_model = horseModel

        local modelHash = GetHashKey(showroomHorse_model)

        if not HasModelLoaded(modelHash) then
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(10)
            end
        end
        DeleteEntity(showroomwagon_entity)
        showroomHorse_entity = CreatePed(modelHash, SpawnPoint.x, SpawnPoint.y, SpawnPoint.z - 0.98, SpawnPoint.h, false, 0)
        Citizen.InvokeNative(0x283978A15512B2FE, showroomHorse_entity, true)
        Citizen.InvokeNative(0x58A850EAEE20FAA3, showroomHorse_entity)
        FreezeEntityPosition(showroomHorse_entity, true)
        NetworkSetEntityInvisibleToNetwork(showroomHorse_entity, true)
        SetVehicleHasBeenOwnedByPlayer(showroomHorse_entity, true)
        interpCamera("Horse", showroomHorse_entity)
       

    end
)

 RegisterNUICallback(
    "loadwagon",
    function(data)
        local wagonmodel = data.wagonmodel

        if showroomwagon_model == wagonmodel then
            return
        end


        if showroomHorse_entity ~= nil then
            DeleteEntity(showroomHorse_entity)
            showroomHorse_entity = nil
        end

        if showroomwagon_entity ~= nil then
            DeleteEntity(showroomwagon_entity)
            showroomwagon_entity = nil
        end

        if MyHorse_entity ~= nil then
            DeleteEntity(MyHorse_entity)
            MyHorse_entity = nil
        end

        if Mywagon_entity ~= nil then
            DeleteEntity(Mywagon_entity)
            Mywagon_entity = nil
        end

        showroomwagon_model = wagonmodel

        local modelHash = GetHashKey(showroomwagon_model)

        if not HasModelLoaded(modelHash) then
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(10)
            end
        end

        showroomwagon_entity = CreateVehicle(modelHash, SpawnPoint2.x, SpawnPoint2.y, SpawnPoint2.z, SpawnPoint2.h, false, false)
        SetVehicleOnGroundProperly(showroomwagon_entity)
        Citizen.InvokeNative(0x283978A15512B2FE, showroomwagon_entity, true)
        NetworkSetEntityInvisibleToNetwork(showroomwagon_entity, true)
        SetVehicleHasBeenOwnedByPlayer(showroomwagon_entity, true)
        SetModelAsNoLongerNeeded(modelHash)
        
        interpCamera2("wagon", showroomwagon_entity)
    end
) 

RegisterNUICallback("applycomps",function()
    local dados = {
        SaddlesUsing,
        SaddleclothsUsing,
        StirrupsUsing,
        BagsUsing,
        ManesUsing,
        HorseTailsUsing,
        AcsHornUsing,
        AcsLuggageUsing,
        LanternUsing,
        MaskUsing,
        MustacheUsing,
        HorsebridlesUsing,
        HorseholsterUsing,
        HorseshoesUsing,
    }
    for k,v in pairs(dados) do 
        if v == nil then
            table.remove(dados, k)
        end
    end
    local DadosEncoded = json.encode(dados)
    if DadosEncoded ~= "[]" then            
        TriggerServerEvent("syn_stable:UpdateHorseComponents", dados, IdMyHorse, MyHorse_entity ) 
    end
    PlayCloseSound();

end)


function CloseStable()
    stableopen = false
    PlayCloseSound()
    --ExecuteCommand("hud")
end

RegisterNUICallback(
    "loadMyHorse",
    function(data)
        --print ("HORSE LOADED DATA START")
        --print ("HORSE LOADED DATA END")

        local horseModel = data.horseModel
        IdMyHorse = data.IdHorse
        --[[ if showroomHorse_model == horseModel then
            return
        end ]]

        if showroomHorse_entity ~= nil then
            DeleteEntity(showroomHorse_entity)
            showroomHorse_entity = nil
        end
        if showroomwagon_entity ~= nil then
            DeleteEntity(showroomwagon_entity)
            showroomwagon_entity = nil
        end

        if MyHorse_entity ~= nil then
            DeleteEntity(MyHorse_entity)
            MyHorse_entity = nil
        end

        if Mywagon_entity ~= nil then
            DeleteEntity(Mywagon_entity)
            Mywagon_entity = nil
        end
        

        showroomHorse_model = horseModel

        local modelHash = GetHashKey(showroomHorse_model)

        if not HasModelLoaded(modelHash) then
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(10)
            end
        end
        DeleteEntity(MyHorse_entity)
        MyHorse_entity = CreatePed(modelHash, SpawnPoint.x, SpawnPoint.y, SpawnPoint.z - 0.98, SpawnPoint.h, false, 0)
        Citizen.InvokeNative(0x283978A15512B2FE, MyHorse_entity, true)
        Citizen.InvokeNative(0x58A850EAEE20FAA3, MyHorse_entity)
        NetworkSetEntityInvisibleToNetwork(MyHorse_entity, true)
        SetVehicleHasBeenOwnedByPlayer(MyHorse_entity, true)
        FreezeEntityPosition(MyHorse_entity, true)
        local test2 = GetAttributePoints(MyHorse_entity,7)
        local componentsHorse = json.decode(data.HorseComp)

        SaddlesUsing = nil 
        SaddleclothsUsing = nil 
        StirrupsUsing = nil 
        BagsUsing = nil 
        ManesUsing = nil 
        HorseTailsUsing = nil 
        AcsHornUsing = nil 
        AcsLuggageUsing = nil 
        LanternUsing = nil 
        MaskUsing = nil 
        MustacheUsing = nil 
        HorsebridlesUsing = nil 
        HorseholsterUsing = nil 
        HorseshoesUsing = nil 
        TriggerServerEvent("outisder_horses:AddCoatColor", MyHorse_entity, horseModel,horseComponents)


        if componentsHorse ~= '[]' then 
            for _, Key in pairs(componentsHorse) do
                local model2 = GetHashKey(tonumber(Key))
                if not HasModelLoaded(model2) then
                    Citizen.InvokeNative(0xFA28FE3A6246FC30, model2)
                end
                local key2 = Key:gsub("0x","")
                if contains(HorseComp, key2) == 'Saddles' then 
                    SaddlesUsing = Key
                elseif contains(HorseComp, key2) == 'Saddlecloths' then
                    SaddleclothsUsing = Key
                elseif contains(HorseComp, key2) == 'Stirrups' then
                    StirrupsUsing = Key
                elseif contains(HorseComp, key2) == 'Bags' then
                    BagsUsing = Key
                elseif contains(HorseComp, key2) == 'Manes' then
                    ManesUsing = Key
                elseif contains(HorseComp, key2) == 'HorseTails' then
                    HorseTailsUsing = Key
                elseif contains(HorseComp, key2) == 'AcsHorn' then
                    AcsHornUsing = Key
                elseif contains(HorseComp, key2) == 'AcsLuggage' then
                    AcsLuggageUsing = Key
                elseif contains(HorseComp, key2) == 'Lantern' then 
                    LanternUsing = Key
                elseif contains(HorseComp, key2) == 'Mask' then
                    MaskUsing = Key
                elseif contains(HorseComp, key2) == 'Mustache' then
                    MustacheUsing = Key
                elseif contains(HorseComp, key2) == 'Horsebridles' then
                    HorsebridlesUsing = Key
                elseif contains(HorseComp, key2) == 'Horseholster' then
                    HorseholsterUsing = Key
                elseif contains(HorseComp, key2) == 'Horseshoes' then
                    HorseshoesUsing = Key
                end
                Citizen.InvokeNative(0xD3A7B003ED343FD9, MyHorse_entity, tonumber(Key), true, true, true)
            end
        end

        -- SetModelAsNoLongerNeeded(modelHash)
       
        interpCamera("Horse", MyHorse_entity)
    end
)


RegisterNUICallback(
    "loadMywagons",
    function(data)
        local wagonModel = data.wagonModel
        IdMywagon = data.Idwagon
        if showroomwagon_model == wagonModel then
            return
        end

        if showroomHorse_entity ~= nil then
            DeleteEntity(showroomHorse_entity)
            showroomHorse_entity = nil
        end
        if showroomwagon_entity ~= nil then
            DeleteEntity(showroomwagon_entity)
            showroomwagon_entity = nil
        end

        if MyHorse_entity ~= nil then
            DeleteEntity(MyHorse_entity)
            MyHorse_entity = nil
        end

        if Mywagon_entity ~= nil then
            DeleteEntity(Mywagon_entity)
            Mywagon_entity = nil
        end

        showroomwagon_model = wagonModel

        local modelHash = GetHashKey(showroomwagon_model)

        if not HasModelLoaded(modelHash) then
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(10)
            end
        end



        Mywagon_entity = CreateVehicle(modelHash, SpawnPoint2.x, SpawnPoint2.y, SpawnPoint2.z, SpawnPoint2.h, false, false)
        SetVehicleOnGroundProperly(Mywagon_entity)
        Citizen.InvokeNative(0x283978A15512B2FE, Mywagon_entity, true)
        NetworkSetEntityInvisibleToNetwork(Mywagon_entity, true)
        SetVehicleHasBeenOwnedByPlayer(Mywagon_entity, true)
        SetModelAsNoLongerNeeded(modelHash)


        interpCamera2("wagon", Mywagon_entity)
    end
)

RegisterNetEvent('syn_stable:UpdadeHorseComponents')
AddEventHandler('syn_stable:UpdadeHorseComponents', function(horseEntity, components)
    for _, value in pairs(components) do
        NativeSetPedComponentEnabled(horseEntity, value)
    end
end)

RegisterNUICallback(
    "BuyHorse",
    function(data)
        SetHorseName(data)
        PlayCloseSound();
    end
)
------------------------------------------------ by outsider buy horse female-------------------------------------------------------
-- This could go soon, the data just needs to carry sex
RegisterNUICallback(
    "BuyHorseF",
    function(data)
        SetHorseNameF(data)
        PlayCloseSound();
    end
)

function SetHorseNameF(data)
    generaldata = data
    SetNuiFocus(false, false)
    SendNUIMessage(
        {
            action = "hide"
        }
    )
    Wait(200)

	 Citizen.CreateThread(function()
		AddTextEntry('FMMC_MPM_NA', Config.Language.name)
		DisplayOnscreenKeyboard(0, "FMMC_MPM_NA", "", "", "", "", "", 30)
		while (UpdateOnscreenKeyboard() == 0) do
			DisableAllControlActions(0);
			Citizen.Wait(0);
		end
        
		if (GetOnscreenKeyboardResult()) then
            HorseName2 = GetOnscreenKeyboardResult()
            cclosesstable()
            --WarMenu.OpenMenu('sex') 
            local sex = 1
            TriggerServerEvent('syn_stable:BuyHorse', generaldata, HorseName2,sex) 
            TriggerEvent("vorp:TipBottom", "you have bought a horse visit the stables", 2000)
            
            Wait(1000)
            TriggerServerEvent("syn_stable:AskForMywagons")
            TriggerServerEvent("syn_stable:AskForMyHorses") 
           
        
		end	
    end) 
    
end
--------------------------------------------------------------------------------------------------------------------------------------
function SetHorseName(data)
    generaldata = data
    SetNuiFocus(false, false)
    SendNUIMessage(
        {
            action = "hide"
        }
    )
    Wait(200)

	 Citizen.CreateThread(function()
		AddTextEntry('FMMC_MPM_NA', Config.Language.name)
		DisplayOnscreenKeyboard(0, "FMMC_MPM_NA", "", "", "", "", "", 30)
		while (UpdateOnscreenKeyboard() == 0) do
			DisableAllControlActions(0);
			Citizen.Wait(0);
		end
        
		if (GetOnscreenKeyboardResult()) then
            HorseName2 = GetOnscreenKeyboardResult()
            cclosesstable()
            --WarMenu.OpenMenu('sex') 
            local sex = 0
            TriggerServerEvent('syn_stable:BuyHorse', generaldata, HorseName2,sex)
            Wait(1000)
            TriggerServerEvent("syn_stable:AskForMywagons")
            TriggerServerEvent("syn_stable:AskForMyHorses") 
        
		end	
    end) 
    
end
-----------------------------------------SET WAGON NAME FUNCTION --------------------------------------
RegisterNUICallback(
    "BuyWagon", 
    function(data)
        SetWagonName(data)
        PlayCloseSound();
    end
)

function SetWagonName(data)

    SetNuiFocus(false, false)
    SendNUIMessage(
        {
            action = "hide"
        }
    )

    Wait(200)
    local wagonname = ""

	 Citizen.CreateThread(function()
		AddTextEntry('FMMC_MPM_NA', Config.Language.name2)
		DisplayOnscreenKeyboard(0, "FMMC_MPM_NA", "", "", "", "", "", 30)
		while (UpdateOnscreenKeyboard() == 0) do
			DisableAllControlActions(0);
			Citizen.Wait(0);
		end
		if (GetOnscreenKeyboardResult()) then
            wagonname = GetOnscreenKeyboardResult()
            TriggerServerEvent('syn_stable:Buywagon', data, wagonname)

            SetNuiFocus(true, true)
            SendNUIMessage(
                {
                    action = "show",
                    shopData = selectionofhorses,
                    CompData = CompData,
                    EnableBuy = CanPlayerBuy(),
                    wagonData = selectionofwagons
                }
            )

            Wait(1000)

            TriggerServerEvent("syn_stable:AskForMywagons")
            TriggerServerEvent("syn_stable:AskForMyHorses")

            PlayCloseSound();
        end	
    end) 
end




--------------------------NEW------------------------------------
RegisterNUICallback(
    "CloseStable",
    function()
        SetNuiFocus(false, false)
        SendNUIMessage(
            {
                action = "hide"
            }
        )
        CloseStable()
        SetEntityVisible(PlayerPedId(), true)

        showroomHorse_model = nil

        if showroomHorse_entity ~= nil then
            DeleteEntity(showroomHorse_entity)
        end
        if showroomwagon_entity ~= nil then
            DeleteEntity(showroomwagon_entity)
        end

        if MyHorse_entity ~= nil then
            DeleteEntity(MyHorse_entity)
        end
        if entity ~= nil then
            DeleteEntity(entity)
            entity = nil
        end
        if entity2 ~= nil then
            DeleteEntity(entity2)
            entity2 = nil
        end
        if Mywagon_entity ~= nil then
            DeleteEntity(Mywagon_entity)
            Mywagon_entity = nil
        end
        if SpawnplayerHorse ~= nil then
            DeleteEntity(SpawnplayerHorse)
            SpawnplayerHorse = nil
        end
        if horseModel ~= nil then
            horseModel = nil
        end
        if horseName ~= nil then
            horseName = nil
        end
        DestroyAllCams(true)
        showroomHorse_entity = nil
        showroomwagon_entity = nil
    end
)

function cclosesstable()
    SetNuiFocus(false, false)
    SendNUIMessage(
        {
            action = "hide"
        }
    )
    CloseStable()
    SetEntityVisible(PlayerPedId(), true)

    showroomHorse_model = nil

    if showroomHorse_entity ~= nil then
        DeleteEntity(showroomHorse_entity)
    end
    if showroomwagon_entity ~= nil then
        DeleteEntity(showroomwagon_entity)
    end

    if MyHorse_entity ~= nil then
        DeleteEntity(MyHorse_entity)
    end
    if entity ~= nil then
        DeleteEntity(entity)
        entity = nil
    end
    if entity2 ~= nil then
        DeleteEntity(entity2)
        entity2 = nil
    end
    if Mywagon_entity ~= nil then
        DeleteEntity(Mywagon_entity)
        Mywagon_entity = nil
    end
    if SpawnplayerHorse ~= nil then
        DeleteEntity(SpawnplayerHorse)
        SpawnplayerHorse = nil
    end
    if horseModel ~= nil then
        horseModel = nil
    end
    if horseName ~= nil then
        horseName = nil
    end
    DestroyAllCams(true)
    showroomHorse_entity = nil
    showroomwagon_entity = nil
end



-----------------------------------------------------------------------------------------------------------
-- This doesn't and shouldn't always be running


Citizen.CreateThread(function() 
    while true do
    Citizen.Wait(10)
    local player = PlayerPedId()
        if IsPedOnMount(player) then 
            local mount = GetMount(player)
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0xA1ABB953) then -- button interact horse
                Citizen.InvokeNative(0x06D26A96CA1BCA75,mount,3,0,player)
            end
        end
    end
end)


function SetHorseInfo(horse_model, horse_name, horse_components, horse_exp, horse_id,sexz)
    horseModel = horse_model
    horseName = horse_name
    horseComponents = horse_components
    exp = horse_exp
    horseid = horse_id
    sex = sexz
    InitiateHorse()
end

function SetwagonInfo(wagon_model, wagon_name, wagon_id)
    if Config.lockedtojob then 
        local locked = false 
        for k,v in pairs(Config.lockedwagons) do 
            if k == wagon_model then 
                locked = true
            end
        end
        if locked then 
            if not conx(Config.lockedwagons[wagon_model],playerjob) then 
                TriggerEvent("vorp:TipBottom", Config.Language.nojobreq, 2000)
                return 
            end
        end
        
    end
    wagonModel = wagon_model
    wagonName = wagon_name
    wagonid = wagon_id
    Initiatewagon()
end

function NativeSetPedComponentEnabled(ped, component)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, component, true, true, true)
end

RegisterNetEvent("syn_stable:SetwagonInfo")
AddEventHandler("syn_stable:SetwagonInfo", SetwagonInfo)
local dontrun = false

function Initiatewagon(atCoords)
    if initializing2 then
        return
    end

    initializing2 = true

    if wagonModel == nil and wagonName == nil then
        Citizen.Wait(1000)
        if wagonModel == nil and wagonName == nil then
            TriggerEvent("vorp:TipBottom", Config.Language.nowagon, 2000)
            dontrun = true
        else
            dontrun = false
        end
    end
    if dontrun then
        initializing2 = false
    else 
        if Spawnplayerwagon ~= nil then
            DeleteEntity(Spawnplayerwagon)
            Spawnplayerwagon = nil
        end

        local ped = PlayerPedId()
        local pCoords = GetEntityCoords(ped)

        local modelHash = GetHashKey(wagonModel)

        if not HasModelLoaded(modelHash) then
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(10)
            end
        end

        local spawnPosition
        local spawnPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, Config.spawnrangewagon, 0)
        if spawnPosition == nil then
            initializing2 = false
            return
        end
        entity2 = CreateVehicle(modelHash, spawnPosition.x, spawnPosition.y, spawnPosition.z, 0, true, false)
        SetModelAsNoLongerNeeded(modelHash)
        local spawnable = vector3(0, 0, 0)
        local spawnable2 = vector3(0, 0, 0)
        local nothing, roadpoint = GetClosestRoad(spawnPosition.x,spawnPosition.y,spawnPosition.z,0.0,25,spawnable,spawnable2,0,0,0.0,true)
        local dist = GetDistanceBetweenCoords(spawnPosition,roadpoint, true)
        if Config.horsedistancecall-20 > dist then 
            spawnPosition = roadpoint
        end

        --[[ zone = Citizen.InvokeNative(0x43AD8FC02B429D33,x,y,z,-1)
        if zone == -108848014 or zone == -2066240242 or zone == 892930832 or zone == -2145992129 then 
            SetEntityCoords(entity2, x+5, y+5, z, true, true, true, false)
        else
            for height = 1, 1000 do
                SetEntityCoords(entity2, spawnPosition.x, spawnPosition.y, height + 0.0, true, true, true, false)
                local foundGround, zPos = GetGroundZAndNormalFor_3dCoord(spawnPosition.x, spawnPosition.y, height + 0.0)
                if foundGround then
                    SetEntityCoords(entity2, spawnPosition.x, spawnPosition.y, height + 0.0, true, true, true, false)
                    break
                end

                Citizen.Wait(5)
            end
        end ]]
        local height = 100
        SetEntityCoords(entity2, spawnPosition.x, spawnPosition.y, height + 0.0)
        FreezeEntityPosition(entity2, true)
        Wait(1000)
        local foundground, groundZ, normal  = GetGroundZAndNormalFor_3dCoord(spawnPosition.x, spawnPosition.y, height + 0.0)
        while not foundground do 
        	height = height + 10
        	foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(spawnPosition.x, spawnPosition.y, height + 0.0)
        	Wait(100)
        end
        SetEntityCoords(entity2, spawnPosition.x, spawnPosition.y, groundZ)
        FreezeEntityPosition(entity2, false)
        Citizen.InvokeNative(0xA91E6CF94404E8C9,entity2)


        Spawnplayerwagon = entity2
        local network = NetworkGetNetworkIdFromEntity(entity2)
        TriggerServerEvent("syn_stable:addnetwork2",network,wagonid)
        Citizen.InvokeNative(0x23f74c2fda6e7c61, -1230993421, entity2)
        SetVehicleHasBeenOwnedByPlayer(entity2, true)
        initializing2 = false
    end
end
local gettingstatus = false 
local horsestats = {}
RegisterNetEvent("syn_stable:recstats")
AddEventHandler("syn_stable:recstats", function(stats)
    if stats ~= nil then 
        horsestats = stats
    end
    gettingstatus = false 
end)
RegisterNetEvent("syn_stable:SetHorseInfo")
AddEventHandler("syn_stable:SetHorseInfo", SetHorseInfo)
local dontrun = false

function InitiateHorse(atCoords) -- findme 
    if initializing then
        return
    end

    initializing = true

    if horseModel == nil and horseName == nil then
        Citizen.Wait(1000)
        if horseModel == nil and horseName == nil then
            if Config.vorp then
                TriggerEvent("vorp:TipBottom", Config.Language.nohorse, 2000)
            elseif Config.redem then
                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.nohorse, 2000)
            end
            dontrun = true
        else
            dontrun = false
        end
    end
    if dontrun then
        initializing = false
    else 
        if SpawnplayerHorse ~= nil then
            if horseid ~= nil and not IsEntityDead(entity) then 
                local stamina = Citizen.InvokeNative(0x775A1CA7893AA8B5,entity, Citizen.ResultAsFloat()) --ACTUAL STAMINA CORE GETTER
                local health = GetEntityHealth(entity, Citizen.ResultAsInteger())
                local stats = {stamina = stamina, health = health}
                TriggerServerEvent("syn_stable:savehorsestats",horseid,stats)
                TriggerServerEvent("syn_stable:removenetwork",horseid)
            end
            DeleteEntity(SpawnplayerHorse)
            SpawnplayerHorse = nil
        end

        local ped = PlayerPedId()
        local pCoords = GetEntityCoords(ped)

        local modelHash = GetHashKey(horseModel)

        if not HasModelLoaded(modelHash) then
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(10)
            end
        end

        local spawnPosition
        local spawnPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, Config.spawnrange, 0) --- this would be better to spawn horse on nearest road. so it doesnt spawn inside houses.
        if spawnPosition == nil then
            initializing = false
            return
        end
        DeleteEntity(entity)
        entity = CreatePed(modelHash, spawnPosition, GetEntityHeading(ped), true, true)
        SetModelAsNoLongerNeeded(modelHash)
        local spawnable = vector3(0, 0, 0)
        local spawnable2 = vector3(0, 0, 0)
        local nothing, roadpoint = GetClosestRoad(spawnPosition.x,spawnPosition.y,spawnPosition.z,0.0,25,spawnable,spawnable2,0,0,0.0,true)
        local dist = GetDistanceBetweenCoords(spawnPosition,roadpoint, true)
        if Config.horsedistancecall-20 > dist then 
            spawnPosition = roadpoint
        end

        local height = 100
        SetEntityCoords(entity, spawnPosition.x, spawnPosition.y, height + 0.0)
        FreezeEntityPosition(entity, true)
        Wait(1000)
        local foundground, groundZ, normal  = GetGroundZAndNormalFor_3dCoord(spawnPosition.x, spawnPosition.y, height + 0.0)
        while not foundground do 
        	height = height + 10
        	foundground, groundZ, normal = GetGroundZAndNormalFor_3dCoord(spawnPosition.x, spawnPosition.y, height + 0.0)
        	Wait(100)
        end
        SetEntityCoords(entity, spawnPosition.x, spawnPosition.y, groundZ)
        FreezeEntityPosition(entity, false)
        Citizen.InvokeNative(0xA91E6CF94404E8C9,entity)

        --[[ zone = Citizen.InvokeNative(0x43AD8FC02B429D33,x,y,z,-1)
        if zone == -108848014 or zone == -2066240242 or zone == 892930832 or zone == -2145992129 then 
            SetEntityCoords(entity, x + 5, y + 5, z, true, true, true, false)
        else
            for height = 1, 1000 do
                SetEntityCoords(entity, spawnPosition.x, spawnPosition.y, height + 0.0, true, true, true, false)
                local foundGround, zPos = GetGroundZAndNormalFor_3dCoord(spawnPosition.x, spawnPosition.y, height + 0.0)
                if foundGround then
                    SetEntityCoords(entity, spawnPosition.x, spawnPosition.y, height + 0.0, true, true, true, false)
                    break
                end
                Citizen.Wait(5)
            end
        end ]]
        
        Citizen.InvokeNative(0x9587913B9E772D29, entity, 0)
        Citizen.InvokeNative(0x4DB9D03AC4E1FA84, entity, -1, -1, 0)
        Citizen.InvokeNative(0xBCC76708E5677E1D9, entity, 0)
        Citizen.InvokeNative(0xB8B6430EAD2D2437, entity, GetHashKey("PLAYER_HORSE"))
        Citizen.InvokeNative(0xFD6943B6DF77E449, entity, false)
        SetPedConfigFlag(entity, 324, true)
        SetPedConfigFlag(entity, 211, true)
        SetPedConfigFlag(entity, 208, true)
        SetPedConfigFlag(entity, 209, true)
        SetPedConfigFlag(entity, 400, true)
        SetPedConfigFlag(entity, 297, true)
        SetPedConfigFlag(entity, 136, false)
        SetPedConfigFlag(entity, 312, false)
        SetPedConfigFlag(entity, 113, true)
        SetPedConfigFlag(entity, 301, false)
        SetPedConfigFlag(entity, 277, true)
        SetPedConfigFlag(entity, 319, false)
        SetPedConfigFlag(entity, 6, true)

        SetAnimalTuningBoolParam(entity, 25, false)
        SetAnimalTuningBoolParam(entity, 24, false)
        SetAnimalTuningBoolParam(entity, 48, false)

        TaskAnimalUnalerted(entity, -1, false, 0, 0)
        Citizen.InvokeNative(0x283978A15512B2FE, entity, true)
        SpawnplayerHorse = entity
        local network = NetworkGetNetworkIdFromEntity(entity)
        TriggerServerEvent("syn_stable:addnetwork",network,horseid)

        Citizen.InvokeNative(0xED1C764997A86D5A, PlayerPedId(), entity) 
        SetPedNameDebug(entity, horseName)
        SetPedPromptName(entity, horseName)
        SetAttributePoints(entity, 7, exp)
        if horseComponents ~= nil and horseComponents ~= "0" then
            for _, componentHash in pairs(json.decode(horseComponents)) do
                NativeSetPedComponentEnabled(entity, tonumber(componentHash))
            end
        end
        if horseModel == "A_C_Horse_MP_Mangy_Backup" then     
            NativeSetPedComponentEnabled(entity, 0x106961A8) --sela
            NativeSetPedComponentEnabled(entity, 0x508B80B9) --blanket
        end
        TriggerServerEvent("outisder_horses:AddCoatColor", entity, horseModel,horseComponents)
        Wait(300)
        TaskGoToEntity(entity, ped, -1, 7.2, 2.0, 0, 0)
        SetPedConfigFlag(entity, 297, true) -- Enable_Horse_Leadin
        local bliph = Citizen.InvokeNative(0x23f74c2fda6e7c61, -1230993421, entity)
        Citizen.InvokeNative(0x9CB1A1623062F402, bliph, horseName)
        N_0xe6d4e435b56d5bd0(GetPlayerIndex(),entity) 
        if sex == 1 then
            Citizen.InvokeNative(0x5653AB26C82938CF, entity, 41611, 1.0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, entity, 0, 1, 1, 1, 0)
            initializing = false
        else
            Citizen.InvokeNative(0x5653AB26C82938CF, entity, 41611, 0.0)
            Citizen.InvokeNative(0xCC8CA3E88256E58F, entity, 0, 1, 1, 1, 0)
            initializing = false
        end
        gettingstatus = true 
        TriggerServerEvent("syn_stable:gethorsestats",horseid)
        while gettingstatus do
            Wait(100)
        end  
        if next(horsestats) == nil  then 
            local stamina = Citizen.InvokeNative(0xCB42AFE2B613EE55,entity, Citizen.ResultAsFloat()) --max stamina 
            local stamina2 = Citizen.InvokeNative(0x775A1CA7893AA8B5,entity, Citizen.ResultAsFloat()) --current stamina 
            local check = stamina - stamina2
            local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, entity, 1, Citizen.ResultAsInteger())   
            local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, entity, 0, Citizen.ResultAsInteger())
            Citizen.InvokeNative(0xC6258F41D86676E0, entity, 1, valueStamina + 100)
            Citizen.InvokeNative(0xC6258F41D86676E0, entity, 0, valueHealth + 100)
            local health = GetEntityMaxHealth(entity, Citizen.ResultAsInteger())

            SetEntityHealth(entity, health,0)
            Citizen.InvokeNative(0xC3D4B754C0E86B9E,entity,check+0.0)
            local stats = {stamina = stamina2+check, health = health}

            TriggerServerEvent("syn_stable:savehorsestats",horseid,stats)

        else
            local stamina2 = Citizen.InvokeNative(0x775A1CA7893AA8B5,entity, Citizen.ResultAsFloat()) --current stamina 
            local stamina = Citizen.InvokeNative(0xCB42AFE2B613EE55,entity, Citizen.ResultAsFloat()) --max stamina 
            local maxhealth = GetEntityMaxHealth(entity, Citizen.ResultAsInteger())
            local check = (horsestats.stamina-stamina2)
            if stamina2 + check >= stamina then 
                local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, entity, 1, Citizen.ResultAsInteger()) 
                Citizen.InvokeNative(0xC6258F41D86676E0, entity, 1, valueStamina + 100)
            end
            if horsestats.health >= maxhealth then 
                local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, entity, 0, Citizen.ResultAsInteger())
                Citizen.InvokeNative(0xC6258F41D86676E0, entity, 0, valueHealth + 100)
            end
            if horsestats.health > 0 then 
                SetEntityHealth(entity, horsestats.health,0)
            end
            if (stamina2 + check) > 0 then 
                Citizen.InvokeNative(0xC3D4B754C0E86B9E,entity,check+0.0)
            end
            
        end
    end
end


function GetClosestPlayer2()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
    local tgt
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end
 
    for i=1, #players, 1 do
         tgt = GetPlayerPed(players[i])
        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
 
            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)
 
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
                tgt1 = GetPlayerPed(players[i])
            end
        end
    end
    return tgt,closestDistance
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        Wait(30000)
        if entity ~= nil and horseid ~= nil and not IsEntityDead(entity) then 
            sleep = false 
            local stamina = Citizen.InvokeNative(0x775A1CA7893AA8B5,entity, Citizen.ResultAsFloat()) --ACTUAL STAMINA CORE GETTER
            local health = GetEntityHealth(entity, Citizen.ResultAsInteger())
            local stats = {stamina = stamina, health = health}
            TriggerServerEvent("syn_stable:savehorsestats",horseid,stats)
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
        if ininventory3 then 
            sleep = false 
            if not IsEntityPlayingAnim(PlayerPedId(), "amb_work@world_human_crouch_inspect@male_c@idle_a", "idle_c", 3) then
                local waiting = 0
                RequestAnimDict("amb_work@world_human_crouch_inspect@male_c@idle_a")
                while not HasAnimDictLoaded("amb_work@world_human_crouch_inspect@male_c@idle_a") do
                    waiting = waiting + 100
                    Citizen.Wait(100)
                    if waiting > 5000 then
                        break
                    end
                end
                Citizen.Wait(100)
                TaskPlayAnim(PlayerPedId(), 'amb_work@world_human_crouch_inspect@male_c@idle_a', 'idle_c', 8.0, 8.0, 120000, 31, 0, true, 0, false, 0, false)
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)

local ininventory3 = false 
local searchedhorse 
local searchedwagon

RegisterNetEvent("syn_stable:openloot") -- findme
AddEventHandler("syn_stable:openloot", function(horseid,model)
    searchedhorse = horseid
    if tonumber(searchedhorse) == nil then 
        return 
    end
    ininventory2 = true 
    local newmount = GetClosestPed(GetEntityCoords(PlayerPedId()), 1.5)
    if not IsPedOnMount(PlayerPedId()) then 
        Citizen.InvokeNative(0xCD181A959CFDD7F4, PlayerPedId(), newmount, GetHashKey("Interaction_LootSaddleBags"), 0, 1)
    end
    if Config.vorp then
        local maxlimit = "0"
        for k,v in pairs(Config.Horses) do 
            for x,y in pairs(v) do
                if x ~= "name" then 
                    if GetHashKey(x) == model then
                        maxlimit = tostring(Config.Horses[k][x][4])
                    end
                end
            end
        end
        TriggerServerEvent("syn_stable:ReloadHorseInventory",searchedhorse,maxlimit)
        --TriggerEvent("vorp_inventory:OpenHorseInventory", Config.Language.saddlebags,searchedhorse,maxlimit)
    elseif Config.redem and Config.HorseLocker then
        TriggerEvent("redemrp_inventory:OpenLocker","horse_"..searchedhorse)
    end 
end)

RegisterNetEvent("syn_stable:openloot2") -- findme
AddEventHandler("syn_stable:openloot2", function(wagonid,model)
    searchedwagon = wagonid
    if tonumber(searchedwagon) == nil then 
        return 
    end
    ininventory3 = true 
    if Config.vorp then
        local maxlimit = "0"
        for k,v in pairs(Config.wagons) do 
            for x,y in pairs(v) do
                if x ~= "name" then 
                    if GetHashKey(x) == model then
                        maxlimit = tostring(Config.wagons[k][x][4])
                    end
                end
            end
        end
        TriggerServerEvent("syn_stable:ReloadCartInventory",searchedwagon,maxlimit)
        --TriggerEvent("vorp_inventory:OpenCartInventory", Config.Language.wagon,searchedwagon,maxlimit)
    elseif Config.redem and Config.HorseLocker then
        TriggerEvent("redemrp_inventory:OpenLocker","horse_"..searchedwagon)
    end 
end)

RegisterNetEvent("syn:closeinv")
AddEventHandler("syn:closeinv", function()
	if ininventory2 then 
        ininventory2 = false 
        TriggerServerEvent("syn_stable:closeinventory",searchedhorse)
    end
    if ininventory3 then 
        ininventory3 = false 
        TriggerServerEvent("syn_stable:closeinventory2",searchedwagon)
    end
end)
 
function conx(table, element)
    for k, v in pairs(table) do
        if v == element then
            return true
        end
    end
return false
end

local itemSet  = CreateItemset(true)
local itemSet2  = CreateItemset(true)
AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if GetCurrentResourceName() == resourceName then
            DeleteEntity(SpawnplayerHorse)
            DeleteEntity(entity2)
            SpawnplayerHorse = nil
            entity2 = nil
            entity = nil 
            DestroyAllCams(true)
            CloseStable()
            if IsItemsetValid(itemSet2) then
                Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet2)
            end
        end
    end
)
function GetClosestPed(coords, range)
    local size = Citizen.InvokeNative(0x59B57C4B06531E1E, coords.x,coords.y,coords.z, 40.0, itemSet, 1, Citizen.ResultAsInteger())
    if size > 0 then 
        for index = 0, size - 1 do 
            local entityx = GetIndexedItemInItemset(index, itemSet)
            if GetPedType(entityx) == 28 then 
                if Vdist(coords, GetEntityCoords(entityx)) < range then
                    Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet)
                    return entityx
                end
            end
        end
    end
    if IsItemsetValid(itemSet) then
        Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet)
    end
end
local volumeArea = Citizen.InvokeNative(0xB3FB80A32BAE3065, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0) -- _CREATE_VOLUME_SPHERE

function GetClosestveh(coords, range)
    local vehiclesToDraw = {}
    if volumeArea then 
        Citizen.InvokeNative(0x541B8576615C33DE, volumeArea, coords.x, coords.y, coords.z) -- SET_VOLUME_COORDS
        local itemsFound = Citizen.InvokeNative(0x886171A12F400B89, volumeArea, itemSet2, 2) -- Get volume items into itemset
        if itemsFound then
            n = 0
            while n < itemsFound do
                vehiclesToDraw[(GetIndexedItemInItemset(n, itemSet2))] = true
                n = n + 1
            end
        end
        Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet2)
        for k,v in pairs(vehiclesToDraw) do 
            Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet2)
            return k
        end
        
    end
    if IsItemsetValid(itemSet2) then
        Citizen.InvokeNative(0x20A4BF0E09BEE146, itemSet2)
    end
end
local closewagon
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local coords = GetEntityCoords(PlayerPedId())
        closewagon = GetClosestveh(coords)
        
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local sleep = true 
        if Config.autoclose then 
            local player = PlayerPedId()
            local coords = GetEntityCoords(PlayerPedId())
            local ped,dist =   GetClosestPlayer2()
            local newmount = GetClosestPed(coords, 1.5)    
            if ininventory2 then 
                sleep = false 
                local coords = GetEntityCoords(PlayerPedId())
                local coords2 = GetEntityCoords(newmount)
                if GetDistanceBetweenCoords(coords,coords2 , true) > 1.5 then
                    TriggerEvent("vorp_inventory:CloseInv")
                    ininventory2 = false 
                    TriggerServerEvent("syn_stable:closeinventory",searchedhorse)
                end
            end
            if ininventory3 then 
                sleep = false 
                local coords = GetEntityCoords(PlayerPedId())
                local coords2 = GetEntityCoords(closewagon)
                if GetDistanceBetweenCoords(coords,coords2 , true) > 3 then
                    TriggerEvent("vorp_inventory:CloseInv")
                    ininventory3 = false 
                    TriggerServerEvent("syn_stable:closeinventory2",searchedwagon)
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
        Citizen.Wait(10)
        local player = PlayerPedId()
        local coords = GetEntityCoords(PlayerPedId())
        local ped,dist =   GetClosestPlayer2()
        local newmount = GetClosestPed(coords, 1.5)
        local sleep = true 
        if Config.searchwagons then 
            if closewagon ~= nil then 
                if not Config.policeonly or conx(Config.searchjobs,playerjob) then 
                    if entity2 ~= closewagon and not ininventory3 and not ininventory2 then -- findme
                        sleep = false 
                        if IsDisabledControlJustReleased(0,1287709438)  and not Citizen.InvokeNative(0x3AA24CCC0D451379, PlayerPedId()) and not Citizen.InvokeNative(0x74E559B3BC910685, PlayerPedId()) then 
                            local network = NetworkGetNetworkIdFromEntity(closewagon)
                            local model = GetEntityModel(closewagon)
                            TriggerServerEvent("syn_stable:searchwagon",network,model)
                            Wait(1000)
                        end
                    end
                end
            end
        end
        if Config.searchhorses then 
            if not Config.policeonly or conx(Config.searchjobs,playerjob) then 
                if newmount ~= nil and not IsPedOnMount(player) then  
                    if entity ~= newmount and not ininventory2 then 
                        sleep = false 
                        if IsDisabledControlJustReleased(0,1287709438)  and not Citizen.InvokeNative(0x3AA24CCC0D451379, PlayerPedId()) and not Citizen.InvokeNative(0x74E559B3BC910685, PlayerPedId()) then 
                            if not IsPedOnMount(PlayerPedId()) then 
                                local network = NetworkGetNetworkIdFromEntity(newmount)
                                local model = GetEntityModel(newmount)
                                if network ~= nil then 
                                    TriggerServerEvent("syn_stable:searchhorse",network,model)
                                    Wait(1000)
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
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
        local newmount = GetClosestPed(coords, 1.5)
        local ped,dist =   GetClosestPlayer2()
        if newmount ~= nil then 
            if whenKeyJustPressed(Config.keys.six) then 
                N_0xe6d4e435b56d5bd0(GetPlayerIndex(),newmount) 
                Wait(5000)
                N_0xe6d4e435b56d5bd0(GetPlayerIndex(),entity)
            end
        end
        if newmount ~= nil and not IsPedOnMount(PlayerPedId()) then 
            if whenKeyJustPressed(Config.keys.six) then 
                SetRelationshipBetweenGroups(1, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
                local mount = GetMount(ped)
                N_0xe6d4e435b56d5bd0(GetPlayerIndex(),mount) 
                Wait(5000)
                N_0xe6d4e435b56d5bd0(GetPlayerIndex(),SpawnplayerHorse)     
            end
        end
    end
end)

function WhistleHorse()
    if Config.callnearstable then
        flying = true
        if entity ~= nil then
            if GetScriptTaskStatus(entity, 0x4924437D, 0) ~= 0 then
                local pcoords = GetEntityCoords(PlayerPedId())
                local hcoords = GetEntityCoords(entity)
                local caldist = Vdist(pcoords.x, pcoords.y, pcoords.z, hcoords.x, hcoords.y, hcoords.z)
                TaskGoToEntity(entity, PlayerPedId(), -1, 7.2, 2.0, 0, 0)
            end   
        else
            if callstable() then 
                TriggerServerEvent('syn_stable:CheckSelectedHorse')
            else 
                if Config.Language.toofarfromstable ~= nil then 
                    if Config.vorp then
                        TriggerEvent("vorp:TipBottom", Config.Language.toofarfromstable, 2000)
                    elseif Config.redem then
                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.toofarfromstable, 2000)
                    end
                end
            end
        end
    else
 
        flying = true
        if entity ~= nil then
            if GetScriptTaskStatus(entity, 0x4924437D, 0) ~= 0 then
                local pcoords = GetEntityCoords(PlayerPedId())
                local hcoords = GetEntityCoords(entity)
                local caldist = Vdist(pcoords.x, pcoords.y, pcoords.z, hcoords.x, hcoords.y, hcoords.z)
                if caldist >= Config.horsedistancecall then
                    if not Config.dontallowhorseintown then 
                        if horseid ~= nil and not IsEntityDead(entity) then 
                            local stamina = Citizen.InvokeNative(0x775A1CA7893AA8B5,entity, Citizen.ResultAsFloat()) --ACTUAL STAMINA CORE GETTER
                            local health = GetEntityHealth(entity, Citizen.ResultAsInteger())
                            local stats = {stamina = stamina, health = health}
                            TriggerServerEvent("syn_stable:savehorsestats",horseid,stats)
                            TriggerServerEvent("syn_stable:removenetwork",horseid)
                        end
                        DeleteEntity(entity)
                        entity = nil 
                        TriggerServerEvent('syn_stable:CheckSelectedHorse')
                    else
                        local pedCoords = GetEntityCoords(PlayerPedId())
                        local town_hash = Citizen.InvokeNative(0x43AD8FC02B429D33, pedCoords, 1)
                        if IsTownBanned(town_hash) then
                            TriggerEvent("vorp:TipBottom", Config.Language.tooclosetown, 4000)
                        else
                            if horseid ~= nil and not IsEntityDead(entity) then 
                                local stamina = Citizen.InvokeNative(0x775A1CA7893AA8B5,entity, Citizen.ResultAsFloat()) --ACTUAL STAMINA CORE GETTER
                                local health = GetEntityHealth(entity, Citizen.ResultAsInteger())
                                local stats = {stamina = stamina, health = health}
                                TriggerServerEvent("syn_stable:savehorsestats",horseid,stats)
                                TriggerServerEvent("syn_stable:removenetwork",horseid)
                            end
                            DeleteEntity(entity)
                            entity = nil 
 
                            TriggerServerEvent('syn_stable:CheckSelectedHorse')
                        end
                    end
                else
                    TaskGoToEntity(entity, PlayerPedId(), -1, 7.2, 2.0, 0, 0)
                end
            end   
        else
            if not Config.dontallowhorseintown then 
                TriggerServerEvent('syn_stable:CheckSelectedHorse')
            else
                local pedCoords = GetEntityCoords(PlayerPedId())
                local town_hash = Citizen.InvokeNative(0x43AD8FC02B429D33, pedCoords, 1)
                if IsTownBanned(town_hash) then
                    TriggerEvent("vorp:TipBottom", Config.Language.tooclosetown, 4000)
                else
                    TriggerServerEvent('syn_stable:CheckSelectedHorse')
                end
            end
        end
    end
end

IsTownBanned = function (town)
	for k,v in pairs(Config.BannedTowns) do
		if town == GetHashKey(v) then
			return true
		end
	end
	return false
end

function Whistlewagon()
    if Spawnplayerwagon ~= nil then
        if GetScriptTaskStatus(Spawnplayerwagon, 0x4924437D, 0) ~= 0 then
            local pcoords = GetEntityCoords(PlayerPedId())
            local hcoords = GetEntityCoords(Spawnplayerwagon)
            local caldist = Vdist(pcoords.x, pcoords.y, pcoords.z, hcoords.x, hcoords.y, hcoords.z)
            if caldist >= 100 then
                DeleteEntity(Spawnplayerwagon)
                Wait(1000)
                Spawnplayerwagon = nil
            end
        end   
    else
        if not Config.dontallowwagonintown then 
            TriggerServerEvent('syn_stable:CheckSelectedwagon')
        else
            local pedCoords = GetEntityCoords(PlayerPedId())
            local town_hash = Citizen.InvokeNative(0x43AD8FC02B429D33, pedCoords, 1)
            if IsTownBanned(town_hash) then
                TriggerEvent("vorp:TipBottom", Config.Language.tooclosetown, 4000)
            else
                TriggerServerEvent('syn_stable:CheckSelectedwagon')
            end
        end
    
    end
end

function fleeHorse(playerHorse)
    if horseid ~= nil and not IsEntityDead(entity) then 
        local stamina = Citizen.InvokeNative(0x775A1CA7893AA8B5,entity, Citizen.ResultAsFloat()) --ACTUAL STAMINA CORE GETTER
        local health = GetEntityHealth(entity, Citizen.ResultAsInteger())
        local stats = {stamina = stamina, health = health}
        TriggerServerEvent("syn_stable:savehorsestats",horseid,stats)
    end
    TaskAnimalFlee(entity, PlayerPedId(), -1)
    Wait(5000)
    DeleteEntity(entity)  
    TriggerServerEvent("syn_stable:removenetwork",horseid) 
    if SpawnplayerHorse ~= nil then
        SpawnplayerHorse = nil
    end
    if entity ~= nil then
        entity = nil
    end
    if horseModel ~= nil then
        horseModel = nil
    end
    if horseName ~= nil then
        horseName = nil
    end
end
function fleewagon(Spawnplayerwagon)
    Wait(5000)
    DeleteEntity(Spawnplayerwagon)    
    Wait(1000)
    if Mywagon_entity ~= nil then
        DeleteEntity(Mywagon_entity)
        Mywagon_entity = nil
    end

    if entity2 ~= nil then
        DeleteEntity(entity2)
        entity2 = nil
    end

    if Spawnplayerwagon ~= nil then
        DeleteEntity(Spawnplayerwagon)
        Spawnplayerwagon = nil
    end

    if showroomwagon_entity ~= nil then
        DeleteEntity(showroomwagon_entity)
        showroomwagon_entity = nil
    end
    if wagonModel ~= nil then
        wagonModel = nil
    end
    if wagonName ~= nil then
        wagonName = nil
    end
end

Citizen.CreateThread(function() -- check death
    while true do
        Citizen.Wait(1)
        local sleep = true
        if entity ~= nil and DoesEntityExist(entity) then
            if IsEntityDead(entity) and dead == false then 
                sleep = false
                if SpawnplayerHorse ~= nil then
                    SpawnplayerHorse = nil
                end
                if entity ~= nil then
                    entity = nil
                end
                if horseModel ~= nil then
                    horseModel = nil
                end
                if horseName ~= nil then
                    horseName = nil
                end
                dead = true
            end
        end
        if dead then 
            sleep = false
            Citizen.Wait(Config.deadtimer)
            if Config.vorp then
                TriggerEvent("vorp:TipBottom", Config.Language.payfordead..Config.horsehealcost, 2000)
            elseif Config.redem then
                TriggerEvent("redem_roleplay:ShowObjectives", Config.Language.payfordead..Config.horsehealcost, 2000)
            end
            TriggerServerEvent("syn_stable:pay")
            dead = false
        end
        if sleep then 
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true
        if flying then 
            sleep = false
            Citizen.Wait(2000)
            if entity ~= nil then
                local falling = IsPedFalling(entity)
                local spawnPosition = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 2.0, 5.0, 0)
                if falling then 
                    SetEntityCoords(entity, spawnPosition.x, spawnPosition.y, spawnPosition.z, true, true, true, false)
                end
            end
            flying = false
        end
        if sleep then 
            Citizen.Wait(500)
        end 
    end
end)

function callstable()
    local coords = GetEntityCoords(PlayerPedId())
    for k,v in pairs(Config.Stables) do 
        if GetDistanceBetweenCoords(coords,v.Pos.x,v.Pos.y,v.Pos.z , true) < Config.calldistance then
            return true 
            
        end
    end
    return false 
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if not disablehorse then 
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, Config.keys.three) and dead == false then -- Control =  H
                WhistleHorse()
                Citizen.Wait(6000) 
            elseif Citizen.InvokeNative(0x91AEF906BCA88877, 0, Config.keys.three) and dead then
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.deadhorse, 2000)
                elseif Config.redem then
                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.deadhorse, 2000)
                end
                Citizen.Wait(6000) 
            end

            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, Config.keys.two) then -- Control =  J
                Citizen.InvokeNative(0xB31A277C1AC7B7FF,PlayerPedId(),1,2,GetHashKey("KIT_EMOTE_ACTION_FOLLOW_ME_1"),0,0,0,0,0)  -- FULL BODY EMOTE
                Whistlewagon()
		    	Citizen.Wait(6000) 
            end
        end
        
        if Citizen.InvokeNative(0xF3A21BCD95725A4A, 0, Config.keys.four) and IsPedOnMount(PlayerPedId()) then -- alt to rear up on horse 
            if Citizen.InvokeNative(0x580417101DDB492F, 0, Config.keys.five) then
                if entity ~= nil then
                    if GetMount(PlayerPedId()) == entity then 
                        levels()
                        if level >= 2 then 
                            TaskHorseAction(GetMount(PlayerPedId()), 1,0,0)
                        else
                            TaskHorseAction(GetMount(PlayerPedId()), 2,0,0)
                        end
                    else
                        TaskHorseAction(GetMount(PlayerPedId()), 2,0,0)
                    end
                else
                    TaskHorseAction(GetMount(PlayerPedId()), 2,0,0) 
                end
                Citizen.Wait(6000)  
            end
        end 
		
        if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x4216AF06) then -- Control = Horse Flee            
			if SpawnplayerHorse ~= nil then
				fleeHorse(SpawnplayerHorse)
			end
        end			
    end    
end)

function interpCamera(cameraName, entity)
    for k, v in pairs(cameraUsing) do
        if cameraUsing[k].name == cameraName then
            tempCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
            AttachCamToEntity(tempCam, entity, cameraUsing[k].x + CamPos[1], cameraUsing[k].y + CamPos[2], cameraUsing[k].z)
            SetCamActive(tempCam, true)
            SetCamRot(tempCam, -30.0, 0, HeadingPoint + 50.0)
            if InterP then
                SetCamActiveWithInterp(tempCam, fixedCam, 1200, true, true)
                InterP = false
            end
        end
    end
end
function interpCamera2(cameraName, entity)
    for k, v in pairs(cameraUsing) do
        if cameraUsing[k].name == cameraName then
            tempCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
            AttachCamToEntity(tempCam, entity, cameraUsing[k].x + CamPos2[1], cameraUsing[k].y + CamPos2[2], cameraUsing[k].z)
            SetCamActive(tempCam, true)
            SetCamRot(tempCam, -30.0, 0, HeadingPoint + 50.0)
            if InterP then
                SetCamActiveWithInterp(tempCam, fixedCam, 1200, true, true)
                InterP = false
            end
        end
    end
end

function createCamera(entity)
    groundCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
    SetCamCoord(groundCam, StablePoint[1] + 0.5, StablePoint[2] - 3.6, StablePoint[3] )
    SetCamRot(groundCam, -20.0, 0.0, HeadingPoint + 20)
    SetCamActive(groundCam, true)
    RenderScriptCams(true, false, 1, true, true)
    fixedCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
    SetCamCoord(fixedCam, StablePoint[1] + 0.5, StablePoint[2] - 3.6, StablePoint[3] +1.8)
    SetCamRot(fixedCam, -20.0, 0, HeadingPoint + 50.0)
    SetCamActive(fixedCam, true)
    SetCamActiveWithInterp(fixedCam, groundCam, 3900, true, true)
    Wait(3900)
    DestroyCam(groundCam)
end



RegisterNetEvent('syn:exp')
AddEventHandler('syn:exp', function(v,x)
    if v == entity then
        local maxp = GetMaxAttributePoints(entity,7)
        local xp = x
        TriggerServerEvent("syn_stable:addexpbonding",maxp,horseid,xp)
    end
end)
RegisterNetEvent('syn_stable:updatehorse')
AddEventHandler('syn_stable:updatehorse', function(exp)
    horsebonding = exp
    SetAttributePoints(entity, 7, horsebonding)
end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end
local keyopen = false --addprop

Citizen.CreateThread(function() -- horse menu
    while true do
        Citizen.Wait(1)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local horseCoords = GetEntityCoords(entity)
        local wagonCoords = GetEntityCoords(entity2)
        local sleep = true
        if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, horseCoords.x, horseCoords.y, horseCoords.z, false) < 2  then
         sleep = false
            if IsDisabledControlJustReleased(0,1287709438) and not Citizen.InvokeNative(0x3AA24CCC0D451379, PlayerPedId()) and not Citizen.InvokeNative(0x74E559B3BC910685, PlayerPedId()) then -- findme
                if not IsPedOnMount(PlayerPedId()) then 
                    Citizen.InvokeNative(0xCD181A959CFDD7F4, PlayerPedId(), entity, GetHashKey("Interaction_LootSaddleBags"), 0, 1)
                    local network = NetworkGetNetworkIdFromEntity(entity)
                    local model = GetEntityModel(entity)
                    TriggerServerEvent("syn_stable:searchhorse",network,model)
                    Wait(500)
                end
            end
            if whenKeyJustPressed(Config.keys.one)  and not Citizen.InvokeNative(0x3AA24CCC0D451379, PlayerPedId()) and not Citizen.InvokeNative(0x74E559B3BC910685, PlayerPedId()) then           
                if entity ~= nil then
                    horsemax = GetMaxAttributePoints(entity,7)
                    horsecurrent = GetAttributePoints(entity,7)
                    levels()
                    if keyopen == false then
                        WarMenu.OpenMenu('horse')
                    else end
                end
            end	
        end
        if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, wagonCoords.x, wagonCoords.y, wagonCoords.z, false) < 2  then
         sleep = false
            if whenKeyJustPressed(Config.keys.one) then           
                if entity2 ~= nil then
                    if keyopen == false then
                        WarMenu.OpenMenu('wagon')
                    else end
                end
            end	
        end
       
        if sleep then 
            Citizen.Wait(1000)
        end	
    end    
end)

function levels()
    local max = GetMaxAttributePoints(entity,7)
    local current = GetAttributePoints(entity,7)
    local third = max / 3
    if current >= max then 
        level = 4
    elseif current >= third and third * 2 > current then
        level = 2
    elseif current >= third * 2 and max > current  then 
        level = 3
    elseif third > current then 
        level = 1
    end
end

Citizen.CreateThread( function()
    WarMenu.CreateMenu('horse', Config.Language.horseinfo)
    WarMenu.CreateMenu('wagon', Config.Language.wagoninfo)
    WarMenu.CreateSubMenu('transferhorse', 'horse', Config.Language.sure)
    WarMenu.CreateSubMenu('transferwagon', 'wagon', Config.Language.sure)
    while true do
        if WarMenu.IsMenuOpened('horse') then
            if WarMenu.Button(Config.Language.horsename..horseName) then 
            end
            if WarMenu.Button(Config.Language.horsetrainlevel..level) then 
               
            end 
            if WarMenu.Button(Config.Language.horsetrainexp..horsecurrent.." / "..horsemax) then 
            end
            if WarMenu.MenuButton(Config.Language.givehorseowner, 'transferhorse') then end
            if WarMenu.Button(Config.Language.saddlebags) then
                if not IsPedOnMount(PlayerPedId()) then 
                    Citizen.InvokeNative(0xCD181A959CFDD7F4, PlayerPedId(), entity, GetHashKey("Interaction_LootSaddleBags"), 0, 1)
                end
                WarMenu.CloseMenu()
                local network = NetworkGetNetworkIdFromEntity(entity)
                local model = GetEntityModel(entity)
                TriggerServerEvent("syn_stable:searchhorse",network,model)
            end
        elseif WarMenu.IsMenuOpened('wagon') then
            if WarMenu.Button(Config.Language.wagonname..wagonName) then 
            end
            if Config.syn_outfitter then 
                if WarMenu.Button(Config.Language.equipment) then 
                    WarMenu.CloseMenu()
                    TriggerEvent("syn_outfitter:open")
                end
            end
            if WarMenu.Button(Config.Language.dismiss) then 
                fleewagon(Spawnplayerwagon)
                WarMenu.CloseMenu()
            end
            if WarMenu.MenuButton(Config.Language.givewagonowner, 'transferwagon') then end
            if WarMenu.Button(Config.Language.wagoninv) then
                WarMenu.CloseMenu()
                local network = NetworkGetNetworkIdFromEntity(entity2)
                local model = GetEntityModel(entity2)
                TriggerServerEvent("syn_stable:searchwagon",network,model)
            end
        elseif WarMenu.IsMenuOpened('transferhorse') then
            if WarMenu.Button(Config.Language.yes) then
                WarMenu.CloseMenu()
                closeplayermenu(getcloseplayers(),"horse")
                --[[ if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", "Confirm", "Player ID", function(cb)
                        local playerid =     tonumber(cb)
                       
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", "Confirm", "Player ID", function(cb)
                        local playerid =     tonumber(cb)
                        TriggerServerEvent("syn_stable:transferownership", playerid, horseid)
                    end)
                end
                 ]]
                
            end
            if WarMenu.Button(Config.Language.no) then
                WarMenu.CloseMenu()
            end
         elseif WarMenu.IsMenuOpened('transferwagon') then
            closeplayermenu(getcloseplayers(),"wagon")
            WarMenu.CloseMenu()
            --[[ if WarMenu.Button(Config.Language.yes) then
                if Config.vorp then
                    TriggerEvent("vorpinputs:getInput", "Confirm", "Player ID", function(cb)
                        local playerid =     tonumber(cb)
                        TriggerServerEvent("syn_stable:transferownership2", playerid, wagonid)
                    end)
                elseif Config.redem then
                    TriggerEvent("syn_inputs:sendinputs", "Confirm", "Player ID", function(cb)
                        local playerid =     tonumber(cb)
                        TriggerServerEvent("syn_stable:transferownership2", playerid, wagonid)
                    end)
                end
                fleewagon(Spawnplayerwagon)
                WarMenu.CloseMenu()
            end ]]
            if WarMenu.Button(Config.Language.no) then
                WarMenu.CloseMenu()
            end 
        end
        WarMenu.Display()
		Citizen.Wait(0)
	end
end)

function closeplayermenu(closeplayers,typex)
	MenuData.CloseAll()
    local titlex = ""
    if typex == "horse" then 
        titlex = Config.Language.givehorseowner
    else
        titlex = Config.Language.givewagonowner
    end
	local elements = {
    }

    for k,v in pairs(closeplayers) do
        table.insert(elements, {label = v, value = v,desc =""})
    end
   
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = titlex,
		subtext    = "",
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
        if data.current.value then
            MenuData.CloseAll()
            if typex == "horse" then 
                fleeHorse(SpawnplayerHorse)
                TriggerServerEvent("syn_stable:transferownership", data.current.value, horseid)
            else
                fleewagon(Spawnplayerwagon)
                TriggerServerEvent("syn_stable:transferownership2", data.current.value, wagonid)
            end
        end
	end,
	function(data, menu)
		menu.close()
	end)
end


local lead
local counter = 0
local rest = false
local riding
local stopriding
local counter2 = 0
local stopincrease = false
Citizen.CreateThread(function() -- horse leading
    while true do
        Citizen.Wait(1)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local horseCoords = GetEntityCoords(entity)
        local sleep = true
        if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, horseCoords.x, horseCoords.y, horseCoords.z, false) < 2  then
         sleep = false
         local x = GetMaxAttributePoints(entity,7)
         local y = GetAttributePoints(entity,7)
            if x == y then
                stopincrease = true
            else
                stopincrease = false
            end
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x17D3BFF5) then -- Control = InteractLeadAnimal           
                if entity ~= nil and rest == false and stopincrease == false then
                    lead = 1
                end
                if rest then
                    if Config.vorp then
                        TriggerEvent("vorp:TipBottom", Config.Language.tired, 2000)
                    elseif Config.redem then
                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.tired, 2000)
                    end
                end
            end
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0x7914A3DD) then -- Control = StopLeadingAnimal           
                if entity ~= nil then
                    if lead == 1 then 
                        lead = 0
                        TriggerEvent('syn:exp', entity, counter)
                        Citizen.Wait(500)
                        counter = 0
                    end
                end
            end	
        end
        if sleep then 
            Citizen.Wait(1000)
        end	
    end    
end)


Citizen.CreateThread(function() -- disable instancing errors
    while true do
        Citizen.Wait(1)
        local sleep = true
        local visable = IsEntityVisible(PlayerPedId())
        
        if not visable then 
            sleep = false
            TriggerEvent('syn_stable:deleteinfo')
        end
        if sleep then 
            Citizen.Wait(1000)
        end	
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true 
        if lead == 1 then
            sleep = false 
            if IsPedWalking(PlayerPedId()) then
                Citizen.Wait(Config.horselead) -- 6 seconds
                counter = counter + 1 -- amount to increase 
            end
            if counter >= 100 then -- limit increase till rest 
                TriggerEvent('syn:exp', entity, counter)
                Citizen.Wait(500)
                counter = 0
                lead = 0
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.tired2 , 2000)
                elseif Config.redem then
                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.tired2 , 2000)
                end
                rest = true
            end
            if  IsPedSprinting(PlayerPedId()) then 
                TriggerEvent('syn:exp', entity, counter)
                Citizen.Wait(500)
                counter = 0
                lead = 0
            end
            if  IsPedRunning(PlayerPedId()) then 
                TriggerEvent('syn:exp', entity, counter)
                Citizen.Wait(500)
                counter = 0
                lead = 0
            end
            if  IsPedRagdoll(PlayerPedId()) then 
                TriggerEvent('syn:exp', entity, counter)
                Citizen.Wait(500)
                counter = 0
                lead = 0
            end
            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, 0xB238FE0B) then
                TriggerEvent('syn:exp', entity, counter)
                Citizen.Wait(500)
                counter = 0
                lead = 0
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
        if rest then  
            sleep = false 
            Citizen.Wait(300000) -- wait for 5 minutes for rest to reset 
            if Config.vorp then
                TriggerEvent("vorp:TipBottom", Config.Language.better, 2000)
            elseif Config.redem then
                TriggerEvent("redem_roleplay:ShowObjective", Config.Language.better, 2000)
            end
            rest = false
        end
        if sleep then 
            Wait(500)
        end
    end    
end)

Citizen.CreateThread(function() -- horse riding
    while true do
        Citizen.Wait(1)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local horseCoords = GetEntityCoords(entity)
        local sleep = true
        if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, horseCoords.x, horseCoords.y, horseCoords.z, false) < 2  then
         sleep = false
         local x = GetMaxAttributePoints(entity,7)
         local y = GetAttributePoints(entity,7)
            if x == y then
                stopincrease = true
            else
                stopincrease = false
            end
            if IsPedOnMount(player) and GetMount(player) == entity and stopincrease == false then -- Control = InteractLeadAnimal           
                riding = 1
            else 
                if riding == 1 then
                    TriggerEvent('syn:exp', entity, counter2)
                    Citizen.Wait(500)
                    counter2 = 0
                    riding = 0
                end
            end
        end
        if sleep then 
            Citizen.Wait(1000)
        end	
    end    
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true
        if riding == 1 then -- 
            sleep = false 
            local walk = IsPedWalking(entity)
            local run = IsPedRunning(entity)
            local sprint = IsPedSprinting(entity)
             if walk or sprint or run then
                Citizen.Wait(Config.horseride) -- 12 seconds
                counter2 = counter2 + 1 -- amount to increase 
            end 
        end
        if sleep then 
            Citizen.Wait(1000)
        end	
    end    
end)


RegisterCommand(Config.commands.horserest, function(source, args, rawCommand)
    if entity ~= nil then 
        if not IsPedOnMount(PlayerPedId()) then
            levels()
            if level >= 2 then 
                Citizen.Wait(1)
                TaskStartScenarioInPlace(entity, GetHashKey('WORLD_ANIMAL_HORSE_RESTING_DOMESTIC'), 300000, true, true, 100, false)
            else
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.level2, 2000)
                elseif Config.redem then
                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.level2, 2000)
                end
            end
        end
    end
end, false)

RegisterCommand(Config.commands.horsewallow, function(source, args, rawCommand)
    if entity ~= nil then 
        if not IsPedOnMount(PlayerPedId()) then
            levels()
            if level >= 4 then 
                Citizen.Wait(1)
                TaskStartScenarioInPlace(entity, GetHashKey('WORLD_ANIMAL_HORSE_WALLOW'), 300000, true, true, 100, false)
            else
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.level4, 2000)
                elseif Config.redem then
                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.level4, 2000)
                end
            end
        end
    end
end, false)

RegisterCommand(Config.commands.horsesleep, function(source, args, rawCommand)
    if entity ~= nil then 
        if not IsPedOnMount(PlayerPedId()) then

            levels()
            if level >= 2 then 
                Citizen.Wait(1)
                TaskStartScenarioInPlace(entity, GetHashKey('WORLD_ANIMAL_HORSE_SLEEPING_DOMESTIC'), 300000, true, true, 100, false)
            else
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.level2, 2000)
                elseif Config.redem then
                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.level2, 2000)
                end
            end
        end
    end
end, false)

RegisterCommand(Config.commands.horsedrink, function(source, args, rawCommand)
    if entity ~= nil then 
        if not IsPedOnMount(PlayerPedId()) then
            levels()
            if level >= 3 then 
                if IsEntityInWater(entity) then
                    Citizen.Wait(1)
                    TaskStartScenarioInPlace(entity, GetHashKey('WORLD_ANIMAL_HORSE_DRINK_GROUND_DOMESTIC'), 300000, true, true, 100, false)
                    local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, entity, 1, Citizen.ResultAsInteger())
                    if not tonumber(valueStamina) then valueStamina = 0 end
                    Citizen.Wait(3500)
                    Citizen.InvokeNative(0xC6258F41D86676E0, entity, 1, valueStamina + 30)
                else
                    if Config.vorp then
                        TriggerEvent("vorp:TipBottom", Config.Language.water, 2000)
                    elseif Config.redem then
                        TriggerEvent("redem_roleplay:ShowObjective", Config.Language.water, 2000)
                    end
                end
            else
                if Config.vorp then
                    TriggerEvent("vorp:TipBottom", Config.Language.level3, 2000)
                elseif Config.redem then
                    TriggerEvent("redem_roleplay:ShowObjective", Config.Language.level3, 2000)
                end
            end
        end
    end
end, false)



RegisterNetEvent("syn_stable:deleteinfo")
AddEventHandler("syn_stable:deleteinfo",function()
    if Mywagon_entity ~= nil then
        DeleteEntity(Mywagon_entity)
        Mywagon_entity = nil
    end

    if entity2 ~= nil then
        DeleteEntity(entity2)
        entity2 = nil
    end

    if Spawnplayerwagon ~= nil then
        DeleteEntity(Spawnplayerwagon)
        Spawnplayerwagon = nil
    end

    if showroomwagon_entity ~= nil then
        DeleteEntity(showroomwagon_entity)
        showroomwagon_entity = nil
    end

    if SpawnplayerHorse ~= nil then
        DeleteEntity(SpawnplayerHorse)    
        SpawnplayerHorse = nil
    end
    if entity ~= nil then
        DeleteEntity(entity)    
        entity = nil
    end
    if wagonModel ~= nil then
        wagonModel = nil
    end
    if wagonName ~= nil then
        wagonName = nil
    end
end)



local lastSoundSetName = "";
local lastSoundSetRef = "";

function PlayFrontendSound(frontend_soundset_ref, frontend_soundset_name, forcePlay)
    if forcePlay and lastSoundSetName ~= 0 then
        Citizen.InvokeNative(0x9D746964E0CF2C5F, lastSoundSetName, lastSoundSetRef)  -- stop audio
    end

    if frontend_soundset_ref ~= 0 then
        Citizen.InvokeNative(0x0F2A2175734926D8, frontend_soundset_name, frontend_soundset_ref);   -- load sound frontend
    end
    Citizen.InvokeNative(0x67C540AA08E4A6F5, frontend_soundset_name, frontend_soundset_ref, true, 0);  -- play sound frontend

    lastSoundSetName = frontend_soundset_name;
    lastSoundSetRef = frontend_soundset_ref;
end

function PlayCloseSound()
    PlayFrontendSound("Ledger_Sounds", "INFO_HIDE");

    DisplayHud(true);
    DisplayRadar(true);

    if lastActivatedPrompt ~= 0 then
        PromptSetVisible(lastActivatedPrompt, 1)
    end

    if inCustomization then
        inCustomization = false
    end
end

function PlayOpenSound()
    PlayFrontendSound("Ledger_Sounds", "INFO_SHOW");
end


local waypointformer
local activewaypoint = false
local newwaypoint
local redblip 
function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
    
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end
    
    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])
        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
                playerid = GetPlayerServerId(players[i])
                tgt1 = GetPlayerPed(players[i])
            end
        end
    end
    return closestPlayer, closestDistance,  playerid, tgt1
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local onmount = IsPedOnMount(PlayerPedId())
        local waypoint = GetWaypointCoords()
        local sleep = true 
        if onmount then 
            local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
            if closestDistance == 0.0 then 
                local passangeronmount = IsPedOnMount(tgt1)
                if waypoint ~= vector3(0,0,0) then 
                    if waypoint ~= waypointformer then 
                        waypointformer = waypoint
                        ClearGpsMultiRoute()
                        RemoveBlip(redblip)
                        TriggerServerEvent("syn_stable:sendwaypoint",waypoint,playerid)
                    end
                end
            end
        end
        if activewaypoint then 
            sleep = false 
            local playercoords = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(playercoords,newwaypoint, false)
            if 10 > dist then 
                activewaypoint = false 
                ClearGpsMultiRoute()
                RemoveBlip(redblip)
            end
            if waypoint ~= vector3(0,0,0) then 
                activewaypoint = false 
                ClearGpsMultiRoute()
                RemoveBlip(redblip)
            end
        end
        if sleep then 
            Wait(500)
        end
    end 
end)

RegisterNetEvent("syn_stable:recwaypoint")
AddEventHandler("syn_stable:recwaypoint", function(waypoint)
    ClearGpsPlayerWaypoint()
    RemoveBlip(redblip)
    StartGpsMultiRoute(0xB2468351, true, true)
    AddPointToGpsMultiRoute(waypoint)
    SetGpsMultiRouteRender(true, 8, 8)
    redblip = N_0x554d9d53f696d002(1664425300, waypoint)
    SetBlipSprite(redblip, 960467426, 1)
    SetBlipScale(redblip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, redblip, Config.Language.waypoint)
    Citizen.InvokeNative(0x662D364ABF16DE2F,redblip,0x801DD820)
    newwaypoint = waypoint
    activewaypoint = true 
end)