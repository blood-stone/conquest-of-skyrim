Scriptname CS_WarMapHoldingSelectScript extends ObjectReference  

Keyword Property CS_StoryWarMapHoldingMenu Auto

Quest Property CS_WarMapHoldingMenu Auto

ObjectReference Property Holding Auto

Event OnActivate(ObjectReference akActivatorRef)
    
    GoToState("Block")
    if CS_WarMapHoldingMenu.IsRunning()
        CS_WarMapHoldingMenu.Stop()
    endif
    
    CS_StoryWarMapHoldingMenu.SendStoryEventAndWait(akRef1 = Holding)
    GoToState("Ready")
    
EndEvent

State Block
    
    Event OnActivate(ObjectReference akActivatorRef)
        
    EndEvent
    
EndState