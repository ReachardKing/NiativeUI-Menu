  RegisterServerEvent('announce')
AddEventHandler('announce', function(param)
  print('^7[^1Announcement^7]^5:'.. param)
  TriggerClientEvent('chatMessage', -1, '^7[^1Announcement^7]^2', {0,0,0} --[[ this table is just rgb ]], param)
end)


print("CRPMenu Made by Mackenzie_Rich & Desired (CRPMenu)")
