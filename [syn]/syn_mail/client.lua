local inshop = false
local inmail = false 
local playanim = false 
keys = {
    ["B"] = 0x4CC0E2FE,
    ["X"] = 0x8CC9CD42,
}

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

AddEventHandler(
    "onResourceStart",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
            if Config.devmode then 
                TriggerServerEvent("syn_mail:signcharacter")
            end
        end
    end
)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    TriggerServerEvent("syn_mail:signcharacter")
end)
local address, mails, contacts, editableFolders = nil, {}, {}, {}
RegisterNetEvent("syn_mail:rec_initdata")
AddEventHandler("syn_mail:rec_initdata", function(address_, mails_, contacts_, editableFolders_)
    address, mails, contacts, editableFolders = address_, mails_, contacts_, editableFolders_
    SendNUIMessage({
        action = "loaddata",
        address = address,
        mails = mails,
        contacts = contacts, 
        editableFolders = editableFolders
    })
end)


RegisterCommand(Config.command, function(source, args, rawCommand)
    if not address then 
        TriggerServerEvent("syn_mail:signcharacter")
        Wait(2000)
        if not address then 
            TriggerEvent("vorp:TipBottom", Config.Language.registerplease, 4000)
            return 
        else
            ExecuteCommand(Config.command)
        end
    end
    if not Config.locationonly then
        local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, PlayerPedId())
        local handcuffed = Citizen.InvokeNative(0x74E559B3BC910685, PlayerPedId())
        local isDead = IsEntityDead(PlayerPedId())
        if not hogtied and not isDead and not handcuffed then 
            if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), true) then 
                TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_WRITE_NOTEBOOK"), 100000, true, false, false, false)
            end
            SetNuiFocus(true,true)
            inmail = true
            SendNUIMessage({
                action = "show",
                address = address,
                mails = mails,
                contacts = contacts, 
                editableFolders = editableFolders
            })
        end
    end
end, false)


RegisterNUICallback('closeui', function(data)
    SetNuiFocus(false,false)
    inmail = false 
    if not playanim then 
        ClearPedTasksImmediately(PlayerPedId())
    end
end)
RegisterNUICallback('updateMail', function(data, cb)
    local newmaillist = data.updatedMail
    local updatedMailfolders = {}
    local deletedMail = {}
    local readmail = {}
    local hideMail = {}

    for k, v in pairs(newmaillist) do
        if v.action == "read" then
            table.insert(readmail, v.id)
            for x, y in pairs(mails) do
                if v.id == y.id then
                    mails[x].read = true
                    break
                end
            end
        elseif v.action == "delete" then
            table.insert(deletedMail, v.id)
            for x, y in pairs(mails) do
                if v.id == y.id then
                    table.remove(mails, x)
                    break
                end
            end
        elseif v.action == "update" then
            table.insert(updatedMailfolders, {id = v.id, name = v.folder})
            for x, y in pairs(mails) do
                if v.id == y.id then
                    mails[x].folder = v.folder
                    break
                end
            end
        elseif v.action == "hide" then
            table.insert(hideMail, v.id)
            for x, y in pairs(mails) do
                if v.id == y.id then
                    table.remove(mails, x)
                    break
                end
            end
        end
    end

    TriggerServerEvent('syn_mail:updateMail', {
        updatedMailfolders = updatedMailfolders,
        deletedMail = deletedMail,
        readmail = readmail,
        hideMail = hideMail
    })

    cb('ok')  -- Assuming you need to send a response back to NUI
end)

RegisterNUICallback('updateContacts', function(data)
    local newcontactslist = data.updatedContacts
    local addedContacts = {}
    local updatedContacts = {}
    local deletedContacts = {}

    for _, newContact in ipairs(newcontactslist) do
        if newContact.action == "added" then
            table.insert(contacts, newContact)  -- Add new contact to the contacts list
            table.insert(addedContacts, newContact)  -- Keep track for the server event
        elseif newContact.action == "edited" then
            for i, oldContact in ipairs(contacts) do
                if oldContact.id == newContact.id then
                    contacts[i] = newContact  -- Update existing contact in the contacts list
                    break
                end
            end
            table.insert(updatedContacts, newContact)  -- Keep track for the server event
        elseif newContact.action == "deleted" then
            for i, oldContact in ipairs(contacts) do
                if oldContact.id == newContact.id then
                    table.remove(contacts, i)  -- Remove contact from the contacts list
                    break
                end
            end
            table.insert(deletedContacts, newContact.id)  -- Keep track for the server event
        end
    end

    TriggerServerEvent('syn_mail:updateContacts', address, {addedContacts = addedContacts, updatedContacts = updatedContacts, deletedContacts = deletedContacts})
end)
RegisterNUICallback('updateFolders', function(data)
    local newfolderslist = data.updatedFolders
    local addedFolders = {}
    local updatedFolders = {}
    local deletedFolders = {}
    for _, newFolder in ipairs(newfolderslist) do
        if newFolder.action == "added" then
            table.insert(editableFolders, newFolder)  -- Add new contact to the contacts list
            table.insert(addedFolders, newFolder)  -- Keep track for the server event
        elseif newFolder.action == "edited" then
            for i, oldFolders in ipairs(editableFolders) do
                if oldFolders.id == newFolder.id then
                    editableFolders[i] = newFolder  -- Update existing contact in the contacts list
                    break
                end
            end
            table.insert(updatedFolders, newFolder)  -- Keep track for the server event
        elseif newFolder.action == "deleted" then
            for i, oldFolders in ipairs(contacts) do
                if oldFolders.id == newFolder.id then
                    table.remove(editableFolders, i)  -- Remove contact from the contacts list
                    break
                end
            end
            table.insert(deletedFolders, newFolder.id)  -- Keep track for the server event
        end
    end

    TriggerServerEvent('syn_mail:updateFolders', address, {addedFolders = addedFolders, updatedFolders = updatedFolders, deletedFolders = deletedFolders})
end)
RegisterNUICallback('send', function(data)
    local newmail = data.newmail
    TriggerServerEvent("syn_mail:send", address, newmail)
    playanimation()
end)

