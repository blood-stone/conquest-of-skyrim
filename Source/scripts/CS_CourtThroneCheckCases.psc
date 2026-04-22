Scriptname CS_CourtThroneCheckCases extends ReferenceAlias  

Event OnCellAttach()
    debug.trace("Throne attached")
    (GetOwningQuest() as CS_CourtScript).RegisterForKneeling()
    (GetOwningQuest() as CS_CourtScript).CheckCases(self)
EndEvent

Event OnActivate(ObjectReference akActivatorRef)
    if (akActivatorRef as Actor).GetSitState() == 0 || (akActivatorRef as Actor).GetSitState() == 2
        (GetOwningQuest() as CS_CourtScript).RegisterForSingleUpdate(2)
    endif
EndEvent