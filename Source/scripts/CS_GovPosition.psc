Scriptname CS_GovPosition extends ReferenceAlias

ReferenceAlias Property VanillaPosition Auto

Function Recruit(Actor NewActor)
    if NewActor
        ForceRefTo(NewActor)
    endif
    
    if VanillaPosition
        VanillaPosition.GetOwningQuest().UnRegisterForUpdate()
        VanillaPosition.ForceRefTo(NewActor)
    endif
EndFunction

Function Fire()
    Clear()
    
    if VanillaPosition
        VanillaPosition.Clear()
    endif
EndFunction