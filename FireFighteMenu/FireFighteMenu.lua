_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("FireFighteMenu", "")
_menuPool:Add(mainMenu)

bool = false

function FirstItem(menu) 
    local submenu = _menuPool:AddSubMenu(menu, "~b~Sub Menu", "~g~More cars will be added, in the future") 
    local carItem = NativeUI.CreateItem("Spawn car", "Spawn car in a submenu")
    carItem.Activated = function(sender, item)
         if item == carItem then
             spawnCar("adder")
             notify("spawned in an adder")
         end
    end
    local seat = NativeUI.CreateSliderItem("Change seat", seats, 1)
     submenu.OnSliderChange = function(sender, item, index)
         if item == seat then
             vehSeat = item:IndexToItem(index)
             local pedsCar = GetVehiclePedIsIn(GetPlayerPed(-1),false)
             SetPedIntoVehicle(PlayerPedId(), pedsCar, vehSeat)
         end
        end 
    local Delete = NativeUI.CreateItem("~r~Delete", "This will deleted your car for good, Are you Sure?") 
    submenu.OnItemSelect = function (sender, item, checked_)
               -- check if what changed is from this menu
            if item == checkbox then
                Deletedveh()
                notify("Deleted")
               end
            end
    local Cancel = NativeUI.CreateItem("Cancel", "No, i do not want mu vehicle delete")
    submenu.OnItemSelect = function(sender, item, index, checked_)
            if item == checkbox then
                    Cencel()
                    notify("~g~Camceled??")
                end
            end
        submenu:AddItem(Delete)
        submenu:AddItem(Cancel)   
        submenu:AddItem(carItem)
        submenu:AddItem(seat)
end


FirstItem(mainMenu)
_menuPool:RefreshIndex()S

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        _menuPool:ProcessMenus()
        --[[ The "F5" button will activate the menu ]]
        if IsControlJustPressed(1, 166) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end


-- Shows a notification on the player's screen 
function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

function giveWeapon(hash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 999, false, false)
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
