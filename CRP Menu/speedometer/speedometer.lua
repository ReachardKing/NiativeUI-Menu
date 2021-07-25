local mph = true 

if mph == true then
    local factor = 2.2369
else
    local factor = 3.6
end

local mph = 2.2369
local kph = 3.6 

-- Do not change it to floor ,Ever!

function text(content) 
    SetTextFont(2)
    SetTextProportional(0)
    SetTextScale(1.9,1.9)
    SetTextEntry("STRING")
    AddTextComponentString(content .. "~b~kph")
    DrawText(0.9,0.7)
end
Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        local speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*3.6
        -- Condition to check if the ped is in a vehicle
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(math.ceil(speed))
		print("Mackenzie_Rich")
        end
    end
end)