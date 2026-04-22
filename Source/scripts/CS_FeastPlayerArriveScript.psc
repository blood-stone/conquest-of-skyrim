Scriptname CS_FeastPlayerArriveScript extends ReferenceAlias  

Event OnCellAttach()
    if GetOwningQuest().GetStage() == 0
        GetOwningQuest().SetStage(10)
    endif
EndEvent