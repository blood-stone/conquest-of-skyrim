Scriptname CS_RegimentMovementScript extends Quest  

FormList Property MovementPathList Auto

GlobalVariable Property GameDaysPassed Auto

int CurrentLocationNum

Function BeginMovement(ObjectReference StartingLocation, ObjectReference TargetLocation)
    CS_RoadMarkerScript RoadMarkerScript = StartingLocation as CS_RoadMarkerScript
    int i = 0
    while i < RoadMarkerScript.PathLists.Length
        if RoadMarkerScript.PathLists[i].HasForm(TargetLocation)
            MovementPathList = RoadMarkerScript.PathLists[i]
            i = 100
        else
            i += 1
        endif
    endwhile
    CurrentLocationNum = MovementPathList.Find(StartingLocation)
    RegisterForSingleUpdate(1)
EndFunction