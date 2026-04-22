Scriptname CS_PlayerPrisonExteriorAttach extends ReferenceAlias  

Event OnCellAttach()
    (GetOwningQuest() as CS_PlayerPrisonScript).MoveToExteriorMarker()
EndEvent