local display = false

RegisterCommand("on", function()
    Citizen.CreateThread(function()
      TriggerEvent('nui:on', true)
    end)
 end)
  


  RegisterCommand("off", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:off", true)
    end)
  end)

  --[[ ////////////////////////////////////////// ]]

  RegisterNetEvent('nui:on')
  AddEventHandler('nui:on', function(value)
  AddEventHandler('nui:on', function(value) 
    SendNUIMessage({
      type = "ui",
      display = true
    })
  end)

  RegisterNetEvent('nui:off')
  AddEventHandler('nui:off', function(value)
  AddEventHandler('nui:off', function(value)    
    SendNUIMessage({
      type = "ui",
      display = false
    })
end)
                
  print("CRPMenu Made by Mackenzie_Rich & Desired (CRPMenu)")
