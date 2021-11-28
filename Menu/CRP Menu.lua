--1:05 PM 2021-06-27
--[[
    Canaidain Role Play, also known as CRP
    Current version find it in game

    No Support

    Have fun if you know whatt you are doing
 

local MenuOri = 0
if Config.MenuOrientation == 0 then
    MenuOri = 0
elseif Config.MenuOrientation == 1 then
    MenuOri = 1320
else
    MenuOri = 0
end
elText.Position = new Point(420 + Offset.X, y + 148 + Offset.Y);
]]

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("CRP Menu", "~b~Were Canadian's do it Right")
_menuPool:Add(mainMenu)

-- Used in "FirstMenu"
bool = false

-- this menu is a checkbox item
function FirstItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Police Options →→→", "Acess Police Options")
    local cuff = NativeUI.createItem("Cuff", "Cuff\'s player")
   submenu.OnItemSelect = function(sender, item, index, checked_)
        if item =  cuff then
            
            notify("~g~You have been cuffed")
            end
        end
     submenu:AddItem(cuff)
end
 
--[[function SecondItem(menu) 
    local submenu = _menuPool:AddSubmenu("Spawn Random car", "Spwans Random car:90Max")
end]]

-- Used in "ThirdItem"
weapons = {
    "weapon_combatpistol",
    "weapon_flashlight",
    "weapon_stungun",
    "weapon_assultsmg",
    "weapon_pistol_mk2"
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
   local submenu = _menuPool:AddSubMenu(menu, "~b~Vehicle Options →→→", "Acess Vehicle Options") 
   local carItem = NativeUI.CreateItem("Spawn car", "Spawn car in a submenu")
   carItem.Activated = function(sender, item)
       if item == carItem then
           spawnCar("police")
           notify("spawned in an" ..Selected)
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
   submenu.OnItemSelect = function(sender, item, index, checked_)
       if item == Radar then
           TriggerEvent( 'wk:radarRC' )
           notify("~g~You were able to open our Radar")
       end
   end  
 
   submenu:AddItem(carItem)
   submenu:AddItem(seat)
   submenu:AddItem(Radar)
end 
                                
--[[this menu is a checkbox item FifthItem
function FifthItem(menu)
end]]

function SeventhItem(menu)
   local submenu = _menuPool:AddSubMenu(menu, "~r~Delete →→→", "Allows you to delete your car")
   local Delete = NativeUI.CreateItem("~r~Delete", "This will delete any vehicle for good, Are you Sure?") 
   submenu.OnItemSelect = function (sender, item, index, checked_)
       -- check if what changed is from this menu
       if item == Delete then
        DeletEntity(Vehicle)
        notify("~g~Your selection was successful")
       end  
    end
   local Cancel = NativeUI.CreateItem("Cancel", "No, i do not want my vehicle deleted")
   submenu.OnItemSelect = function(sender, item, checked_)
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
    local ON = NativeUI.CreateItem("ON", "ON CRP nui-Pop-up")   
    submenu.OnItemSelect = function(sender, item, checked_)
    if item == ON then 
        TriggerEvent('')    
        notify("~g~You have Activated the nui pop-up")  
    end
    end
    local OFF = NativeUI.CreateItem("OFF", "OFF CRP nui-Pop-up")   
    submenu.OnItemSelect = function(sender, item, checked_)
        if item == OFF then 
            TriggerEvent('')    
            notify("~g~You have Deactivated the nui pop-up")  
        end
    end
    local Align = NativeUI.CreateItem("Right Align", "Moes the menu to the Right")
    submenu.OnItemSelect = function(sender, item, checked_)
        if item == Align then 
            menu:SetMenuWidthOffset(Config.MenuWidth)
            notify("Sucessful")
        end
    end
    local checkbox = NativeUI.CreateCheckboxItem("Save Changes ", bool, "Saves Currently made Changes")
    menu.OnCheckboxChange = function (sender, item)
       -- check if what changed is from this menu
       if item == checkbox then
         bool = checked_
         --[[ Outputs what the checkbox state is ]]
         notify(tostring(bool))
       end
    end
    local Close = NativeUI.CreateItem("Clse Menu", "Closes this Menu")  
    submenu.OnItemSelect = function(sender, item, index, checked_)  
        if item == Close then
            mainMenu:Visible(not mainMenu:Visible())
            notify("Menu has been closed")
        end
    end
   submenu:AddItem(ON)
   submenu:AddItem(OFF)
   submenu:AddItem(Align)
   submenu:AddItem(checkbox)
   submenu:AddItem(Close)
  
end

-- SexthItem
function SexthItem(menu) 
   local submenu = _menuPool:AddSubMenu(menu, "~g~About →→→", "About CRP menu")
   local About = NativeUI.CreateItem("About", "This is a brand new menu made by ~b~Mackenzie_Rich") 
   submenu.OnItemSelect = function (sender, item, checked_)
      -- check if what changed is from this menu
      if item == About then
           GetSelected()
           notify("About")
       end
   end
   local Version = NativeUI.CreateItem("CRP Version", "~r~1.7.1")
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
--SecondItem(mainMenu)
FourthItem(mainMenu)
ThirdItem(mainMenu)
--FifthItem(mainMenu)
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
       --[[ The "F5" button will activate the menu ]]
       if IsControlJustPressed(1, 166) and IsControlJustPressed(1, 166) then
            ExecuteCommand('CRPMenu')
       end
   end
end)

_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

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
