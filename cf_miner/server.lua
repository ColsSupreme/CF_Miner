CF = nil

TriggerEvent('cf:getSharedObject', function(obj) CF = obj end)

RegisterNetEvent("esx_miner:givestone")
AddEventHandler("esx_miner:givestone", function(item, count)
    local _source = source
    local xPlayer  = exports.essentialmode:getPlayerFromId(_source)
        if xPlayer ~= nil then
                CF.AddItem(_source,'stones', 5)
                CF.ShowNotification(_source, 'You received ~b~Stones.')   
        end
    end)

RegisterNetEvent("esx_miner:noStone")
AddEventHandler("esx_miner:noStone",function(item,count)
    local _source = source
CF.ShowNotification(_source, 'You do not have enough ~b~Stones.')
end)

RegisterNetEvent("esx_miner:washing")
AddEventHandler("esx_miner:washing", function(item, count)
    local _source = source
    
        TriggerClientEvent("esx_miner:w", _source)
        Citizen.Wait(15900)
        local xPlayer  = exports.essentialmode:getPlayerFromId(_source)
            if xPlayer ~= nil then
                    CF.RemoveItem(_source,'stones', 5)
                    CF.AddItem(_source,'washedstones', 5)
                    CF.ShowNotification(_source, 'You received ~b~Washed Stones.')
            end
   
end)



    RegisterNetEvent("esx_miner:NWS")
    AddEventHandler("esx_miner:NWS", function(item,count)
    local _source = source
    CF.ShowNotification(_source, 'You do not have enough ~b~Washed stones.')
    end)

    RegisterNetEvent("esx_miner:NEWS")
    AddEventHandler("esx_miner:NEWS", function(item,count)
    local _source = source
    CF.ShowNotification(_source, 'You do not have enough space for ~b~Washed stones.')
    end)

    RegisterNetEvent("esx_miner:nospace")
    AddEventHandler("esx_miner:nospace", function(item,count)
    local _source = source
    TriggerClientEvent("esx_miner:remelting", _source)
    Citizen.Wait(15900)
    CF.RemoveItem(_source,"washedstones", 10)
    CF.ShowNotification(_source, 'You did not get anything this time')
    end)



    RegisterNetEvent("esx_miner:TooMuchStone")
AddEventHandler("esx_miner:TooMuchStone", function(item, count)
    _source = source
    CF.ShowNotification(_source, 'You do not have enough space for ~b~Stone.')
end)


RegisterNetEvent("esx_miner:sellirona")
AddEventHandler("esx_miner:sellirona", function(count)
    local _source = source
    local price = Config.IronPrice
    local user = exports.essentialmode:getPlayerFromId(_source)
    local amounts = count.count
        CF.RemoveItem(_source,'iron', amounts)
        user.addMoney(price*amounts)
        CF.ShowNotification(_source, 'You have sold '.. amounts ..' Iron for ~g~$' ..  price*amounts)
    
end)

RegisterNetEvent("esx_miner:sellcoppera")
AddEventHandler("esx_miner:sellcoppera", function(count)
    local _source = source
    --print(count.count)
    local amounts = count.count
    local price = Config.CopperPrice
    local user = exports.essentialmode:getPlayerFromId(_source)
    
        CF.RemoveItem(_source,'copper', amounts)
        user.addMoney(price*amounts)
        CF.ShowNotification(_source, 'You have sold ' .. amounts .. ' Copper for ~g~$' ..  price*amounts)
    
end)

RegisterNetEvent("esx_miner:sellgolda")
AddEventHandler("esx_miner:sellgolda", function(count)
    local _source = source
    local price = Config.GoldPrice
    local user = exports.essentialmode:getPlayerFromId(_source)
    local amounts = count.count
    CF.RemoveItem(_source,'gold', amounts)
    user.addMoney(price*amounts)
    CF.ShowNotification(_source, 'You have sold '..amounts .. ' Gold for ~g~$' ..  price*amounts)
end)



RegisterNetEvent("esx_miner:selldiamonda")
AddEventHandler("esx_miner:selldiamonda", function(count)
    local _source = source
    local price = Config.DiamondPrice
    local user = exports.essentialmode:getPlayerFromId(_source)
    local amounts = count.count
    CF.RemoveItem(_source,'diamond', amounts)
    user.addMoney(price*amounts)
    CF.ShowNotification(_source, 'You have sold ' .. amounts .. ' Diamond(s) for ~g~$' ..  price*amounts)
end)


