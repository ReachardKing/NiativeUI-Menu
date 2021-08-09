---Clear Guns
RegisterCommand('clear', function(source, args, rawCommands)
  RemoveAllPedWeapons(GetPlayerPed(-1))
  TriggerEvent('chat:addSuggestion', '/' .. clear, 'Used to clear weapons')
  ShowNotification("~r~Cleaered All weapon")
end)  

RegisterCommand('car', function(source, args, rawCommands)  
  local x,y,z = table.unpack(GetOffsetFromEntityInWprldCords(PlayerPedId(), 0.8, 8.0, 0.5))
  local Veh = args[1]
  if veh == nil then veh = "adder" end
  vehiclehash = GetHashKey(veh)
  RequestModel(vehiclehash)

  Citizen.CreateThread(function(source, args, rawCommands)
    local watiing = 0
    while not HasModelLoaded(vehiclehash) do
      watiing = watiing + 100
      Citizen.Wait(100)
      if watiing > 500 then
        ShowNotification("~r~Could not locad the vehicle in time, crash was prevented.")
        break
      end
    end
    CreateVehicle(vehiclehash, z, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
  end)
end)

--Die   
RegisterCommand("die", function(source, args, rawCommands)
  setEntityHalth(GetPlayerPed(-1), 0)
  ShowNotification("You died, FATLITY")
end)

RegisterCommand("help", function(source, args, rawCommands)
  TriggerEvent('chat:addsuggestion', "/" .. die, 'just do it, jk')

end)

function ShowNotification(text)
  ShowNotification("STING")
  AddTextComponentStringPlayerName(text)
  DrawNotification(false, false)
end  
function spawnCar(car)
  local car = GetHashKey(car)

  RequestModel(car)
  while not HasModelLoaded(car) do
      RequestModel(car)
      Citizen.Wait(50)
  end

  local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
  local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, GetEntityHeading(PlayerPedId()), true, false)
  SetPedIntoVehicle(PlayerPedId(), vehicle, -1)

  SetEntityAsNoLongerNeeded(vehicle)
  SetModelAsNoLongerNeeded(vehicleName)

  --[[ SetEntityAsMissionEntity(vehicle, true, true) ]]
end 
RegisterNetEvent('sendProximityMessageclear')
AddEventHandler('sendProximityMessageclear', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  end
end)

RegisterNetEvent('sendProximityMessagecar')
AddEventHandler('sendProximityMessagecar', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  end
end)

RegisterNetEvent('sendProximityMessagedie')
AddEventHandler('sendProximityMessagedie', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  end
end)
RegisterNetEvent('sendProximityMessagehelp')
AddEventHandler('sendProximityMessagehelp', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "^4" .. name .. "", {0, 153, 204}, "^7 " .. message)
  end
end)

 print("chatcommands Made by Mackenzie_Rich & Desired (chatcommands)")
