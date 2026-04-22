Scriptname CS_GovMessagingStart extends ReferenceAlias  

Quest Property CS_FactionGovernmentFactionPlayerMessaging Auto

Event OnActivate(ObjectReference akActivatorRef)
    if akActivatorRef == Game.GetPlayer()
        CS_FactionGovernmentFactionPlayerMessaging.Stop()
        CS_FactionGovernmentFactionPlayerMessaging.Start()
    endif
EndEvent