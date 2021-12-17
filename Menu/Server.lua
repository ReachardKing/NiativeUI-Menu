print('CRPMenu Made by Mackenzie_Rich & Desired (CRPMenu)')
--if you can do it without the cutome stuff, just let me know, or work on it here and send it to me
local versionCheckEnabled = true

Citizen.CreateThread( function()
	if versionCheckEnabled then 
		local vFile = LoadResourceFile(GetCurrentResourceName(), "version.json")
		local currentVersion = json.decode(vFile).version
		local updatePath = "/eurofra1d/CRPMenu"
		local resourceName = "CRPMenu ("..GetCurrentResourceName()..")"
		function checkVersion(err,response, headers)
			if err == 200 then
				local data = json.decode(response)
				
				if currentVersion ~= data.version and tonumber(currentVersion) < tonumber(data.version) then
					print("\n--------------------------------------------------------------------------")
					print("\n"..resourceName.." is outdated.\nCurrent Version: "..data.version.."\nYour Version: "..currentVersion.."\nPlease update it from https://github.com"..updatePath.."")
					print("\nUpdate Changelog:\n"..data.changelog)
					print("\n--------------------------------------------------------------------------")
				elseif tonumber(currentVersion) > tonumber(data.version) then
					print("Your version of "..resourceName.." seems to be higher than the current version.")
				else
					print(resourceName.." is up to date!")
				end
			else
			print("CRPMenu Version Check failed!")
			end
			
			local nativeuitest = LoadResourceFile("NativeUI", "__resource.lua")
			
			if not nativeuitest then
				print("\n--------------------------------------------------------------------------")
				print("\nNativeUI is not installed on this Server, this means that CRPMenu will not work *at all*, please download and install it from:")
				print("\nhttps://github.com/ReachardKing/NiativeUI-Menu/tree/main/Menu")
				print("\n--------------------------------------------------------------------------")
			else
				StartResource("NativeUI")
			end
        end
end)

