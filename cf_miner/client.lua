CF = nil
local mineActive = false
local impacts = 0
local timer = 0
local washingActive = false
local remeltingActive = false
local blips = true
local blipActive = false
local firstspawn = false
local times = 0

local locations = {
    { ['x'] = -591.47,  ['y'] = 2076.52,  ['z'] = 131.37},
    { ['x'] = -590.35,  ['y'] = 2071.76,  ['z'] = 131.29},
    { ['x'] = -589.61,  ['y'] = 2069.3,  ['z'] = 131.19},
    { ['x'] = -588.6,  ['y'] = 2064.03,  ['z'] = 130.96},
    { ['x'] = -588.02,  ['y'] = 2060.78,  ['z'] = 130.77},
    { ['x'] = -586.84,  ['y'] = 2052.45,  ['z'] = 130.15},
    { ['x'] = -587.34,  ['y'] = 2057.72,  ['z'] = 130.55},
    { ['x'] = -586.09,  ['y'] = 2049.66,  ['z'] = 129.88},
}

local locationsw = {
    { ['x'] = 1998.38,  ['y'] = 649.78,  ['z'] = 161.33},
    { ['x'] = 1997.27,  ['y'] = 646.43,  ['z'] = 161.36},
    { ['x'] = 1995.78,  ['y'] = 642.37,  ['z'] = 161.43},
    { ['x'] = 1994.56,  ['y'] = 638.01,  ['z'] = 161.58},
    { ['x'] = 1993.55,  ['y'] = 633.18,  ['z'] = 161.66},
    { ['x'] = 1997.07,  ['y'] = 632.84,  ['z'] = 161.43},
    { ['x'] = 1999.3,  ['y'] = 653.93,  ['z'] = 161.48},
    { ['x'] = 1998.85,  ['y'] = 657.93,  ['z'] = 161.33},
}

local locationsr = {
    { ['x'] = 1109.03,  ['y'] = -2007.61,  ['z'] = 30.94},
    { ['x'] = 1108.2,  ['y'] = -2009.72,  ['z'] = 30.89},
    { ['x'] = 1110.16,  ['y'] = -2005.9,  ['z'] = 30.92},
    { ['x'] = 1084.12,  ['y'] = -2002.21,  ['z'] = 31.39},
    { ['x'] = 1085.83,  ['y'] = -2000.57,  ['z'] = 31.4},
    { ['x'] = 1082.48,  ['y'] = -2004.48,  ['z'] = 30.89},
    { ['x'] = 1087.47,  ['y'] = -2006.55,  ['z'] = 31.35},
    { ['x'] = 1089.27,  ['y'] = -2003.99,  ['z'] = 31.35},
}



Citizen.CreateThread(function()
    TriggerEvent("esx_miner:createblips")
end)  


local function ShowHelpMessage(msg)
  AddTextEntry('cfHelpNotification', msg)
  BeginTextCommandDisplayHelp('cfHelpNotification')
  EndTextCommandDisplayHelp(0, false, true, -1)
end 


Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
            for i=1, #locations, 1 do
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locations[i].x, locations[i].y, locations[i].z, true) < 25 and mineActive == false then
                DrawMarker(20, locations[i].x, locations[i].y, locations[i].z, 0, 0, 0, 0, 0, 100.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
                    if GetDistanceBetweenCoords(GetEntityCoords(ped), locations[i].x, locations[i].y, locations[i].z, true) < 1 then
                        Draw3DText( locations[i].x, locations[i].y, locations[i].z -1.400, ('Press ~r~E ~w~to start mining'), 4, 0.1, 0.1)
                            if IsControlJustReleased(1, 51) then
                                 mineActive = true
                                
                                local item = CF.GetInventory()['stones']
                                if item.count <= 35 then
                                    Animation()
                                    
                                else
                                    TriggerServerEvent("esx_miner:TooMuchStone")
                                    mineActive = false
                                end
                            end
                        end
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
        for i=1, #locationsr, 1 do
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsr[i].x, locationsr[i].y, locationsr[i].z, true) < 25 and remeltingActive == false then
            DrawMarker(20, locationsr[i].x, locationsr[i].y, locationsr[i].z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsr[i].x, locationsr[i].y, locationsr[i].z, true) < 1 then
                    Draw3DText( locationsr[i].x, locationsr[i].y, locationsr[i].z -1.400, ('Press ~r~E ~w~to smelt your stones'), 4, 0.1, 0.1)
                        if IsControlJustReleased(1, 51) then
                            remeltingActive = true
                            TriggerEvent("esx_miner:chooseitem")
                            
                            
                end
            end
        end
    end
