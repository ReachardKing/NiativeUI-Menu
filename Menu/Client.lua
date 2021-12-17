RegisterNetEvent("teleport");

AddEventHandler('teleport', function(x, y, z)
	TriggerEvent("chatMessage", "", { 0, 0, 0 }, "Teleported to station!")
	SetEntityCoords(GetPlayerPed(-1), x, y, z, 1, 0, 0, 1)
end)