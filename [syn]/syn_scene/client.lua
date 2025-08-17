local time = 10000
local scene = false 
local findspot = false 
local textcoords = {}
local displaytext
local x,y,z
local scenes = {}
local players = {}
local isplay = false 
local allowscene = true 
local allowscene2 = true 

function GetPlayers()
	local players = {}
    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, GetPlayerServerId(i))
        end
    end
    return players
end

RegisterNetEvent('syn_scene:stopscene')
AddEventHandler('syn_scene:stopscene', function(x)
    allowscene2 = x
end)

RegisterCommand(Config.scenecommand, function(source, args)
    if allowscene and allowscene2 then 
        textcoords = GetEntityCoords(PlayerPedId())
        TriggerEvent("vorpinputs:getInput", Config.Language.confirm, Config.Language.displaytext, function(cb)
            local count = cb
            if count ~= nil and count ~= 'close' and count ~= '' then
                displaytext = count
                findspot = true 
                x = textcoords.x
                y = textcoords.y
                z = textcoords.z
            else
                TriggerEvent("vorp:TipBottom", Config.Language.invalid, 4000)
            end
        end)
    else
        TriggerEvent("vorp:TipBottom", Config.Language.notinhideout, 4000)
    end
end)

RegisterNetEvent('syn_scene:getscenes')
AddEventHandler('syn_scene:getscenes', function(scene)
    scenes = scene
end)

RegisterNetEvent('syn_scene:getscenes2')
AddEventHandler('syn_scene:getscenes2', function()
    local state = 1
    TriggerServerEvent("syn_scene:pullscenes",state,0)
end)

RegisterNetEvent("vorp:SelectedCharacter") 
AddEventHandler("vorp:SelectedCharacter", function(charid)
    Wait(1000)
    local state = 1
    TriggerServerEvent("syn_scene:pullscenes",state,0)
    TriggerServerEvent("syn_scene:getstatus")
end)
AddEventHandler(
    "onResourceStart",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            Wait(1000)
            local state = 1
            TriggerServerEvent("syn_scene:pullscenes",state,0)
            TriggerServerEvent("syn_scene:getstatus")
        end
    end
)

