Scriptname CS_PlacedObjectActivatorMarkerCommand extends ObjectReference  

ObjectReference PlacedActivator
ObjectReference CityManagementActivator

ObjectReference Property PlacedActivatorIdle Auto

Furniture Property SoldierWallIdle Auto

FormList Property PlacementActivators Auto

GlobalVariable Property FactionColor Auto

int currentfactioncolor

State SetUp

    Event OnLoad()
        if !PlacedActivator
            SpawnActivator()
        elseif FactionColor.GetValueInt() != currentfactioncolor
            PlacedActivator.disable()
            PlacedActivator.delete()
            PlacedActivator = None
            SpawnActivator()
        endif
    EndEvent
    
EndState

Function InitialSetUp(ObjectReference ManagementActivator)
    SpawnActivator()
    SetManagementActivator(ManagementActivator)
    PlacedActivatorIdle = PlaceAtMe(SoldierWallIdle)
    utility.wait(0.2)
    PlacedActivatorIdle.MoveToNode(PlacedActivator, "CommanderIdleMarker")
    PlacedActivatorIdle.MoveTo(PlacedActivatorIdle, afZOffset = (Game.GetPlayer().GetPositionZ() - PlacedActivatorIdle.GetPositionZ())) 
    PlacedActivatorIdle.SetAngle(PlacedActivatorIdle.GetAngleX(), PlacedActivatorIdle.GetAngleY(), PlacedActivatorIdle.GetAngleZ() - 90)
    GoToState("SetUp")
EndFunction

Function SpawnActivator()
    currentfactioncolor = FactionColor.GetValueInt()
    PlacedActivator = PlaceAtMe(PlacementActivators.GetAt(currentfactioncolor) as Activator)
    (PlacedActivator as CS_PlacedObjectActivatorTrainingField).CityManagementActivator = CityManagementActivator
EndFunction

Function SetManagementActivator(ObjectReference ManagementActivator)
    CityManagementActivator = ManagementActivator
    (PlacedActivator as CS_PlacedObjectActivatorTrainingField).CityManagementActivator = ManagementActivator
EndFunction