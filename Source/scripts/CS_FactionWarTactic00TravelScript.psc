Scriptname CS_FactionWarTactic00TravelScript extends ObjectReference  

import CS_CommonFunctions

int CurrentCheckPoint
int TotalCheckPoints
int DestinationHoldNum

float lastupdate

GlobalVariable Property GameDaysPassed Auto

WorldSpace Property Tamriel Auto

ObjectReference[] Property InterholdTravelPathOption0 Auto
ObjectReference[] Property InterholdTravelPathOption1 Auto
ObjectReference[] Property InterholdTravelPathOption2 Auto
ObjectReference[] Property InterholdTravelPathOption3 Auto
ObjectReference[] Property InterholdTravelPathOption4 Auto

ObjectReference[] Property InterholdTravelPath Auto

FormList Property CS_HoldRoutesHoldInterholds Auto
FormList Property CS_HoldRoutesHoldBorders Auto

FormList Property CS_MiscHoldingsVanilla Auto
FormList Property CS_MiscHoldingsExteriorMarkers Auto
FormList Property CS_MovingHoldCenterMarkers Auto
FormList Property CS_AllHolds Auto

float MovingStartedTime
float MovingArrivalTime

ObjectReference TacticDestination

bool Function SetInterholdTravelPath()
    CS_FactionWarOperationPlan OpsPlan = ((self as ObjectReference) as CS_FactionWarTacticScript).OpsPlan
    
    ObjectReference CurrentLocation = OpsPlan.CurrentLocation
    int CurrentHoldNum = (CurrentLocation as CS_CityManagementOwnership).holdnum
    FormList CurrentInterholdRoutes = CS_HoldRoutesHoldInterholds.GetAt(CurrentHoldNum) as FormList
    FormList CurrentHoldBorders = CS_HoldRoutesHoldBorders.GetAt(CurrentHoldNum) as FormList
    
    TacticDestination = OpsPlan.OpsTarget
    DestinationHoldNum = (TacticDestination as CS_CityManagementOwnership).holdnum
    FormList DestinationInterholdRoutes = CS_HoldRoutesHoldInterholds.GetAt(DestinationHoldNum) as FormList
    FormList DestinationHoldBorders = CS_HoldRoutesHoldBorders.GetAt(DestinationHoldNum) as FormList
    
    int PossiblePaths = 0
    
    int i = 0
    while i < CurrentInterholdRoutes.GetSize()
        FormList InterholdRoute = CurrentInterholdRoutes.GetAt(i) as FormList
        if DestinationInterholdRoutes.HasForm(InterholdRoute)
            int[] CurrentLocationIndexes = GetLocationIndexes(InterholdRoute, CurrentHoldBorders)
            int[] DestinationLocationIndexes = GetLocationIndexes(InterholdRoute, DestinationHoldBorders)
            
            int[] MostDirectIndexes = FindLeastDifferenceIndices(CurrentLocationIndexes, DestinationLocationIndexes)
            int CurrentLocationIndex = MostDirectIndexes[0]
            int DestinationLocationIndex = MostDirectIndexes[1]
            
            debug.trace("Travel Tactic Path found! Choosing path " + i + ", CurrentLocationIndex = " + CurrentLocationIndex + ", DestinationLocationIndex = " + DestinationLocationIndex)
            SetUpPossiblePath(PossiblePaths, InterholdRoute, CurrentLocationIndex, DestinationLocationIndex)
    
            PossiblePaths += 1
        endif
        i += 1
    endwhile
    
    if PossiblePaths > 0
        int BestPathIndex = GetBestPathIndex(PossiblePaths)
        debug.trace("Choosing possible path index " + BestPathIndex)
        InterholdTravelPath = GetPossibleTravelPathArray(BestPathIndex)
        return true
    else
            
        debug.notification("No Travel Tactic Path Found!!")
        return false
    endif
EndFunction

int[] Function GetLocationIndexes(FormList InterholdRoute, FormList HoldBorders)
    int[] LocationIndexes
    
    int index = 0
    while index < HoldBorders.GetSize(); && !StartingPoint
        int InterHoldIndex = InterholdRoute.Find(HoldBorders.GetAt(index) as ObjectReference)
        if InterHoldIndex >= 0
            ;StartingPoint = CurrentHoldBorders.GetAt(index) as ObjectReference
            LocationIndexes = AddToIntArray(InterHoldIndex, LocationIndexes)
        endif
        index += 1
    endwhile
    
    return LocationIndexes
EndFunction

Function SetUpPossiblePath(int PathNum, FormList InterholdRoute, int CurrentLocationIndex, int DestinationLocationIndex)
    ObjectReference[] PossiblePath
    if DestinationLocationIndex > CurrentLocationIndex
        int index = CurrentLocationIndex
        while index <= DestinationLocationIndex
            PossiblePath = AddToArray(InterholdRoute.GetAt(index) as ObjectReference, PossiblePath)
            debug.trace("Path index " + index)
            index += 1
        endwhile
    elseif DestinationLocationIndex < CurrentLocationIndex
        int index = CurrentLocationIndex
        while index >= DestinationLocationIndex
            PossiblePath = AddToArray(InterholdRoute.GetAt(index) as ObjectReference, PossiblePath)
            debug.trace("Path index " + index)
            index -= 1
        endwhile
    else
        int index = CurrentLocationIndex
        PossiblePath = AddToArray(InterholdRoute.GetAt(index) as ObjectReference, PossiblePath)
        debug.trace("Path index " + index)
    endif
    
    SetPossibleTravelPathArray(PathNum, PossiblePath)
