Scriptname CS_AttackCitySiegeAttach extends ReferenceAlias  

Event OnCellAttach()
    if GetOwningQuest().GetStage() < 10
        GetOwningQuest().SetStage(10)
    endif
EndEvent