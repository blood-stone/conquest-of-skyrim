Scriptname CS_NegotiationHostAttach extends ReferenceAlias  

Event OnCellAttach()
    if GetOwningQuest().GetStage() == 5
        GetOwningQuest().SetStage(10)
    endif
EndEvent

Event OnActivate(ObjectReference akActivatorRef)
    if GetOwningQuest().GetStage() == 10 && akActivatorRef == Game.GetPlayer()
        GetOwningQuest().SetStage(20)
    endif
EndEvent