RegisterNetEvent("syn_mail:rec_addedMailid")
AddEventHandler("syn_mail:rec_addedMailid", function(newmail,sstate) -- sstate if state then it means someone sent you mail
    table.insert(mails, newmail)
    
    SendNUIMessage({
        action = "addIdtoMail",
        newMail = newmail,
        inmail = inmail,
    })
end)


RegisterNetEvent("syn_mail:rec_addedid")
AddEventHandler("syn_mail:rec_addedid", function(addedId)
    for k,v in pairs(contacts) do 
        if v.id == nil then 
            contacts[k].id = addedId
            SendNUIMessage({
                action = "addIdtoContact",
                addedId = addedId,
            })
            break
        end
    end
end)
RegisterNetEvent("syn_mail:rec_addedFolderId")
AddEventHandler("syn_mail:rec_addedFolderId", function(addedId)
    for k, v in pairs(editableFolders) do
        if v.id == nil then
            editableFolders[k].id = addedId
            SendNUIMessage({
                action = "addIdtoFolder",
                addedId = addedId,
            })
            break
        end
    end
end)
RegisterNetEvent("syn_mail:getsaddress")
AddEventHandler("syn_mail:getsaddress", function(new_address)
    address = new_address
end)


Citizen.CreateThread(function()
    Citizen.Wait(1000)
	for k,v in pairs(Config.mailregistery) do 
		if v.showblip then
			blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
    		SetBlipSprite(blip, v.blipsprite, 1)
    		SetBlipScale(blip, 0.2)
    		Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.Name)
		end
	end
end)

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


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local letSleep = true
        if not address or Config.locationonly then 
            if not inshop then
                -- Check distance to Config.mailregistery points
                for k, v in pairs(Config.mailregistery) do
                    local dist = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.Pos.x, v.Pos.y, v.Pos.z, true)
                    if dist < 1.5 then
                        letSleep = false
                        DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, Config.Language.presstoshop)
                        if whenKeyJustPressed(Config.keys["G"]) then
                            inshop = true
                            mailmenu()
                        end
                    end
                end

                -- Check for prop if Config.proptied is true
                if Config.proptied then
                    local nearprop = DoesObjectOfTypeExistAtCoords(coords.x, coords.y, coords.z, 1.5, GetHashKey(Config.prop), 0)
                    if nearprop ~= false then
                        letSleep = false
                        DrawText3D(coords.x, coords.y, coords.z, Config.Language.presstoshop)
                        if whenKeyJustPressed(Config.keys["G"]) then
                            inshop = true
                            mailmenu()
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

TriggerEvent("menuapi:getData",function(call)
    MenuData = call
end)

AddEventHandler('menuapi:closemenu', function()
    
    closemenu()
end)
function closemenu()
    if inshop then 
        MenuData.CloseAll()
        inshop = false 
    end
end
function mailmenu()
	MenuData.CloseAll()
	local elements = {
    }
    if not address then 
        table.insert(elements, {label = Config.Language.rigster, value = "register" , desc =  Config.mailregisterprice..Config.Language.dollar})
    end
    if Config.locationonly then
        table.insert(elements, {label = Config.Language.openmail, value = "openmail" , desc =  ""})
    end
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = Config.Language.mailmenu,
		subtext    = "",
		align    = 'top-left',
		elements = elements,

	},
	function(data, menu)
        
        if (data.current.value == 'register') then
            TriggerServerEvent("syn_mail:registeraddress")
            closemenu()
        elseif (data.current.value == 'openmail') then
            if not address then 
                TriggerEvent("vorp:TipBottom", Config.Language.registerplease, 4000)
                return 
            end
            local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, PlayerPedId())
            local handcuffed = Citizen.InvokeNative(0x74E559B3BC910685, PlayerPedId())
            local isDead = IsEntityDead(PlayerPedId())
            if not hogtied and not isDead and not handcuffed then 
                if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), true) then 
                    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey("WORLD_HUMAN_WRITE_NOTEBOOK"), 100000, true, false, false, false)
                end
                SetNuiFocus(true,true)
                inmail = true
                SendNUIMessage({
                    action = "show",
                    address, mails, contacts, editableFolders = address, mails, contacts, editableFolders
                })
            end
            closemenu()
        end
	end,
	function(data, menu)
		menu.close()
	end)
end

function playanimation()
    if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), true) then 
        playanim = true 
        ClearPedTasksImmediately(PlayerPedId())
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_PLAYER_DYNAMIC_KNEEL'), 0, true, false, false, false)
	    Wait(2500)
	    farm2 = GetHashKey("A_C_Pigeon")       
	    RequestModel(farm2)
	    while not HasModelLoaded(farm2) do
	    	Wait(10)
	    end
	    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.5, 0.5, -0.35))
	    farm2 = CreatePed("A_C_Pigeon", x, y, z, true, false, true)
	    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, farm2, 1, 0)
	    TaskFlyAway(farm2,true)
	    Wait(1000)
	    ClearPedTasks(PlayerPedId())
	    Wait(30000)
	    DeleteEntity(farm2)	
        playanim = false 
    end
end
