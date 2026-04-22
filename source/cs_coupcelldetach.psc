Scriptname CS_CoupCellDetach extends ReferenceAlias  

Event OnCellDetach()
    if GetOwningQuest().GetStage() == 110
        GetOwningQuest().Stop()
    endif
EndEvent

Event OnCellAttach()
    if GetOwningQuest().GetStage() < 15
        (GetOwningQuest() as CS_CoupScript).CrowdChanting.ForceStart()
    endif
EndEvent