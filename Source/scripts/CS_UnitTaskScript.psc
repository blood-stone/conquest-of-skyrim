Scriptname CS_UnitTaskScript extends ObjectReference  

int Property TaskNum Auto ; What to set ordersnum to in the unit script

bool Property TempTask Auto ; Will the unit need to return to an original task when this one is finished?

ObjectReference Property Target Auto hidden
Location Property TargetLocation Auto hidden

CS_ArmyUnitAliasScript Property Unit Auto hidden
CS_FactionMilitaryMovingTextScript Property MovingText Auto

FormList Property CS_AllHolds Auto
FormList Property CS_MiscHoldingsVanilla Auto
FormList Property CS_MiscHoldingsExteriorMarkers Auto
FormList Property CS_MovingHoldCenterMarkers Auto

WorldSpace Property Tamriel Auto

GlobalVariable Property GameDaysPassed Auto

bool Property Moving Auto hidden

float MovingStartedTime
float MovingArrivalTime

Function SetTask(CS_ArmyUnitAliasScript UnitScript, ObjectReference TargetRef=None, Location OptionalLoc=None)
    Unit = UnitScript
    if TargetRef
        Target = TargetRef
        Unit.RallyPoint.ForceRefTo(TargetRef)
    endif
    
    if OptionalLoc
        TargetLocation = OptionalLoc
    endif
    
    if RegisterForMoving(Target)
        CommanderArrival()
    endif
EndFunction

Function RemoveTask()
    UnRegisterForMoving()
    delete()
EndFunction

; Moving to Task -------------------------------------------------

bool Function RegisterForMoving(ObjectReference Destination)
    UnregisterForUpdateGameTime()
    ObjectReference TravelDestination ; Where the commander is going
    ObjectReference TravelCommander ; Where the commander is starting from
    Actor UnitCommander = Unit.Commander.GetActorRef() ; The actual commander
    
    if Destination.GetWorldSpace() != Tamriel
        Location DestinationLoc = Destination.GetCurrentLocation()
        int DestinationLocNum = CS_MiscHoldingsVanilla.Find(DestinationLoc)
        if DestinationLocNum >= 0
            TravelDestination = CS_MiscHoldingsExteriorMarkers.GetAt(DestinationLocNum) as ObjectReference
        else
            int i = 0
            while i < CS_AllHolds.GetSize()
                if Destination.IsInLocation(CS_AllHolds.GetAt(i) as Location)
                    TravelDestination = CS_MovingHoldCenterMarkers.GetAt(i) as ObjectReference
                    i = CS_AllHolds.GetSize()
                endif
                i += 1
            endwhile
        endif
    else
        TravelDestination = Destination
    endif
    
    if UnitCommander.GetWorldSpace() != Tamriel
        Location CommanderLocation = UnitCommander.GetCurrentLocation()
        int CommanderLocationNum = CS_MiscHoldingsVanilla.Find(CommanderLocation)
        if CommanderLocationNum >= 0
            TravelCommander = CS_MiscHoldingsExteriorMarkers.GetAt(CommanderLocationNum) as ObjectReference
        else
            int i = 0
            while i < CS_AllHolds.GetSize()
                if UnitCommander.IsInLocation(CS_AllHolds.GetAt(i) as Location)
                    TravelCommander = CS_MovingHoldCenterMarkers.GetAt(i) as ObjectReference
                    i = CS_AllHolds.GetSize()
                endif
                i += 1
            endwhile
        endif
    else
        TravelCommander = UnitCommander as ObjectReference
    endif
    
    float time = TravelCommander.GetDistance(TravelDestination)/20000 as float
    if time < 0.5
        Moving = false
        return true
    else
        MovingStartedTime = GameDaysPassed.GetValue()
        MovingArrivalTime = MovingStartedTime + time
        RegisterForSingleUpdateGameTime(time)
        Moving = true
        MovingText.DisplayMovementStartMessage(UnitCommander, Target, math.ceiling(time), TargetLocation)
        debug.trace("Registered for moving to target, will arrive in " + time + " hours, at " + MovingArrivalTime)
        debug.trace("Current Time = " + GameDaysPassed.GetValue())
        return false
    endif
EndFunction

Function UnregisterForMoving()
    
    UnRegisterForUpdateGameTime()
    MovingStartedTime = 0
    MovingArrivalTime = 0
    
EndFunction

Function CommanderArrival()
    debug.trace("Commander arriving!")
    Moving = false
    Actor UnitCommander = Unit.Commander.GetActorRef() ; The actual commander
    
    if !UnitCommander.Is3DLoaded() || !Target.Is3DLoaded()
        UnitCommander.MoveTo(Target)
    endif
    
    MovingText.DisplayMovementEndMessage(UnitCommander, Target, TargetLocation)
    MovingStartedTime = 0
    MovingArrivalTime = 0
    Unit.CompleteTaskMovement()
EndFunction
    
Event OnUpdateGameTime()
    CommanderArrival()
EndEvent