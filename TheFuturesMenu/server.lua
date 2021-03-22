-- Add an event handler for the 'chatMessage' event
AddEventHandler( 'chatMessage', function( source, n, msg )  

    msg = string.upper( msg )
    
    -- Check to see if a client typed in /TheFuturesMenu
    if ( msg == "/TheFutures" or msg == "/TheFuturesMenu" ) then 
    
         --Cancel the chat message event (stop the server from posting the message)
        CancelEvent() 

         --Trigger the client event 
        TriggerClientEvent( 'TheFuturesMenu', source )
    end
end)

Register("Keys")
    Triggert(if IsControlJustReleased(inputGroup, control))
end