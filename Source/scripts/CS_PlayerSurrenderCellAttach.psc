Scriptname CS_PlayerSurrenderCellAttach extends ReferenceAlias  

Event OnCellAttach()
    GetOwningQuest().SetStage(100)
EndEvent