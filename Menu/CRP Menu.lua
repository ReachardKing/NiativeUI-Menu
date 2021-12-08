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
    local Insurgent = NativeUI.CreateItem("Insurgent", " spawns Insurgent")
    submenu.Activated = function(sender, item, index)
        if item == Insurgent then
            spawnCar('Insurgent')
            notify('Vehicle spawned')
        end
    end
    local Insurgent2 = NativeUI.CreateItem("Insurgent2", "spawns  Insurgent2")
    submenu.Activated = function(sender, item, index)
        if item == Insurgent2 then
            spawnCar('Insurgent2')
            notify('Vehicle spawned')
        end
    end
    local  Insurgent3 = NativeUI.CreateItem("Insurgent3", "spawns  Insurgent3")
    submenu.Activated = function(sender, item, index)
        if item == Insurgent3 then
            spawnCar('Insurgent3')
            notify('Vehicle spawned')
        end
    end
    local Luxor = NativeUI.CreateItem("Luxor", "spawns Luxor")
    submenu.Activated = function(sender, item, index)
        if item == Luxor then
            spawnCar('Luxor')
            notify('Vehicle spawned')
        end
    end
    local Windsor2 = NativeUI.CreateItem("Windsor2", "spawns Windsor2")
    submenu.Activated = function(sender, item, index)
        if item == Windsor2s then
            spawnCar('Windsor2')
            notify('Vehicle spawned')
        end
    end
    local Pounder = NativeUI.CreateItem("Pounder", "spawns  Pounder")
    submenu.Activated = function(sender, item, index)
        if item == Pounder then
            spawnCar('Pounder')
            notify('Vehicle spawned')
        end
    end
    submenu:AddItem(Insurgent)
    submenu:AddItem(Insurgent2)
    submenu:AddItem(Insurgent3)
    submenu:AddItem(Luxor)
    submenu:AddItem(Windsor2)
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
   submenu.OnItemSelect = function(sender, item, index, checked_)
       if item == Radar then
           TriggerEvent( 'wk:radarRC' )
           notify("~g~You were able to open our Radar")
       end
   end 
--    local test = NativeUI.CreateItem("test", "")
--    submenu.OnItemSelect = function(sender, item, index) 
--     if item == test then
--         DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 90)
--         while (UpdateOnscreenKeyboard() == 0) do
--             DisableAllControlActions(0);
--             Wait(0);
--             notify("Nice try, this is just a test")
--         end
--         if (GetOnscreenKeyboardResult()) then
--             local test = GetOnscreenKeyboardResult() 
--             set:RightLabel(test)  
--             SetVehicleNumbertestText(veh, test)
--             ShowNotification("~g~License test change to "..test)
--         end
--     end
   submenu:AddItem(carItem)
   submenu:AddItem(seat)
   submenu:AddItem(Radar)
--    submenu:AddItem(test)
end 
                                
--this menu is a checkbox item FifthItem
function FifthItem(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Open Area →→→", "Opens ouside resources")
    local PoliceArmory =  NativeUI.CreateItem("PoliceArmory", "Select to open")
    submenu.OnItemSelect = function(sender, item)
    if item == PoliceArmory then
        TriggerEvent('PoliceArmory')
        notify("~g~You were able to open PoliceArmory")
        end
    end
    local PoilceFunctions = NativeUI.CreateItem("PoilceFunctions")
    submenu.OnItemSelect = function(sender, item)
        if item == PoilceFunctions then 
            TriggerEvent('PoliceFunction')
            notify("Police Functions is opened")
        end
    end
    local Custome = NativeUI.CreateItem("Custome car spawner", "open Custome car spawner")
    submenu.OnItemSelect = function(sender, item)
        if item == Custome then
            TriggerEvent('customspawner')
            notify("~g~You were able to open Custome car spawner")
        end
    end
    local Menu = NativeUI.CreateItem("FireFighter", "Open's FFMenu")
    submenu.OnItemSelect = function(sender, item)
        if item == Menu then
            TriggerEvent('FFMenu')
            notify("~g~Sucessful")
        end
    end
    submenu:AddItem(PoliceArmory)
    submenu:AddItem(PoilceFunctions)
    submenu:AddItem(Custome)
    submenu:AddItem(Menu)
end

function SeventhItem(menu)
   local submenu = _menuPool:AddSubMenu(menu, "~r~Delete →→→", "Allows you to delete your car")
   local Delete = NativeUI.CreateItem("~r~Delete", "This will delete any vehicle for good, Are you Sure?") 
   submenu.OnItemSelect = function (sender, item, index)
       -- check if what changed is from this menu
       if item == Delete then
        deleteVeh()
        notify("~g~You have successful Deleted your Vehicle")
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
            mainMenu:CloseAllMenus()
            notify("Menu has been closed")
        end
    end
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
   local Version = NativeUI.CreateItem("CRP Version", "~r~1.7.6")
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

function notify(text)
   SetNotificationTextEntry("STRING")
   AddTextComponentString(text)
   DrawNotification(true, true)
end

--CloseAllMenus
function MenuPool:CloseAllMenus()
	for _, Menu in pairs(self.Menus) do
		if Menu:Visible() then
			Menu:Visible(false)
			Menu.OnMenuClosed(Menu)
		end
	end
end

-- Shows a notification on the player's screen 
function ShowNotification( text )
   SetNotificationTextEntry( "STRING" )
   AddTextComponentString( text )
   DrawNotification( false, false )
end

function deleteVeh()
    local ped = GetPlayerPed(-1)
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        local pos = GetEntityCoords(ped)

		if (IsPedSittingInAnyVehicle(ped)) then 
			local handle = GetVehiclePedIsIn(ped, false)
			NetworkRequestControlOfEntity(handle)
			SetEntityHealth(handle, 100)
			SetEntityAsMissionEntity(handle, true, true)
			SetEntityAsNoLongerNeeded(handle)
			DeleteEntity(handle)
            ShowInfo("The vehicle you were in has been deleted.")
        end
    end
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
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
