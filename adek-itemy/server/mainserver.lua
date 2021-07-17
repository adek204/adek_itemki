ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------
ESX.RegisterUsableItem('bandaz', function(source)
    local source = source
    xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('adek:uzyj', source, 'bandaz')
end)

ESX.RegisterUsableItem('medkit', function(source)
    local source = source
    xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('adek:uzyj', source, 'medkit')
end)



---------------------------------------------------------------------
-- ESX.RegisterUsableItem('defibrillator', function(source)
--     local source = source
--     xPlayer = ESX.GetPlayerFromId(source)
--     TriggerClientEvent('adek:podnies', source, 'defibrillator')
-- end)

-----------------------------------------------------------------------------<- Tego nie zmieniamy
RegisterServerEvent("adek:removeitem")
AddEventHandler("adek:removeitem", function(item)
    local source = source
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, 1)
end)