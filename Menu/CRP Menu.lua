--1:05 PM 2021-06-27
--[[
    Canaidain Role Play, also known as CRP
    Current version find it in game

    No Support

    Have fun if you know whatt you are doing
]]


_menuPool = NativeUI.CreatePool()	
mainMenu = NativeUI.CreateMenu("CRP Menu", "~b~Were Canadian's do it Right")
_menuPool:Add(mainMenu)

-- Used in "FirstMenu"
bool = false

function FirstItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Police Options →→→", "Acess Police Options")
end

function SecondItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Add-On [Vehicles] Options →→→", "Add-On [Vehicles] Options")
    local Pounder = NativeUI.CreateItem("Pounder", "spawns  Pounder")
    submenu.OnItemSelect = function(sender, item, index)
        if item == Pounder then
            spawnCar('Pounder')
            notify('Vehicle spawned')
        end
    end
    submenu:AddItem(Pounder)
end
-- Used in "ThirdItem"

weapons = {
    "weapon_combatpistol",
    "weapon_flashlight",
    "weapon_stungun",
    "weapon_assultsmg",
    "weapon_pistol_mk2"
}

function ThirdItem(menu)
   local gunsList = NativeUI.CreateListItem("Get Guns →→→", weapons, 1)
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
   local submenu = _menuPool:AddSubMenu(menu, "~b~Vehicle Options →→→", "Acess Vehicle Options") 
   local carItem = NativeUI.CreateItem("Spawn car", "Spawn car in a submenu")
   carItem.Activated = function(sender, item, index)
       if item == carItem then
           spawnCar("police")
           notify("spawned in a Police car")
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
   local Radar = NativeUI.CreateItem("Radar", "Open CRP Radar")
   submenu.OnItemSelect = function(sender, item, index)
       if item == Radar then
           TriggerEvent( 'wk:radarRC' )
           notify("~g~You were able to open our Radar")
       end
   end 
   submenu:AddItem(carItem)
   submenu:AddItem(seat)
   submenu:AddItem(Radar)
end 
                                
--this menu is a checkbox item FifthItem
function FifthItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Open Area →→→", "Opens ouside resources")
    local PoliceArmory =  NativeUI.CreateItem("PoliceArmory", "Select to open")
    submenu.OnItemSelect = function(sender, item, index)
    if item == PoliceArmory then
        TriggerEvent('PoliceArmory')
        notify("~g~You were able to open PoliceArmory")
        end
    end
    local Custome = NativeUI.CreateItem("Custome car spawner", "open Custome car spawner")
    submenu.OnItemSelect = function(sender, item, index)
        if item == Custome then
            TriggerEvent('customspawner')
            notify("~g~You were able to open Custome car spawner")
        end
    end
    local FireFighter = NativeUI.CreateItem("FireFighter", "Open's FFMenu")
    submenu.OnItemSelect = function(sender, item, index)
        if item == FireFighter then
            TriggerEvent('FFMenu')
            notify("~g~Sucessful")
        end
    end
    submenu:AddItem(PoliceArmory)
    submenu:AddItem(Custome)
    submenu:AddItem(FireFighter)
end

function SeventhItem(menu)
   local submenu = _menuPool:AddSubMenu(menu, "~r~Delete →→→", "Allows you to delete your car")
   local Delete = NativeUI.CreateItem("~r~Delete", "This will delete any vehicle for good, Are you Sure?") 
   submenu.OnItemSelect  = function (sender, item, index)
       -- check if what changed is from this menu
       if item == Delete then
        deleteVeh()
        notify("~g~You have successful Deleted your Vehicle")
       end  
    end
   local Cancel = NativeUI.CreateItem("Cancel", "No, i do not want my vehicle deleted")
   submenu.OnItemSelect = function(sender, item)
       if item == Cancel then
               mainMenu:GoBack()
               notify("~g~Your selection was successful")
           end
       end
       submenu:AddItem(Delete)
       submenu:AddItem(Cancel)
end

function EighthtItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Settings →→→", "Access CRP  Settings")
    local checkbox = NativeUI.CreateCheckboxItem("Save Changes ", bool, "Saves Currently made Changes")
    menu.OnCheckboxChange = function (sender, item, checked_)
       -- check if what changed is from this menu
       if item == checkbox then
         bool = checked_
         --[[ Outputs what the checkbox state is ]]
         notify(tostring(bool))
       end
    end
    local Deleteped = NativeUI.CreateCheckboxItem("Delete Ped",  bool, "Select if you want nearby peds to be deleted")
    submenu.OnCheckboxChange = function(sender, item, checked_)
        if item == Deleteped then
            bool = checked_
            notify(tostring(bool))
        end
    end
    local DeleteOccupentVehicles = NativeUI.CreateCheckboxItem("Delete Occupent Vehicles", bool,  "Delete Occupent Vehicles")
    submenu.OnCheckboxChange = function(sender, item, checked_)
        if item == DeleteOccupentVehicles then 
            bool = checked_
            notify(tostring(bool))
        end
    end
    local DeleteEmptyVehicles = NativeUI.CreateCheckboxItem("Delete Empty Vehicles", bool,  "Delete Empty Vehicles")
    submenu.OnCheckboxChange = function(sender, item, checked_)
        if item == DeleteEmptyVehicles then 
            bool = checked_
            notify(tostring(bool))
        end
    end
    local DeletePoliceVehicles = NativeUI.CreateCheckboxItem("Delete Police Vehicles",  bool, "Delete Police Vehicles")
    submenu.OnCheckboxChange = function(sender, item, checked_)
        if item == DeletePoliceVehicles then 
            bool = checked_
            notify(tostring(bool))
        end
    end
    local DeletePersistentVehicles = NativeUI.CreateCheckboxItem("Delete Persistent Vehicles",  bool,  "Delete Persistent Vehicles")
    submenu.OnCheckboxChange = function(sender, item, checked_)
        if item == DeletePersistentVehicles then 
            bool = checked_
            notify(tostring(bool))
        end
    end
    local DeleteExemptVehicles = NativeUI.CreateCheckboxItem("Delete Exempt Vehicles",  bool, "Delete Exempt Vehicles")
    submenu.OnCheckboxChange = function(sender, item, checked_)
        if item == DeleteExemptVehicles then 
            bool = checked_
            notify(tostring(bool))
        end
    end
    local DeletePersistenteped = NativeUI.CreateCheckboxItem("Delete Persistente Ped",  bool, "Delete Persistente Ped")
    submenu.OnCheckboxChange = function(sender, item, checked_)
        if item == DeletePersistenteped then 
            bool = checked_
            notify(tostring(bool))
        end
    end
    local DeleteLivingpeds = NativeUI.CreateCheckboxItem("Delete Living Peds", bool,  "Delete Living Peds")
    submenu.OnCheckboxChange = function(sender, item, checked_)
        if item == DeleteLivingpeds then 
            bool = checked_
            notify(tostring(bool))
        end
    end
    local confirm = NativeUI.CreateItem("confirm", "Confirns selection or selections")
    submenu.OnItemSelect = function(sender, item)
        if item == confirm then 
           
            notify("~g~Your selection as been aplpied")
        end
    end
    local Close = NativeUI.CreateItem("Clse Menu", "Closes this Menu")  
    submenu.OnItemSelect = function(sender, item)  
        if item == Close then
            mainMenu:CloseAllMenus()
            notify("Menu has been closed")
        end
    end
   submenu:AddItem(checkbox)
   submenu:AddItem(Deleteped)
   submenu:AddItem(DeleteEmptyVehicles)
   submenu:AddItem(DeleteOccupentVehicles)
   submenu:AddItem(DeletePersistentVehicles)
   submenu:AddItem(DeleteExemptVehicles)
   submenu:AddItem(DeletePersistenteped)
   submenu:AddItem(DeleteLivingpeds)
   submenu:AddItem(confirm)
   submenu:AddItem(Close)
  
end

-- SexthItem
function SexthItem(menu) 
   local submenu = _menuPool:AddSubMenu(menu, "~g~About →→→", "About CRP menu")
   local About = NativeUI.CreateItem("About", "This is a brand new menu made by ~b~Mackenzie_Rich") 
   submenu.OnItemSelect = function (sender, item)
      -- check if what changed is from this menu
      if item == About then
           GetSelected()
           notify("About")
       end
   end
   local Version = NativeUI.CreateItem("CRP Version", "~r~1.7.6")
   submenu.OnItemSelect = function(sender, item)
       if item == click then
           GetVerion('CRP version')
           notify("~g~No New Update")
       end
   end
   submenu:AddItem(About)
   submenu:AddItem(Version)
end

FirstItem(mainMenu)
SecondItem(mainMenu)
FourthItem(mainMenu)
ThirdItem(mainMenu)
FifthItem(mainMenu)
SexthItem(mainMenu)
SeventhItem(mainMenu)
EighthtItem(mainMenu)
_menuPool:RefreshIndex()

RegisterCommand('CRPMenu', function() -- edit this line to change the command to open the menu
    mainMenu:Visible(not mainMenu:Visible())
end, false)

-- Keys to open menu
Citizen.CreateThread(function()
   
   while true do
       Citizen.Wait(2)
       _menuPool:ProcessMenus()
       --[[ The "F1" button will activate the menu ]]
       if IsControlJustPressed(1, 288) and IsControlJustPressed(1, 288) then
        ExecuteCommand('CRPMenu')
        DisplayHelpText("~b~Press ~INPUT_REPLAY_START_STOP_RECORDING~ to open  ~w~ The Menu")
       end
   end 
end)

_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);