RegisterNetEvent("esx_miner:selliron")
AddEventHandler("esx_miner:selliron", function(count)
    local _source = source
    local price = Config.IronPrice
    local user = exports.essentialmode:getPlayerFromId(_source)
    local amounts = 1
        CF.RemoveItem(_source,'iron', 1)
        user.addMoney(price)
        CF.ShowNotification(_source, 'You have sold '.. amounts ..' Iron for ~g~$' ..  price)
    
end)

RegisterNetEvent("esx_miner:sellcopper")
AddEventHandler("esx_miner:sellcopper", function(count)
    local _source = source
    --print(count.count)
    local amounts = 1
    local price = Config.CopperPrice
    local user = exports.essentialmode:getPlayerFromId(_source)
    
        CF.RemoveItem(_source,'copper', 1)
        user.addMoney(price)
        CF.ShowNotification(_source, 'You have sold ' .. amounts .. ' Copper for ~g~$' ..  price)
    
end)

RegisterNetEvent("esx_miner:sellgold")
AddEventHandler("esx_miner:sellgold", function(count)
    local _source = source
    local price = Config.GoldPrice
    local user = exports.essentialmode:getPlayerFromId(_source)
    local amounts = 1
    CF.RemoveItem(_source,'gold', 1)
    user.addMoney(price)
    CF.ShowNotification(_source, 'You have sold '..amounts .. ' Gold for ~g~$' ..  price)
end)



RegisterNetEvent("esx_miner:selldiamond")
AddEventHandler("esx_miner:selldiamond", function(count)
    local _source = source
    local price = Config.DiamondPrice
    local user = exports.essentialmode:getPlayerFromId(_source)
    local amounts = 1
    CF.RemoveItem(_source,'diamond', 1)
    user.addMoney(price)
    CF.ShowNotification(_source, 'You have sold ' .. amounts .. ' Diamond(s) for ~g~$' ..  price)
end)

RegisterNetEvent("esx_miner:nodiamond")
AddEventHandler("esx_miner:nodiamond", function(item, count)
    local _source = source
    CF.ShowNotification(_source, 'You do not have enough ~g~Diamonds.')
end)

RegisterNetEvent("esx_miner:nogold")
AddEventHandler("esx_miner:nogold", function(item, count)
    local _source = source
    CF.ShowNotification(_source, 'You do not have enough ~g~Gold.')
end)

RegisterNetEvent("esx_miner:noiron")
AddEventHandler("esx_miner:noiron", function(item, count)
local _source = source
    CF.ShowNotification(_source, 'You do not have enough ~g~Iron.')
end)

RegisterNetEvent("esx_miner:nocopper")
AddEventHandler("esx_miner:nocopper", function(item, count)
local _source = source
    CF.ShowNotification(_source, 'You do not have enough ~g~Copper.')
end)

RegisterNetEvent("esx_miner:givediamond")
AddEventHandler("esx_miner:givediamond", function(item, count)
    
    local _source = source
    TriggerClientEvent("esx_miner:remelting", _source)
                Citizen.Wait(15900)
    CF.AddItem(_source,"diamond", 1)
    CF.RemoveItem(_source,"washedstones", 10)
    CF.ShowNotification(_source, 'You get ~b~1 Diamond ~w~for 10 washed stones.')              
end)

RegisterNetEvent("esx_miner:givegold")
AddEventHandler("esx_miner:givegold", function(item, count)
    local _source = source
    TriggerClientEvent("esx_miner:remelting", _source)
                Citizen.Wait(15900)
    CF.AddItem(_source,"gold", 5)
    CF.RemoveItem(_source,"washedstones", 10)
    CF.ShowNotification(_source, 'You get ~b~5 Gold ~w~for 10 washed stones.')      
end)

RegisterNetEvent("esx_miner:giveiron")
AddEventHandler("esx_miner:giveiron", function(item, count)
    local _source = source
    TriggerClientEvent("esx_miner:remelting", _source)
                Citizen.Wait(15900)
    CF.AddItem(_source,"iron", 10)
    CF.RemoveItem(_source,"washedstones", 10)
    CF.ShowNotification(_source, 'You get ~b~10 Iron ~w~for 10 washed stones.')  
end)

RegisterNetEvent("esx_miner:givecopper")
AddEventHandler("esx_miner:givecopper", function(item, count)
    local _source = source
    TriggerClientEvent("esx_miner:remelting", _source)
                Citizen.Wait(15900)
    CF.AddItem(_source,"copper", 20)
    CF.RemoveItem(_source,"washedstones", 10)
    CF.ShowNotification(_source, 'You get ~b~20 Copper ~w~for 10 washed stones.')  
end)