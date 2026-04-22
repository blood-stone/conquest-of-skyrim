Scriptname CS_GuardPostManagementScript extends ObjectReference  

ObjectReference Property City Auto

int Property Level Auto

Message Property CS_SettlementDefenseMenuGuardPatrolPointStart Auto

Function RemovePatrolPoint()
    CS_CityManagementPopulation Population = City as CS_CityManagementPopulation
    
    ((self as ObjectReference) as CS_BuildingPlacementScript).RemoveBuilding()
    Population.RemoveGuardPatrolPoint(self as ObjectReference)
    Population.EvaluateAllGuardPackages()
EndFunction

Event OnActivate(ObjectReference akActivatorRef)
    GoToState("Activated")
    CS_CityManagementPopulation Population = City as CS_CityManagementPopulation
    int Response = CS_SettlementDefenseMenuGuardPatrolPointStart.show()
    
    if Response == 0
        Location MarkerLocation = (City as CS_CityManagementOwnership).VanillaCity
        ((self as ObjectReference) as CS_BuildingPlacementScript).MoveBuilding(MarkerLocation)
        Population.EvaluateAllGuardPackages()
    elseif Response == 1
        RemovePatrolPoint()
    endif
    GoToState("Open")
EndEvent

State Activated
    
    Event OnActivate(ObjectReference akActivatorRef)
        ;Blocked
    EndEvent
    
EndState