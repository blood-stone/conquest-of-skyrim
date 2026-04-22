Scriptname CS_TroopScript extends Actor  

Faction Property CS_RetreatFaction Auto

Event OnDying(Actor akKiller)
    if IsDead()
        GoToState("Dead")
        RegisterForSingleUpdate(20)
    endif
EndEvent

State Retreat
    
    Event OnUpdate()
        AddToFaction(CS_RetreatFaction)
        EvaluatePackage()
        StopCombat()
    EndEvent
    
    Event OnCellDetach()
        disable()
        delete()
    EndEvent
    ;/
    Event OnDetachedFromCell()
        disable()
        delete()
    EndEvent
    /;
EndState

State Dead
    
    Event OnUpdate()
        disable()
        delete()        
    EndEvent
    
    Event OnCellDetach()
        disable()
        delete()
    EndEvent
    
EndState