Scriptname CS_JailBedScript extends ReferenceAlias  

Event OnActivate(ObjectReference akActivatorRef)
    if GetOwningQuest().GetStage() == 0 && !(GetOwningQuest() as CS_PlayerPrisonScript).PlayerSleeping
        (GetOwningQuest() as CS_PlayerPrisonScript).SkipToTrial()
    elseif GetOwningQuest().GetStage() == 20 && !(GetOwningQuest() as CS_PlayerPrisonScript).PlayerSleeping
        (GetOwningQuest() as CS_PlayerPrisonScript).SkipToExecution()
    endif
EndEvent

Event OnInIt()
    GetRef().BlockActivation()
EndEvent