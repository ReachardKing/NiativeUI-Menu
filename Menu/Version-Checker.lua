-- print('CRPMenu Made by Mackenzie_Rich & Desired (CRPMenu)')
-- print('Version:1.7.6; @ Mackenzie_Rich, remeber to change this area too')

Citizen.CreateThread(function()
	local CurrentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
	if not CurrentVersion then
		print('^1CRP Menu (Canadian RP menu) Version Check Failed!^7')
	end

	function VersionCheckHTTPRequest()
		PerformHttpRequest('https://github.com/ReachardKing/NiativeUI-Menu/blob/main/Menu/Version-Checker.json', VersionCheck, 'GET')
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

	VersionCheckHTTPRequest()
end)

function PrintDebugMessage(msg,level)
	loglevel = (GetConvarInt("ea_logLevel", 1))
	if not level or not tonumber(level) then level = 3 end
	
	if level == 1 and loglevel >= level then -- ERROR Loglevel
		Citizen.Trace("^1"..GetCurrentResourceName().."^7: "..msg.."^7\n")
	elseif level == 2 and loglevel >= level then -- WARN Loglevel
		Citizen.Trace("^3"..GetCurrentResourceName().."^7: "..msg.."^7\n")
	elseif level == 3 and loglevel >= level then -- INFO Loglevel 
		Citizen.Trace("^0"..GetCurrentResourceName().."^7: "..msg.."^7\n")
	elseif level == 4 and loglevel >= level then -- DEV Loglevel
		Citizen.Trace("^7"..GetCurrentResourceName().."^7: "..msg.."^7\n")
	elseif level > 4 and loglevel >= level then -- anything above 4 shouldn't exist, but kept just in case
		Citizen.Trace("^5"..GetCurrentResourceName().."^7: "..msg.."^7\n")
	end
end

function GetVersion()
	local resourceName = GetCurrentResourceName()
	local version = GetResourceMetadata(resourceName, 'version', 0)
	local is_master = GetResourceMetadata(resourceName, 'is_master', 0) == "yes" or false
	return version, is_master
end
