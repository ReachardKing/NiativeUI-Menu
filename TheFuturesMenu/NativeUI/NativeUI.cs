            API.RequestModel((uint)VehicleHash.Select Vehicle);
            while (!API.HasModelLoaded((uint)VehicleHash.Select Vehicle))
            {
                await BaseScript.Delay(100);
            }
            int Select Vehicle = API.CreateVehicle((uint)VehicleHash.Select Vehicle, X Coordinatef, Y Coordinatef, Z Coordinatef, Headingf, true, true);
            
            API.AddBlipForCoord(X Coordinatef, Y Coordinatef, Z Coordinatef);
            Game.Player.Character.Weapons.Give(WeaponHash.Select Weapon, 999, false, true);
            
            
            if (API.IsControlJustPressed(0, 176)) //THIS IS THE Delet KEY. See HELP > FiveM Documents > Controls (ONLY REPLACE THE 176)
            {
                //CODE GOES HERE
            }

            Screen.DisplayHelpTextThisFrame("https://discord.gg/mGSwEBMndJE");
            
            
            API.DrawMarker(1, X Coordinatef,Y Coordinatef, Z Coordinatef, 0.0f, 0.0f, 0.0f, 0.0f, 180.0f, 0.0f, 1.0f, 1.0f, 1.0f, 65, 150, 245, 100, false, true, 2, false, null, null, false);
            
            
            API.AddBlipForCoord(X Coordinatef, Y Coordinatef, Z Coordinatef);
            
            
            Game.Player.Character.CurrentVehicle.Wash();
            
            
            CitizenFX.Core.Debug.WriteLine("Join the Discord");
            
            //BEGIN WATERMARK
            API.SetTextScale(0.3f, 0.3f);
            API.SetTextFont(0);
            API.SetTextProportional(true);
            API.SetTextColour((int)byte.MaxValue, (int)byte.MaxValue, (int)byte.MaxValue, (int)byte.MaxValue);
            API.SetTextOutline();
            API.SetTextEntry("STRING");
            API.AddTextComponentString("https://discord.gg/mGSwEBMndJE");
            API.DrawText(0.0f, 0.0f);
            //END WATERMARK