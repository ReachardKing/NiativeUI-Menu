TheFuturesMenu = false
_menuPool = NativeUI.CreatePool()
MinMenu = NativeUI.CreateMenu("Main Menu", "~b~Menu The best UI Ever")
_menuPool:Add(MainMenu)

bool = false

//You must first stop a ped before arresting
 PoliceFunctions_API.Functions.Arrest.ArrestPed();
 // Make sure he  is standing, before arest           
PoliceFunctions_API.Functions.ArrestManager.GrabPed();
//Ungrab ped                       
PoliceFunctions_API.Functions.ArrestManager.UnDragPed();
 //jail ped                                 
PoliceFunctions_API.Functions.ArrestManager.JailPed();
 ///Release ped                      
PoliceFunctions_API.Functions.ArrestManager.ReleasePed();
 //Set ped into front seat                                  
PoliceFunctions_API.Functions.ArrestManager.SeatFrontPassenger();
//Setped into rearDriver
PoliceFunctions_API.Functions.ArrestManager.SeatRearDriver();
//Setpeed into rearpasssenger
PoliceFunctions_API.Functions.ArrestManager.SeatRearPassenger();
//CheckID                          
PoliceFunctions_API.Functions.PedManager.CheckID();
//GetID
PoliceFunctions_API.Functions.PedManager.GetID();
//Releaseped
PoliceFunctions_API.Functions.PedManager.ReleasePed();
//Stopped
PoliceFunctions_API.Functions.PedManager.StopPed();

//You must first stop a ped
PoliceFunctions_API.Functions.Tools.BreathalyzePed();
//Stop Vehicle
PoliceFunctions_API.Functions.VehicleManager.StopVehicle();
//Release Vehicle
PoliceFunctions_API.Functions.VehicleManager.ReleaseVehicle(); 
           
Screen.ShowNotification("Lol, Nice try");
Tick += async () =>
{
    menuPool.ProcessMenu();
if (API.ISControlJusrPreessed(0,176) and | _menuPool.IsAnyMenuOpen()) //our menu on/off switch
    mainMenu.Visible = !mainMenu.Visible;
    }
};

API.SetDiscordAppId("app-id-here"); //Go to https://discord.com/developers/applications > Create New Application > Copy the Client ID
            API.SetRichPresence("Playing blah blah blah put your text here");
            
            