end 
end)

Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
        for i=1, #locationsw, 1 do
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsw[i].x, locationsw[i].y, locationsw[i].z, true) < 25 and washingActive == false then
            DrawMarker(20, locationsw[i].x, locationsw[i].y, locationsw[i].z, 0, 0, 0, 0, 0, 55.0, 1.0, 1.0, 1.0, 0, 155, 253, 155, 0, 0, 2, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsw[i].x, locationsw[i].y, locationsw[i].z, true) < 1 then
                    Draw3DText( locationsw[i].x, locationsw[i].y, locationsw[i].z -1.400, ('Press ~r~E ~w~to wash your stones'), 4, 0.1, 0.1)
                        if IsControlJustReleased(1, 51) then
                            local item = CF.GetInventory()['stones']
                            local item1 = CF.GetInventory()['washedstones']
                            
                                if item.count > 4 then
                                    if item1.count <= 35 then
                                    TriggerServerEvent("esx_miner:washing")
                                    washingActive = true
                                    else
                                    TriggerServerEvent("esx_miner:NEWS")
                                    end
                                else
                                    TriggerServerEvent("esx_miner:noStone")
                                end
                            
                    end
                end
            end
        end
    end
end)

function Animation()
    Citizen.CreateThread(function()
        local item = CF.GetInventory()['stones']
            if item.count < 36 then
                while impacts < 5 do
                    Citizen.Wait(1)
                local ped = PlayerPedId()	
                        RequestAnimDict("melee@large_wpn@streamed_core")
                        Citizen.Wait(100)
                        TaskPlayAnim((ped), 'melee@large_wpn@streamed_core', 'ground_attack_on_spot', 8.0, 8.0, -1, 80, 0, 0, 0, 0)
                        SetEntityHeading(ped, 270.0)
                        TriggerServerEvent('InteractSound_SV:PlayOnSource', 'pickaxe', 0.5)
                        
                        if impacts == 0 then
                            pickaxe = CreateObject(GetHashKey("prop_tool_pickaxe"), 0, 0, 0, true, true, true) 
                            AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.18, -0.02, -0.02, 350.0, 100.00, 140.0, true, true, false, true, 1, true)
                        end  
                        Citizen.Wait(2500)
                        ClearPedTasks(ped)
                        impacts = impacts+1
                        if impacts == 5 then
                            DetachEntity(pickaxe, 1, true)
                            DeleteEntity(pickaxe)
                            DeleteObject(pickaxe)
                            mineActive = false
                            impacts = 0
                            
                            TriggerServerEvent("esx_miner:givestone")
                            break
                        end           
                end
            else
            TriggerServerEvent("esx_miner:TooMuchStone")
            end
    end)
end

function Washing()
    local ped = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    washingActive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    TriggerEvent("esx_miner:timer")
    Citizen.Wait(16200)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    washingActive = false
end

function Remelting()
    local ped = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    remeltingActive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    TriggerEvent("esx_miner:timer")
    Citizen.Wait(15900)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    remeltingActive = false
    
end


Citizen.CreateThread(function()
    while true do
	local ped = PlayerPedId()
        Citizen.Wait(1)
            if GetDistanceBetweenCoords(GetEntityCoords(ped), Config.SellX, Config.SellY, Config.SellZ, true) < 2 then
                Draw3DText( Config.SellX, Config.SellY,Config.SellZ+1 -1.400, ('Press ~r~E ~w~to sell your items'), 4, 0.1, 0.1)
                    if IsControlJustReleased(1, 51) then
                        Jeweler()                      
            end
        end
    end
 end)
    

