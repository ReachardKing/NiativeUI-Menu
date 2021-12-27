-- print('CRPMenu Made by Mackenzie_Rich & Desired (CRPMenu)')
-- print('Version:1.7.6; @ Mackenzie_Rich, remeber to change this area too')

Citizen.CreateThread(function()
	local CurrentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
	if not CurrentVersion then
		print('^1CRP Menu (Canadian RP menu) Version Check Failed!^7')
	end

	function VersionCheckHTTPRequest()
		PerformHttpRequest('https://github.com/ReachardKing/NiativeUI-Menu/blob/main/Menu/Version-Checker.lua', VersionCheck, 'GET')
	end

	function VersionCheck(err, response, headers)
		Citizen.Wait(3000)
		if err == 200 then
			local Data = json.decode(response)
			if CurrentVersion ~= Data.NewestVersion then
				print( label )			
				print('  ||    \n  ||    CRP Menu (Canadian RP menu) is outdated!')
				print('  ||    Current version: ^2' .. Data.NewestVersion .. '^7')
				print('  ||    Your version: ^1' .. CurrentVersion .. '^7')
				print('  ||    Please download the lastest version from ^5' .. Data.DownloadLocation .. '^7')
				if Data.Changes ~= '' then
					print('  ||    \n  ||    ^5Changes: ^7' .. Data.Changes .. "\n^0  \\\\\n")
				end
			else
				print( label )			
				print('  ||    ^2CRP Menu (Canadian RP menu) is up to date!\n^0  ||\n  \\\\\n')
			end
		else
			print( label )			
			print('  ||    ^1There was an error getting the latest version information.\n^0  ||\n  \\\\\n')
		end
		
		SetTimeout(60000000, VersionCheckHTTPRequest)
	end

	VersionCheckHTTPRequest('https://raw.githubusercontent.com"', VersionCheck, 'GET')
end)

function GetVersion()
	local resourceName = GetCurrentResourceName()
	local version = GetResourceMetadata(resourceName, 'version', 0)
	local is_master = GetResourceMetadata(resourceName, 'is_master', 0) == "yes" or false
	return version, is_master
end
