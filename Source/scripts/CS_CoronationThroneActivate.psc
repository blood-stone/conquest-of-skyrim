Scriptname CS_CoronationThroneActivate extends ReferenceAlias  

Event OnActivate(ObjectReference akActivatorRef)
    if GetOwningQuest().GetStage() == 25
        GetOwningQuest().SetStage(30)
    endif
EndEvent