function Jeweler()
    local elements = {
        {label = '<span style="color: aqua">Sell 1 Diamond </b></span>',   value = 'diamonds'},
        {label = '<span style="color: aqua">Sell All Diamonds </b></span>',   value = 'Adiamonds'},
        {label = '<span style="color: gold">Sell 1 Gold </b></span>',      value = 'gold'},
        {label = '<span style="color: gold">Sell All Gold </b></span>',      value = 'Agold'},
        {label = '<span style="color: #a19d94">Sell 1 Iron</b></span>',       value = 'iron'},
        {label = '<span style="color: #a19d94">Sell All Iron</b></span>',       value = 'Airon'},
        {label = '<span style="color: #b87333"><b>Sell 1 Copper</b></span>',       value = 'copper'},
        {label = '<span style="color: #b87333"><b>Sell All Copper</b></span>',       value = 'Acopper'},
        {label = '<span style="color: red"><b>Exit</b></span>',       value = 'exit'},
    }

    CF.UI.Menu.CloseAll()

    CF.UI.Menu.Open('default', GetCurrentResourceName(), 'jeweler_actions', {
        title    = 'Jeweler - sale',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        local item1 = CF.GetInventory()['diamond']
        local item2 = CF.GetInventory()['gold']
        local item3 = CF.GetInventory()['copper']
        local item4 = CF.GetInventory()['iron']
        if data.current.value == 'Adiamonds' then
            menu.close()
            local item = CF.GetInventory()['diamond']
            if item.count > 0 then
                TriggerServerEvent("esx_miner:selldiamonda",item1)
            else
                TriggerServerEvent("esx_miner:nodiamond")
            end
        elseif data.current.value == 'Agold' then
            menu.close()
            local item = CF.GetInventory()['gold']
            if item.count > 0 then
                TriggerServerEvent("esx_miner:sellgolda",item2)
            else
                TriggerServerEvent("esx_miner:nogold")
            end
        elseif data.current.value == 'Airon' then
            menu.close()
            local item = CF.GetInventory()['iron']
            if item.count > 0 then
                TriggerServerEvent("esx_miner:sellirona",item4)
            else
                TriggerServerEvent("esx_miner:noiron")
            end
        elseif data.current.value == 'Acopper' then
            menu.close()
            local item = CF.GetInventory()['copper']
            if item.count > 0 then
                TriggerServerEvent("esx_miner:sellcoppera",item3)
            else
                TriggerServerEvent("esx_miner:nocopper")
            end
        elseif data.current.value == 'diamonds' then
            menu.close()
            local item = CF.GetInventory()['diamond']
            if item.count > 0 then
                TriggerServerEvent("esx_miner:selldiamond",item1)
            else
                TriggerServerEvent("esx_miner:nodiamond")
            end
        elseif data.current.value == 'gold' then
            menu.close()
            local item = CF.GetInventory()['gold']
            if item.count > 0 then
                TriggerServerEvent("esx_miner:sellgold",item2)
            else
                TriggerServerEvent("esx_miner:nogold")
            end
        elseif data.current.value == 'iron' then
            menu.close()
            local item = CF.GetInventory()['iron']
            if item.count > 0 then
                TriggerServerEvent("esx_miner:selliron",item4)
            else
                TriggerServerEvent("esx_miner:noiron")
            end
        elseif data.current.value == 'copper' then
            menu.close()
            local item = CF.GetInventory()['copper']
            if item.count > 0 then
                TriggerServerEvent("esx_miner:sellcopper",item3)
            else
                TriggerServerEvent("esx_miner:nocopper")
            end
        elseif data.current.value == 'exit' then
            menu.close()
        end
    end)
end





Citizen.CreateThread(function()
    local hash = GetHashKey("ig_natalia")

    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Citizen.Wait(100)
    end

    while not HasModelLoaded(hash) do
        Citizen.Wait(0)
    end

    if firstspawn == false then
        local npc = CreatePed(6, hash, Config.SellX, Config.SellY, Config.SellZ, 129.0, false, false)
        SetEntityInvincible(npc, true)
        FreezeEntityPosition(npc, true)
        SetPedDiesWhenInjured(npc, false)
        SetPedCanRagdollFromPlayerImpact(npc, false)
        SetPedCanRagdoll(npc, false)
        SetEntityAsMissionEntity(npc, true, true)
        SetEntityDynamic(npc, true)
    end
end)

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
    local scale = (1/dist)*20
    local fov = (1/GetGameplayCamFov())*100 
    SetTextScale(0.35, 0.35)
    SetTextFont(fontId)
    SetTextProportional(0)
    SetTextColour(255, 255, 255, 215)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+2, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()   
end

RegisterNetEvent('esx_miner:createblips')
AddEventHandler('esx_miner:createblips', function()
    Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(1)
                if blips == true and blipActive == false then
                    blip1 = AddBlipForCoord(-597.01, 2091.42, 131.41)
                    blip2 = AddBlipForCoord(Config.WashingX, Config.WashingY, Config.WashingZ)
                    blip3 = AddBlipForCoord(Config.RemeltingX, Config.RemeltingY, Config.RemeltingZ)
                    blip4 = AddBlipForCoord(Config.SellX, Config.SellY, Config.SellZ)
                    SetBlipSprite(blip1, 365)
                    SetBlipColour(blip1, 5)
                    SetBlipAsShortRange(blip1, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Mine")
                    EndTextCommandSetBlipName(blip1)   
                    SetBlipSprite(blip2, 365)
                    SetBlipColour(blip2, 5)
                    SetBlipAsShortRange(blip2, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Washing stones")
                    EndTextCommandSetBlipName(blip2)   
                    SetBlipSprite(blip3, 365)
                    SetBlipColour(blip3, 5)
                    SetBlipAsShortRange(blip3, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Smelt stones")
                    EndTextCommandSetBlipName(blip3)
                    SetBlipSprite(blip4, 272)
                    SetBlipColour(blip4, 5)
                    SetBlipAsShortRange(blip4, true)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Selling items")
                    EndTextCommandSetBlipName(blip4)    
                    blipActive = true
                elseif blips == false and blipActive == false then
                    RemoveBlip(blip1)
                    RemoveBlip(blip2)
                    RemoveBlip(blip3)
                end
        end
    end)
end)






Citizen.CreateThread(function()
	while CF == nil do 
        Citizen.Wait(0)
        TriggerEvent('cf:getSharedObject', function(obj) CF = obj end)
    end
    
end)

RegisterNetEvent("esx_miner:remelting")
AddEventHandler("esx_miner:remelting", function()
    Remelting()
end)

RegisterNetEvent("esx_miner:w")
AddEventHandler("esx_miner:w", function()
    Washing()
end)

RegisterNetEvent("esx_miner:mining")
AddEventHandler("esx_miner:mining", function()
    Animation()
end)

RegisterNetEvent('esx_miner:timer')
AddEventHandler('esx_miner:timer', function()
    local timer = 0
    local ped = PlayerPedId()
    
    Citizen.CreateThread(function()
		while timer > -1 do
			Citizen.Wait(150)

			if timer > -1 then
				timer = timer + 1
            end
            if timer == 100 then
                break
            end
        end
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsw[1].x, locationsw[1].y, locationsw[1].z, true) < 1.25 then
                Draw3DText( locationsw[1].x, locationsw[1].y, locationsw[1].z+0.5 -1.400, ('Washing stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsw[2].x, locationsw[2].y, locationsw[2].z, true) < 1.25 then
                Draw3DText( locationsw[2].x, locationsw[2].y, locationsw[2].z+0.5 -1.400, ('Washing stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsw[3].x, locationsw[3].y, locationsw[3].z, true) < 1.25 then
                Draw3DText( locationsw[3].x, locationsw[3].y, locationsw[3].z+0.5 -1.400, ('Washing stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsw[4].x, locationsw[4].y, locationsw[4].z, true) < 1.25 then
                Draw3DText( locationsw[4].x, locationsw[4].y, locationsw[4].z+0.5 -1.400, ('Washing stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsw[5].x, locationsw[5].y, locationsw[5].z, true) < 1.25 then
                Draw3DText( locationsw[5].x, locationsw[5].y, locationsw[5].z+0.5 -1.400, ('Washing stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsw[6].x, locationsw[6].y, locationsw[6].z, true) < 1.25 then
                Draw3DText( locationsw[6].x, locationsw[6].y, locationsw[6].z+0.5 -1.400, ('Washing stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsw[7].x, locationsw[7].y, locationsw[7].z, true) < 1.25 then
                Draw3DText( locationsw[7].x, locationsw[7].y, locationsw[7].z+0.5 -1.400, ('Washing stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsw[8].x, locationsw[8].y, locationsw[8].z, true) < 1.25 then
                Draw3DText( locationsw[8].x, locationsw[8].y, locationsw[8].z+0.5 -1.400, ('Washing stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsr[1].x, locationsr[1].y, locationsr[1].z, true) < 1.25 then
                Draw3DText( locationsr[1].x, locationsr[1].y, locationsr[1].z+0.5 -1.400, ('Remelting stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsr[2].x, locationsr[2].y, locationsr[2].z, true) < 1.25 then
                Draw3DText( locationsr[2].x, locationsr[2].y, locationsr[2].z+0.5 -1.400, ('Remelting stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsr[3].x, locationsr[3].y, locationsr[3].z, true) < 1.25 then
                Draw3DText( locationsr[3].x, locationsr[3].y, locationsr[3].z+0.5 -1.400, ('Remelting stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsr[4].x, locationsr[4].y, locationsr[4].z, true) < 1.25 then
                Draw3DText( locationsr[4].x, locationsr[4].y, locationsr[4].z+0.5 -1.400, ('Remelting stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsr[5].x, locationsr[5].y, locationsr[5].z, true) < 1.25 then
                Draw3DText( locationsr[5].x, locationsr[5].y, locationsr[5].z+0.5 -1.400, ('Remelting stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsr[6].x, locationsr[6].y, locationsr[6].z, true) < 1.25 then
                Draw3DText( locationsr[6].x, locationsr[6].y, locationsr[6].z+0.5 -1.400, ('Remelting stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsr[7].x, locationsr[7].y, locationsr[7].z, true) < 1.25 then
                Draw3DText( locationsr[7].x, locationsr[7].y, locationsr[7].z+0.5 -1.400, ('Remelting stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(ped), locationsr[8].x, locationsr[8].y, locationsr[8].z, true) < 1.25 then
                Draw3DText( locationsr[8].x, locationsr[8].y, locationsr[8].z+0.5 -1.400, ('Remelting stones in progress ' .. timer .. '%'), 4, 0.1, 0.1)
            end
            if timer == 100 then
                timer = 0
                break
            end
        end
    end)
end)



RegisterNetEvent('esx_miner:chooseitem')
AddEventHandler('esx_miner:chooseitem', function()
    local randomChance = math.random(1, 100)
    
    local item = CF.GetInventory()['washedstones']
    if item.count > 9 then
        
        local item1 = CF.GetInventory()['diamond']
        local item2 = CF.GetInventory()['gold']
        local item3 = CF.GetInventory()['copper']
        local item4 = CF.GetInventory()['iron']
            if randomChance < 12 then
                if item1.count <= 4 then 
                    TriggerServerEvent("esx_miner:givediamond")
                else
                    TriggerServerEvent("esx_miner:nospace")
                end
            elseif randomChance > 12 and randomChance < 25 then
                if item2.count <= 5 then 
                    TriggerServerEvent("esx_miner:givegold")
                else
                    TriggerServerEvent("esx_miner:nospace")
                end
            elseif randomChance > 26 and randomChance < 50 then
                if item4.count <= 10 then 
                    TriggerServerEvent("esx_miner:giveiron")
                else
                    TriggerServerEvent("esx_miner:nospace")
                end
            else
                if item3.count <= 20 then 
                    TriggerServerEvent("esx_miner:givecopper")
                else
                    TriggerServerEvent("esx_miner:nospace")
                end
            end       
        
    else
        TriggerServerEvent("esx_miner:NWS")
        remeltingActive = false
    end
end)