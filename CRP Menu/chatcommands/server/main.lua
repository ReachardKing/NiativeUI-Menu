
-- function getIdentity(source)
	-- local identifier = GetPlayerIdentifiers(source)[1]
	-- local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	-- if result[1] ~= nil then
		-- local identity = result[1]

		-- return {
			-- identifier = identity['identifier'],
			-- firstname = identity['firstname'],
			-- lastname = identity['lastname'],
			-- dateofbirth = identity['dateofbirth'],
			-- sex = identity['sex'],
			-- height = identity['height']
		-- }
	-- else
		-- return nil
	-- end
-- end

  AddEventHandler('chatMessage', function(source, name, message)
      if string.sub(message, 1, string.len("/")) ~= "/" then
          local name = GetPlayerName(source)
		TriggerClientEvent("sendProximityMessage", -1, source, name, message)
      end
      CancelEvent()
  end)

  RegisterCommand('me', function(source, args, raw)
      local name = GetPlayerName(source)
      TriggerClientEvent("sendProximityMessageMe", -1, source, name, table.concat(args, " "))
  end)

  RegisterCommand('do', function(source, args, raw)
      local name = GetPlayerName(source)
      TriggerClientEvent("sendProximityMessageDo", -1, source, name, table.concat(args, " "))
  end)

  RegisterCommand('twt', function(source, args, raw)
  	TriggerClientEvent('chatMessage', -1, "^0[^4Twitter^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end)

  RegisterCommand('ooc', function(source, args, raw)
  	TriggerClientEvent('chatMessage', -1, "OOC | " .. GetPlayerName(source), {128, 128, 128}, table.concat(args, " "))
  end)
   
   RegisterCommand('darkweb', function(source, args, raw)
  	TriggerClientEvent('chatMessage', -1, "^0[^6Darkweb^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end)

  RegisterCommand('news', function(source, args, raw)
  	TriggerClientEvent('chatMessage', -1, "^0[^2Weazel_News^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end) 
  
     RegisterCommand('wanted', function(source, args, raw)
  	TriggerClientEvent('chatMessage', -1, "^0[^5Wanted^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end)
  
     RegisterCommand('darkweb', function(source, args, raw)
  	TriggerClientEvent('chatMessage', -1, "^0[^2Darkweb^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end)
  
     RegisterCommand('warning', function(source, args, raw)
  	TriggerClientEvent('chatMessage', -1, "^0[^3Warning^0] (^5@" .. GetPlayerName(source) .. "^0)", {30, 144, 255}, table.concat(args, " "))
  end)
  
function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
