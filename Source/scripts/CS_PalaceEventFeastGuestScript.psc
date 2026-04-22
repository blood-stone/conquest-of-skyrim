Scriptname CS_PalaceEventFeastGuestScript extends ReferenceAlias  

ReferenceAlias Property PalaceEntranceMarker Auto

State MoveToSpawn
    
    Event OnUpdate()
        
        if !GetActorRef().IsNearPlayer()
            GetActorRef().MoveTo(PalaceEntranceMarker.GetRef())
        endif
        
    EndEvent
    
EndState