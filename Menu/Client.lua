print("\n^7Simple Menu Called (Canadian RP Menu) | ^6 Made By Mackenzie_Rich#2139^7") -- DO NOT REMOVE THIS

RegisterCommand("crp", function()
    msg("Canadian Menu Version:  1.9.6")
end, false)
-- We declare this 'msg' function on the bottom due to better practices.
function msg(text)
    -- TriggerEvent will send a chat message to the client in the prefix as red
    TriggerEvent("chatMessage",  "[Client]", {255,0,0}, text)
end