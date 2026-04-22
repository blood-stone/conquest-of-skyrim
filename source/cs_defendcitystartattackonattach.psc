Scriptname CS_DefendCityStartAttackOnAttach extends ReferenceAlias  

Event OnCellAttach()
    if GetOwningQuest().GetStage() == 0
        GetOwningQuest().SetStage(5)
    endif
EndEvent