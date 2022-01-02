config = {}


--This is how the version check will be displayed in the server console
--Full = 0 [Default] | Simple = 1 | Disabled = 2
Config.VersionChecker = 0

--This is how you open the menu either via a command or button
--Button = 0 [Default]  |  Command = 1
Config.OpenMenu = 0

--This is the button that will open the menu (If chosen at Config.OpenMenu)
--Default = 244 [M]  |  To change the button check out https://docs.fivem.net/game-references/controls/
--Controller Support for this resource is DISABLED!
Config.MenuButton = 168

--This is the command that will open the menu (If chosen at Config.OpenMenu)
Config.Command = 'CRPMenu'

--This is the width of the menu when open
--Default = 80
Config.MenuWidth = 80

--This is the position of the menu when open
--Left = 0 [Default]  |  Right = 1
Config.MenuOrientation = 0

--This is the title of the menu dispalyed
Default       = The default title of the menu is 'Interaction Menu'
layer Name   = This is the name of the player
Custom        = This is a custom title set by you at Config.MenuTitleCustom
--Default = 0 [Default]  |  Player Name = 1  |  Custom = 2
Config.MenuTitle = 0

--This is the custom title you can set for the menu (If chosen at Config.MenuTitle)
Config.MenuTitleCustom = ''



--[[
    Function that register menu name source and custome name
    -- MainMenu = NativeUI.CreateMenu(MenuTitle, GetResourceMetadata(GetCurrentResourceName(), 'title', 0) .. ' ~y~' .. GetResourceMetadata(GetCurrentResourceName(), 'version', 0))
]]
--    local test = NativeUI.CreateItem("OnScreenKeyBoard", "Displays OnscreenKeyboard")
--    submenu.OnItemSelected = function(sender, item, index) 
--     if item == test then
--         DisplayOnscreenKeyboard(1, "", "", "Stright Forword", "", "", "", 1000)
--         while (UpdateOnscreenKeyboard() == 0) do
--             DisableAllControlActions(0);
--             Wait(0);
--             notify("Nice try, this is just a test")
--         end
--     end
--]]