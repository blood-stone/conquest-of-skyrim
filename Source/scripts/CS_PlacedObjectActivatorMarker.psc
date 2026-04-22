Scriptname CS_PlacedObjectActivatorMarker extends ObjectReference  

ObjectReference PlacedActivator
ObjectReference CityManagementActivator

ObjectReference Property BuildingChest Auto

FormList Property PlacementActivators Auto

int currentfactioncolor

State SetUp

    Event OnLoad()
        ObjectReference FactionOwner = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
        int FactionColor = (FactionOwner as CS_FactionManagementDiplomacy).FactionColor
        
        if !PlacedActivator
            SpawnActivator()
        elseif FactionColor != currentfactioncolor
            PlacedActivator.disable()
            PlacedActivator.delete()
            PlacedActivator = None
            SpawnActivator()
        endif
    EndEvent
    
EndState

Function InitialSetUp(ObjectReference ManagementActivator)
    ;SetManagementActivator(ManagementActivator)
    CityManagementActivator = ManagementActivator
    SpawnActivator()
    GoToState("SetUp")
EndFunction

Function SpawnActivator()
    ObjectReference FactionOwner = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
    int FactionColor = (FactionOwner as CS_FactionManagementDiplomacy).FactionColor
    
    currentfactioncolor = FactionColor
    PlacedActivator = PlaceAtMe(PlacementActivators.GetAt(currentfactioncolor) as Activator)
    (PlacedActivator as CS_PlacedObjectActivator).ActivatorMarker = self as ObjectReference
    (PlacedActivator as CS_PlacedObjectActivator).InitialSetUp(CityManagementActivator)
EndFunction

Function SetManagementActivator(ObjectReference ManagementActivator)
    CityManagementActivator = ManagementActivator
    (PlacedActivator as CS_PlacedObjectActivator).CityManagementActivator = ManagementActivator
EndFunction

Function SetBuildingChest(ObjectReference CityBuildingChest)
    BuildingChest = CityBuildingChest
    (PlacedActivator as CS_PlacedObjectActivator).BuildingChest = CityBuildingChest
EndFunction