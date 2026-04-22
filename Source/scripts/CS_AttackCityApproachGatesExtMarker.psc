Scriptname CS_AttackCityApproachGatesExtMarker extends ReferenceAlias  

State StopOnUnattach
    
    Event OnCellDetach()
        
        GoToState("Stopping")
        GetOwningQuest().SetStage(100)
        
    EndEvent
    
EndState