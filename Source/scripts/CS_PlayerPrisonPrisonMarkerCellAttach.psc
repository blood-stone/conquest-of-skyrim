Scriptname CS_PlayerPrisonPrisonMarkerCellAttach extends ReferenceAlias  

Event OnCellAttach()
    if GetOwningQuest().GetStage() == 15
        (GetOwningQuest() as CS_PlayerPrisonScript).ReturnToPrison()
    endif
EndEvent