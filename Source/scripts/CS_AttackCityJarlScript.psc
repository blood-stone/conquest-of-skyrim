Scriptname CS_AttackCityJarlScript extends ReferenceAlias  

Event OnEnterBleedout()
    TryToStopCombat()
    if GetOwningQuest().GetStage() < 30
        GetOwningQuest().SetStage(30)
    endif
EndEvent

Event OnCellAttach()
    if GetOwningQuest().GetStage() == 20
        GetActorRef().SetCrimeFaction(None)
        GetOwningQuest().SetStage(21)
    endif
EndEvent