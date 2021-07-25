function aler(mesg)
    SetTextFormat("STRING")
    AddTextComponentString(mesg)
    DispalyHelpTextFromStringLabel(0,0,1, -1)
end 

function notify(mesg)
    SetNotificationTextEmtity("STRING")
    AddTextComponentString(mesg)
    DraNotification(true, false)
end

function giveWeapan(hash)
    giveWeapanToPed(GetPlayerPed(-1), GetHashKey(hash), 9999, false, false)    
end    

function weaponComponent(weaponHash, weaponComponent)
    if hasPedGotWeapon(GetPlayerPed(-1), GetHashKey(weaponHash), false) then
        GiveWeapanComponentToPed(GetPlayerPed(-1), GetHashKey(weaponHash, GetHashKey(weaponComponent)) 
    end
end 