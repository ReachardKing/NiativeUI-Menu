print('CRPMenu Made by Mackenzie_Rich & Desired (CRPMenu)')
print('Version:1.7.6; @ Mackenzie_Rich, remeber to change this area too')

RegisterServerEvent('teleport')

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/pd sandy" or msg == "/pd blaine" or msg == "/pd bcso" then
		CancelEvent()
		local x = 1849.388
		local y = 3689.164
		local z = 34.270
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		TriggerClientEvent('teleport', source, x, y, z)
	elseif msg == "/pd paleto" or msg == "/pd paletobay" then
		CancelEvent()
		local x = -447.307
		local y = 6009.122
		local z = 32.616
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		TriggerClientEvent('teleport', source, x, y, z)
	elseif msg == "/pd vespucci" or msg == "/pd westls" then
		CancelEvent()
		local x = -1082.507
		local y = -866.390
		local z = 5.050
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		TriggerClientEvent('teleport', source, x, y, z)
	elseif msg == "/pd missionrow" or msg == "/pd lspd" then
		CancelEvent()
		local x = 450.515
		local y = -991.851
		local z = 30.700
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		TriggerClientEvent('teleport', source, x, y, z)
	elseif msg == "/pd rockford" or msg == "/pd rockfordhills" then
		CancelEvent()
		local x = -556.275
		local y = -131.940
		local z = 38.110
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		TriggerClientEvent('teleport', source, x, y, z)
	elseif msg == "/pd vinewood" or msg == "/pd vinewoodpd" then
		CancelEvent()
		local x = 641.542
		local y = -6.150
		local z = 82.790
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		TriggerClientEvent('teleport', source, x, y, z)
	elseif msg == "/pd lamesa" or msg == "/pd la mesa" or msg == "/pd eastls" then
		CancelEvent()
		local x = 824.501
		local y = -1291.138
		local z = 28.245
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		TriggerClientEvent('teleport', source, x, y, z)
	elseif msg == "/pd davis" or msg == "/pd grove" then
		CancelEvent()
		local x = 374.245
		local y = -1608.263
		local z = 29.292
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		TriggerClientEvent('teleport', source, x, y, z)
	elseif msg == "/pd sasp" or msg == "/pd sahp" then
		CancelEvent()
		local x = 2506.297
		local y = -384.514
		local z = 94.125
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		TriggerClientEvent('teleport', source, x, y, z)
	end
end)

