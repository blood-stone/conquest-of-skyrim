Scriptname CS_FactionMilitaryMovingTextScript extends Quest  

ReferenceAlias Property Commander Auto
ReferenceAlias Property CurrentDestination Auto

LocationAlias Property DestinationLocation Auto

Message Property CS_FactionMilitaryMovingStartLoc Auto
Message Property CS_FactionMilitaryMovingStartRef Auto
Message Property CS_FactionMilitaryMovingEndLoc Auto
Message Property CS_FactionMilitaryMovingEndRef Auto

Function DisplayMovementStartMessage(Actor CommanderRef, ObjectReference Target, float ETA, Location TargetLocation=None)
    Start()
    Commander.ForceRefTo(CommanderRef)
    if TargetLocation
        DestinationLocation.ForceLocationTo(TargetLocation)
        CS_FactionMilitaryMovingStartLoc.show(ETA)
    else
        CurrentDestination.ForceRefTo(Target)
        CS_FactionMilitaryMovingStartRef.show(ETA)
    endif
EndFunction

Function DisplayMovementEndMessage(Actor CommanderRef, ObjectReference Target, Location TargetLocation=None)
    Start()
    Commander.ForceRefTo(CommanderRef)
    if TargetLocation
        DestinationLocation.ForceLocationTo(TargetLocation)
        CS_FactionMilitaryMovingEndLoc.show()
    else
        CurrentDestination.ForceRefTo(Target)
        CS_FactionMilitaryMovingEndRef.show()
    endif
EndFunction
