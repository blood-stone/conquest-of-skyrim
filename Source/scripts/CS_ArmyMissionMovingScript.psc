Scriptname CS_ArmyMissionMovingScript extends Quest  

ReferenceAlias Property Commander Auto
ReferenceAlias Property FinalDestination Auto
ReferenceAlias Property CurrentDestination Auto

LocationAlias Property DestinationLocation Auto

FormList Property CS_AllHolds Auto
FormList Property CS_MiscHoldingsVanilla Auto
FormList Property CS_MiscHoldingsExteriorMarkers Auto
FormList Property CS_MovingHoldCenterMarkers Auto

WorldSpace Property Tamriel Auto

GlobalVariable Property GameDaysPassed Auto

Message Property MovingMessageStartLoc Auto
Message Property MovingMessageStartRef Auto
Message Property MovingMessageEndLoc Auto
Message Property MovingMessageEndRef Auto

ObjectReference Property Regiment Auto

Quest Property CS_SettlementWorkersQuest Auto

CS_RegimentScript RegimentScript
CS_ArmyRegimentOrders RegimentOrders
CS_ArmyRegimentTroops RegimentTroops
CS_ArmyRegimentEquipment RegimentEquipment

float MovingStartedTime
float MovingArrivalTime

bool Function RegisterForMoving(ObjectReference Destination)
    UnregisterForUpdateGameTime()
    ObjectReference TravelDestination
    ObjectReference TravelCommander
    
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
    
    if Commander.GetActorRef().GetWorldSpace() != Tamriel
        Location CommanderLocation = Commander.GetRef().GetCurrentLocation()
        int CommanderLocationNum = CS_MiscHoldingsVanilla.Find(CommanderLocation)
        if CommanderLocationNum >= 0
            TravelCommander = CS_MiscHoldingsExteriorMarkers.GetAt(CommanderLocationNum) as ObjectReference
        else
            int i = 0
            while i < CS_AllHolds.GetSize()
                if Commander.GetRef().IsInLocation(CS_AllHolds.GetAt(i) as Location)
                    TravelCommander = CS_MovingHoldCenterMarkers.GetAt(i) as ObjectReference
                    i = CS_AllHolds.GetSize()
                endif
                i += 1
            endwhile
        endif
    else
        TravelCommander = Commander.GetRef()
    endif
    
    float time = TravelCommander.GetDistance(TravelDestination)/20000 as float
    if time < 0.5
        return true
    else
        MovingStartedTime = GameDaysPassed.GetValue()
        MovingArrivalTime = MovingStartedTime + time
        RegisterForUpdateGameTime(time)
        if DestinationLocation.GetLocation()
            MovingMessageStartLoc.show(math.ceiling(time))
        else
            MovingMessageStartRef.show(math.ceiling(time))
        endif
        debug.trace("Registered for moving to target, will arrive in " + time + " hours, at " + MovingArrivalTime)
        debug.trace("Current Time = " + GameDaysPassed.GetValue())
        return false
    endif
EndFunction

Function UnregisterForMoving()
    
    MovingStartedTime = 0
    MovingArrivalTime = 0
    
EndFunction

Function CommanderArrival()
    debug.trace("Commander arriving!")
    
    if !Commander.GetActorRef().Is3DLoaded() || !CurrentDestination.GetRef().Is3DLoaded()
        Commander.GetActorRef().MoveTo(CurrentDestination.GetRef())
    
        ReferenceAlias[] Troops = ((self as Quest) as CS_ArmyMissionScript).Troops
        
        int i = 0
        while i < Troops.Length
            (Troops[i] as CS_ArmyMissionTroopScript).DestinationMarker = CurrentDestination.GetRef()
            (Troops[i] as CS_ArmyMissionTroopScript).OriginalState = (Troops[i] as CS_ArmyMissionTroopScript).GetState()
            (Troops[i] as CS_ArmyMissionTroopScript).GoToState("MoveToDestination")
            (Troops[i] as CS_ArmyMissionTroopScript).RegisterForSingleUpdate(0.01)
            i += 1
        endwhile
        
        i = 0
        while i < Troops.Length
            while (Troops[i] as CS_ArmyMissionTroopScript).GetState() == "MoveToDestination"
                utility.wait(0.1)
            endwhile
            i += 1
        endwhile
    endif
    
    if DestinationLocation.GetLocation()
        MovingMessageEndLoc.show()
    else
        MovingMessageEndRef.show()
    endif
    
    if RegimentOrders.GrandMission
        RegimentOrders.GrandMission.SendStoryEventAndWait(akRef1 = Commander.GetActorRef(), akRef2 = Regiment)
    elseif CS_SettlementWorkersQuest.IsRunning() && (CS_SettlementWorkersQuest as CS_SettlementWorkersScript).CityManagementActivatorAlias.GetRef() == RegimentOrders.HomeStation
        (CS_SettlementWorkersQuest as CS_ArmyMissionScript).AssignRegimentToMission(Regiment)
    else
        RegimentOrders.CurrentMission = None
        ((self as Quest) as CS_ArmyMissionScript).DeleteTroops()
    endif
    
    MovingStartedTime = 0
    MovingArrivalTime = 0
    Stop()
EndFunction
    
Event OnUpdateGameTime()
    CommanderArrival()
EndEvent

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
    Regiment = akRef2
    RegimentOrders = Regiment as CS_ArmyRegimentOrders
    RegimentTroops = Regiment as CS_ArmyRegimentTroops
    RegimentEquipment = Regiment as CS_ArmyRegimentEquipment
    CurrentDestination.ForceRefTo(akRef1)
    Commander.ForceRefTo(RegimentOrders.Commander.GetActorRef())
    Commander.GetActorRef().EvaluatePackage()
    if RegisterForMoving(akRef1)
        CommanderArrival()
    endif
EndEvent