Citizen.CreateThread(function()
    while true do
        Wait(1)
        sleep = true 
        if Config.denysceneinhideout then  
            local player = PlayerPedId()
            local coords = GetEntityCoords(player)    
            if GetDistanceBetweenCoords(coords,1785.01,-821.53,191.01 , true) < 100 then
                sleep = false 
                allowscene = false 
            else 
                allowscene = true 
            end
        end
        if sleep then 
            Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
        local playerCoords = GetEntityCoords(PlayerPedId())
        if allowscene and allowscene2 then
            for k,v in pairs(scenes) do 
                if GetDistanceBetweenCoords(playerCoords, v.coords.x, v.coords.y, v.coords.z, true) < Config.scenevisabilitydistance then
                    sleep = false 
                    DrawText3D(v.coords.x, v.coords.y,v.coords.z, v.text)
                    if GetDistanceBetweenCoords(playerCoords, v.coords.x, v.coords.y, v.coords.z, true) < 1.5 then
                        drawtext(Config.Language.pressg2, 0.15, 0.30, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
                        if whenKeyJustPressed(Config.keys["4"]) then
                            local id = v.id
                            local charid = v.charid
                            TriggerServerEvent("syn_scene:removescene",id,charid,GetPlayers())
                            Wait(2500)
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
        Wait(10)
        if findspot then 
            DrawText3D(x, y,z, displaytext)
            drawtext(Config.Language.pressup, 0.15, 0.30, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.pressleft, 0.15, 0.33, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.pressright, 0.15, 0.36, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.pressdown, 0.15, 0.39, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.press1, 0.15, 0.42, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.press2, 0.15, 0.45, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.pressg, 0.15, 0.48, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            drawtext(Config.Language.pressb, 0.15, 0.51, 0.1, 0.3, true, 255, 255, 255, 255, true, 10000)
            if whenKeyJustPressed(Config.keys["UP"]) then
                z = z + 0.3
                Wait(100)
            end
            if whenKeyJustPressed(Config.keys["DOWN"]) then
                z = z - 0.3
                Wait(100)
            end
            if whenKeyJustPressed(Config.keys["LEFT"]) then
                y = y - 0.3
                Wait(100)
            end
            if whenKeyJustPressed(Config.keys["RIGHT"]) then
                y = y + 0.3
                Wait(100)
            end
            if whenKeyJustPressed(Config.keys["1"]) then
                x = x + 0.3
                Wait(100)
            end
            if whenKeyJustPressed(Config.keys["2"]) then
                x = x - 0.3
                Wait(100)
            end
            if whenKeyJustPressed(Config.keys["G"]) then
                textcoords = {x=x,y=y,z=z} 
                findspot = false 
                TriggerServerEvent("syn_scene:savescene",textcoords,displaytext,GetPlayers())
                Wait(100)
            end
            if whenKeyJustPressed(Config.keys["B"]) then
                findspot = false 
                Wait(100)
            end
        end
    end 
end)

--------------------------------

RegisterCommand(Config.mecommand, function(source, args)
    local text = ''
    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end
    text = text .. ' '
    TriggerServerEvent('syn_scene:shareDisplay', text,GetPlayers())
end)

RegisterCommand(Config.ooccommand, function(source, args)
    local text = Config.Language.ooc
    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end
    text = text .. ' '
    TriggerServerEvent('syn_scene:shareDisplay', text,GetPlayers())
end)

RegisterCommand(Config.id, function(source, args)
    local text =Config.Language.id.. GetPlayerServerId(GetPlayerIndex())
    TriggerServerEvent('syn_scene:shareDisplay', text,GetPlayers())
end)

RegisterCommand(Config.cash, function(source, args)
    local text =Config.Language.cash
    TriggerServerEvent('syn_scene:shareDisplay3', text,GetPlayers())
end)

RegisterCommand(Config.statuscommand, function(source, args)
    if isplay then 
        TriggerServerEvent('syn_scene:stopdisplay',GetPlayers())
        Wait(1000)
    end
    isplay = true 
    local text = Config.Language.stat
    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end
    text = text .. ' '
    TriggerServerEvent('syn_scene:shareDisplay2', text,GetPlayers())
end)

RegisterNetEvent('syn_scene:triggerDisplay')
AddEventHandler('syn_scene:triggerDisplay', function(text, source)
    Display(GetPlayerFromServerId(source), text)
end)

RegisterNetEvent('syn_scene:triggerDisplay2')
AddEventHandler('syn_scene:triggerDisplay2', function(playersstatus)
    players = playersstatus
end)

Citizen.CreateThread(function()
    while true do
        Wait(10)
        local coords = GetEntityCoords(PlayerPedId(), false)
        for k,v in pairs(players) do 
            local coordsMe = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(v.id)), false)
            if GetDistanceBetweenCoords(coords, coordsMe, true) < Config.scenevisabilitydistance then
                DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z'], v.texts)
            end
        end
    end
end)

RegisterCommand(Config.stopdisplay, function(source, args)
    if isplay then 
        TriggerServerEvent('syn_scene:stopdisplay',GetPlayers())
        Wait(1000)
    end
end)


function Display(mePlayer, text)
    local displaying = true
    if chatMessage then
        local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
        local coords = GetEntityCoords(PlayerPedId(), false)
        local dist = Vdist2(coordsMe, coords)
        if dist < 10 then
            TriggerEvent('chat:addMessage', {
                color = { color.r, color.g, color.b },
                multiline = true,
                args = { text}
            })
        end
    end
    Citizen.CreateThread(function()
    	Wait(time)
        displaying = false
    end)
    Citizen.CreateThread(function()
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 20 then
                DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z'], text)
            end
        end
    end)
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
    	--DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
    end
end
function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

-------------------------------

