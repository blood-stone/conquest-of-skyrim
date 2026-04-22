Scriptname CS_FactionWarTroopScript extends Actor  

ReferenceAlias Property NameChanger Auto

Event OnLoad()
    
    NameChanger.ForceRefTo(self as Actor)
    
EndEvent

Event OnDying(Actor akKiller)
    GoToState("Dead")
EndEvent

State Dead
    
    Event OnCellDetach()
        delete()
    EndEvent
    
EndState