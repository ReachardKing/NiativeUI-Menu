--1:05 PM 2021-06-27

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("FireFighter/EMS", "~r~Were Canadian's do it Right")
_menuPool:Add(mainMenu)

-- Used in "FirstMenu"
bool = false

-- this menu is a checkbox item
function FirstItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "EMS Options  →→→", "Acess EMS Options")
end
 
function SecondItem(menu) 
    local submenu = _menuPool:AddSubMenu(menu, "FireFighter Options  →→→", "Acess FirFighter Options")
end

-- Used in "ThirdItem"
 weapons = {
    "weapon_flashlight",
    "weapon_flare",
    "weapon_flaregun",
    "weapon_stungun",
    "weapon_pipewrench",
    "weapon_fireextinguisher"
 }
 function ThirdItem(menu)
     local gunsList = NativeUI.CreateListItem("Get Equipments", weapons, 1)
     menu:AddItem(gunsList)
     menu.OnListSelect = function(sender, item, index)  
         if item == gunsList then
             local selectedGun = item:IndexToItem(index)
             giveWeapon(selectedGun)
             notify("spawned in a ~b~".. selectedGun)
         end
     end
 end
 -- used in "FourthItem"
 seats = {-1,0,1,2}
function FourthItem(menu) 
    local submenu = _menuPool:AddSubMenu(menu, "~b~Vheicle Options  →→→", "Acess Vehicle Options") 
    local carItem = NativeUI.CreateItem("Spawn Ambulance", "Spawn Ambulance in a submenu")
    carItem.Activated = function(sender, item)
         if item == carItem then
             spawnCar("ambulance")
             notify("spawned in an Ambulance")
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
    local FireTruck = NativeUI.CreateItem("Spawn FireTruck", "Spawn Firetruck in a submenu")
    FireTruck.Activated = function(sender, item)
         if item == FireTruck then
             spawnCar("firetruk")
             notify("spawned in an Firetruck")
         end
    end  
    submenu:AddItem(carItem)
    submenu:AddItem(FireTruck)
    submenu:AddItem(seat)
    
end 
                                 
--[[this menu is a checkbox item FifthItem
function FifthItem(menu)
end]]

function SeventhItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "~r~Delete  →→→", "Allows you to delete your car")
    local Delete = NativeUI.CreateItem("~r~Delete", "This will delete any vehicle for good, Are you Sure?") 
    submenu.Activated = function (sender, item, checked_)
        -- check if what changed is from this menu
        if item == Delete then
            DeletEntity(Vehicle)
            notify("You have successfuly Deleted the vehicle")
        end
    end
    local Cancel = NativeUI.CreateItem("Cancel", "No, i do not want my vehicle deleted")
    submenu.OnItemSelect = function(sender, item, checked_)
        if item == Cancel then
                menu:GoBack()
                notify("~g~Your selection was successful")
            end
        end
        submenu:AddItem(Delete)
        submenu:AddItem(Cancel)
end

function EighthtItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Settings  →→→", "Access CRP  Settings")
    local Close = NativeUI.CreateItem("Clse Menu", "Closes this Menu")
    submenu.OnItemSelect = function(sender, item, index, checked_)  
        if item == Close then
            mainMenu:Visible(not mainMenu:Visible())
            notify("Menu has been closed")
        end
    end
    submenu:AddItem(Close)
end

-- SexthItem
function SexthItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "~g~About  →→→", "About CRP menu")
    local About = NativeUI.CreateItem("About", "This is a brand new menu made by ~b~Mackenzie_Rich.") 
    submenu.OnItemSelect = function (sender, item, checked_)
       -- check if what changed is from this menu
       if item == About then
            GetSelected()
            notify("About")
        end
    end
    local Version = NativeUI.CreateItem("FF/EMS-MENU Version", "~r~1.9.1")
    submenu.OnItemSelect = function(sender, item, checked_)
        if item == click then
            GetVerion()
            notify("~g~No New Update")
        end
    end
    submenu:AddItem(About)
    submenu:AddItem(Version)
end

FirstItem(mainMenu)
SecondItem(mainMenu)
FourthItem(mainMenu)
--FifthItem(mainMenu)
ThirdItem(mainMenu)
SexthItem(mainMenu)
SeventhItem(mainMenu)
EighthtItem(mainMenu)
_menuPool:RefreshIndex()
RegisterCommand('FFMenu', function() -- edit this line to change the command to open the menu
    mainMenu:Visible(not mainMenu:Visible())
end, false)

-- Keys to open menu
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        _menuPool:ProcessMenus()
        --[[ The "Delete" button will activate the menu ]]
        if IsControlJustPressed(1, 214) and IsControlJustPressed(1, 214) then
            ExecuteCommand('FFMenu')
        end
    end
end)

_menuPool:MouseControlsEnabled(false);
_menuPool:MouseEdgeEnabled(false);
_menuPool:ControlDisablingEnabled(false);

-- Shows a notification on the player's screen 
function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

--[[ COPY BELOW ]]


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