EndFunction

Function SetPossibleTravelPathArray(int PathNum, ObjectReference[] PathArray)
    if PathNum == 0
        InterholdTravelPathOption0 = PathArray
    elseif PathNum == 1
        InterholdTravelPathOption1 = PathArray
    elseif PathNum == 2
        InterholdTravelPathOption2 = PathArray
    elseif PathNum == 3
        InterholdTravelPathOption3 = PathArray
    elseif PathNum == 4
        InterholdTravelPathOption4 = PathArray
    endif
EndFunction

ObjectReference[] Function GetPossibleTravelPathArray(int PathNum)
    if PathNum == 0
        return InterholdTravelPathOption0
    elseif PathNum == 1
        return InterholdTravelPathOption1
    elseif PathNum == 2
        return InterholdTravelPathOption2
    elseif PathNum == 3
        return InterholdTravelPathOption3
    elseif PathNum == 4
        return InterholdTravelPathOption4
    endif
EndFunction

int Function GetBestPathIndex(int PossiblePaths)
    int[] PathDistances = new int[5]
    
    int i = 0
    while i < PossiblePaths
        ObjectReference[] PossiblePath = GetPossibleTravelPathArray(i)
        int LastPathIndex = PossiblePath.Length - 1
        PathDistances[i] = PossiblePath[0].GetDistance(PossiblePath[LastPathIndex]) as int
        i += 1
    endwhile
    
    int BestPathIndex = -1
    int BestPathDistance = 99999999
    i = 0
    while i < PossiblePaths
        if PathDistances[i] < BestPathDistance
            BestPathIndex = i
            BestPathDistance = PathDistances[i]
        endif
        i += 1
    endwhile
    
    return BestPathIndex
EndFunction

bool Function RegisterForMoving(ObjectReference StartingPosition, ObjectReference Destination)
    UnregisterForUpdateGameTime()
    ObjectReference TravelDestination
    ObjectReference TravelStartingPosition
    
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
    
    if StartingPosition.GetWorldSpace() != Tamriel
        Location StartingPositionLocation = StartingPosition.GetCurrentLocation()
        int StartingPositionLocationNum = CS_MiscHoldingsVanilla.Find(StartingPositionLocation)
        if StartingPositionLocationNum >= 0
            TravelStartingPosition = CS_MiscHoldingsExteriorMarkers.GetAt(StartingPositionLocationNum) as ObjectReference
        else
            int i = 0
            while i < CS_AllHolds.GetSize()
                if StartingPosition.IsInLocation(CS_AllHolds.GetAt(i) as Location)
                    TravelStartingPosition = CS_MovingHoldCenterMarkers.GetAt(i) as ObjectReference
                    i = CS_AllHolds.GetSize()
                endif
                i += 1
            endwhile
        endif
    else
        TravelStartingPosition = StartingPosition
    endif
    
    float time = TravelStartingPosition.GetDistance(TravelDestination)/20000 as float
    if time < 0.5
        return true
    else
        MovingStartedTime = GameDaysPassed.GetValue()
        MovingArrivalTime = MovingStartedTime + time
        lastupdate = MovingStartedTime
        TotalCheckPoints = math.floor(time) as int;/
        RegisterForUpdateGameTime(time)
        if DestinationLocation.GetLocation()
            MovingMessageStartLoc.show(math.ceiling(time))
        else
            MovingMessageStartRef.show(math.ceiling(time))
        endif/;
        debug.trace("Registered Tactic Army for moving to target, will arrive in " + time + " hours, at " + MovingArrivalTime)
        debug.trace("Current Time = " + GameDaysPassed.GetValue())
        return false
    endif
EndFunction

Event OnUpdate()
    CS_FactionWarOperationPlan OpsPlan = ((self as ObjectReference) as CS_FactionWarTacticScript).OpsPlan
    if TotalCheckPoints == 0
        ;/if RegisterForMoving(OpsPlan.CurrentLocation, OpsPlan.OpsTarget)
            debug.notification("Travel Tactic Complete")
            OpsPlan.FinishCurrentTactic()
        endif/;
        if SetInterholdTravelPath()
            TotalCheckPoints = InterholdTravelPath.Length
            lastupdate = GameDaysPassed.GetValue()
            Game.GetPlayer().MoveTo(InterholdTravelPath[0])
            debug.notification("TotalCheckPoints = " + TotalCheckPoints)
        endif
    else
        int checkpointsgained = math.floor(24*(GameDaysPassed.GetValue() - lastupdate)) as int
        lastupdate = GameDaysPassed.GetValue()
        CurrentCheckPoint += checkpointsgained
        Game.GetPlayer().MoveTo(InterholdTravelPath[CurrentCheckPoint])
        debug.notification("Tactic Army at Checkpoint " + CurrentCheckPoint + "/" + TotalCheckPoints)
        if CurrentCheckPoint >= TotalCheckPoints
            debug.notification("Travel Tactic Complete")
            OpsPlan.FinishCurrentTactic()
        endif
    endif
EndEvent