_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("CRP Menu", "~b~Were Canadian's do it Right")
_menuPool:Add(mainMenu)

-- Used in "FirstMenu"
bool = false

-- this menu is a checkbox item
function FirstItem(menu)
    local checkbox = NativeUI.CreateCheckboxItem("pinaple", bool, "Toggle this item")
    menu:AddItem(checkbox)
    menu.OnCheckboxChange = function (sender, item, checked_)
       -- check if what changed is from this menu
       if item == checkbox then
         bool = checked_
         --[[ Outputs what the checkbox state is ]]
         notify(tostring(bool))
       end
    end
 end
 
 function SecondItem(menu) 
     local click = NativeUI.CreateItem("Heal me", "~g~Heal yourself")
     menu:AddItem(click)
     menu.OnItemSelect = function(sender, item, index)
         if item == click then
             SetEntityHealth(PlayerPedId(), 200)
             notify("~g~Healed.")
         end
     end
end
 -- Used in "ThirdItem"
 weapons = {
     "weapon_sniperrifle",
     "weapon_pistol",
     "weapon_rpg",
     "weapon_knife",
     "weapon_combatmg"
 }
 function ThirdItem(menu)
     local gunsList = NativeUI.CreateListItem("Get Guns", weapons, 1)
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
    local submenu = _menuPool:AddSubMenu(menu, "~b~Sub Menu", "Test") 
    local carItem = NativeUI.CreateItem("Spawn car", "Spawn car in a submenu")
    carItem.Activated = function(sender, item)
         if item == carItem then
             spawnCar("adder", "comet", "cheether", "fagio")
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
     submenu:AddItem(carItem)
     submenu:AddItem(seat)
end 
                                 
-- this menu is a checkbox item FifthItem
function FifthItem(menu)
    local checkbox = NativeUI.CreateCheckboxItem("Save Menu", "Seves the Menu changes")
    menu:AddItem(checkbox)
    menu.OnCheckboxChange = function (sender, item, checked_)
       -- check if what changed is from this menu
       if item == checkbox then
        GetLocationChanged()
         --[[ Outputs what the checkbox state is ]]
        notify("~g~Sucess:", "Settings has been chaned")
       end
    end
end
function SeventhItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "~r~Delete", "Allows you to delete your car")
    menu.OnItemSelect = function (sender, item, checked_)
        if item == Delete then
                DeleteCurrentVehicle()
              notify("You've Selected this Item")
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
end
function EighthtItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Settings", "Access Settings")
    menu.OnItemSelect = function(sender, item, checkbox_)
        if item == Settings then
            showSettings()
            notify("Your in settings")
        end
    end
    local settings = NativeUI.CreateItem("Sertings", bool, "")
    submenu.OnCheckboxChange = function (sender, item, checked_)
    -- check if what changed is from this menu
    if item == checkbox then
      bool = checked_
      --[[ Outputs what the checkbox state is ]]
      notify(tostring(bool))
    end
 end
 submenu:AddItem(settings)
end
-- SexthItem
function SexthItem(menu) 
    local submenu = _menuPool:AddSubMenu(menu, "~g~About", "About this menu")
    menu.OnItemSelect = function (sender, item, checked_)
        if item == About then
            SetSatusAbout()
          notify("You've Selected this Item")
        end
    end
    local About = NativeUI.CreateItem("About", "This is a brand new menu made by ~b~Mackenzie_Rich, Will there be an version checker? No.") 
    submenu.OnItemSelect = function (sender, item, checked_)
       -- check if what changed is from this menu
       if item == checkbox then
        GetSelected()
        notify("About")
       end
    end
    local Version = NativeUI.CreateItem("Version", "~r~1.0.0")
    submenu.OnItemSelect = function(sender, item, index, checked_)
        if item == checkbox then
            GetVerion()
            notify("~g~No New Update")
        end
    end
    submenu:AddItem(About)
    submenu:AddItem(Version)
end

FirstItem(mainMenu)
SecondItem(mainMenu)
ThirdItem(mainMenu)
FourthItem(mainMenu)
FifthItem(mainMenu)
SexthItem(mainMenu)
SeventhItem(mainMenu)
EighthtItem(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        _menuPool:ProcessMenus()
        --[[ The "F1" button will activate the menu ]]
        if IsControlJustPressed(1, 288) then
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