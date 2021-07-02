--- Clear Guns
RegisterCommand("clear", function())
  RemoveAllPedWeapons(GetPlayerPed(-1), true)
  notify("~r~Cleaer All weapon")
end)  

--Car command
local car = {"Adder", "comet", "cheether", "fagio"} 
RegisterCommand("car", function()
  local car = (cars[math.random(#car)])
  spawnCar(car)
  notify("~p~spawnCar: ~h~g~.. car")

end) 

--Die 
RegisterCommand("die", function()
  setEntityHalth(GetPlayerPedID(), 0)
  notify("~r~ you're died")
end)
