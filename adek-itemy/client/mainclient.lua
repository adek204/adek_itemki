ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------
zuzyteitemy = {}
RegisterNetEvent("adek:uzyj")
AddEventHandler("adek:uzyj", function(itemek)
	for k,v in ipairs(Config.Itemy) do
		if v.item == itemek then
			if checkifused(itemek) == nil then
				if not blocked then
				TriggerServerEvent("adek:removeitem", itemek)
	local playerPed = GetPlayerPed(-1)
	local health = GetEntityHealth(playerPed)
		exports['progressBars']:startUI(v.czas * 600, "BANDAŻUJESZ SIE")
		ESX.UI.Menu.CloseAll()
		TaskPlayAnim(playerPed, 'random@dealgonewrong', "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
		blocked = true
	Citizen.Wait(v.czas * 600)
		blocked = false
	local newHealth = (health + v.heal)
		SetEntityHealth(playerPed, newHealth)
		table.insert(zuzyteitemy, {id = itemek, time = v.timetocan})
		print(json.encode(zuzyteitemy))
		ClearPedTasksImmediately(playerPed)
		timer()
		else
			ESX.ShowNotification("Już Użyłeś tego itemu")
			end
		else
			ESX.ShowNotification("Zwolnij Troche")
			end
		end
	end
end)

RegisterNetEvent("adek:podnies")
AddEventHandler("adek:podnies", function(itemek)
	for k,v in ipairs(Config.Itemy) do
		if v.item == itemek then
			if checkifused(itemek) == nil then
			if not blocked then
		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer == -1 or closestDistance > 3.0 then
					ESX.ShowNotification(('Nie ma nikogo w pobliżu'))
				else
					local closestPlayerPed = GetPlayerPed(closestPlayer)

				if IsPedDeadOrDying(closestPlayerPed, 1) then
		local playerPed = GetPlayerPed(-1)

		TriggerServerEvent("adek:removeitem", itemek)
		exports['progressBars']:startUI(v.timetorevive * 600, "Pomagasz Osobie")
		ESX.UI.Menu.CloseAll()
		TaskPlayAnim(playerPed, 'missheistfbi3b_ig8_2', "cpr_loop_paramedic", 8.0, 1.0, -1, 1, 0, 0, 0, 0 )
		blocked = true
	Citizen.Wait(v.timetorevive * 600)
		blocked = false
		table.insert(zuzyteitemy, {id = itemek, time = v.timetocanrevive})
		TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
		print(json.encode(zuzyteitemy))
		ClearPedTasksImmediately(playerPed)
		timer()
		else
			ESX.ShowNotification("Już Użyłeś tego itemu")
			end
		end
		else
			ESX.ShowNotification("Zwolnij Troche")
			end
		end
	end
	end
end)

function checkifused(id)
    for k,v in ipairs(zuzyteitemy) do
        if v.id == id then
            return k
        end
    end
    return nil
end

function timer()
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if zuzyteitemy[1] ~= nil then
        for k,v in ipairs(zuzyteitemy) do
        if v.time ~= 0 then
            v.time = v.time - 1
            print(v.time)
        else
            table.remove(zuzyteitemy,k)
            print(json.encode(zuzyteitemy))
        end
    end
      Citizen.Wait(1000)
        end
    end
end)
end
