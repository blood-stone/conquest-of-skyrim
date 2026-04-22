Scriptname CS_ArmyRegimentOrders extends ObjectReference  

ObjectReference Property FactionOwnerActivator Auto
ObjectReference Property HomeStation Auto
ObjectReference Property CommanderIdleMarker Auto
ObjectReference Property CurrentLocation Auto

ReferenceAlias Property RegimentTarget Auto
ReferenceAlias Property Commander Auto

Location Property UnitName Auto

CS_TroopFormUpScript Property CS_TroopFormUp Auto

CS_ArmyMissionScript Property CurrentMission Auto

Keyword Property GrandMission Auto
Keyword Property CS_StoryArmyFormUp Auto
Keyword Property CS_StoryArmyMoving Auto

FormList Property RecruitableCommanderList Auto

Function SetUp(ObjectReference OwningFaction, ReferenceAlias NewCommander, ReferenceAlias NewRegimentTarget, ObjectReference NewHomeStation)
    FactionOwnerActivator = OwningFaction
    Commander = NewCommander
    ;(Commander as CS_FactionArmyRegimentCommanderScript).ArmyRegiment = self as ObjectReference
    RegimentTarget = NewRegimentTarget
    HomeStation = NewHomeStation
    UnitName = (HomeStation as CS_CityManagementOwnership).VanillaCity
    (HomeStation as CS_CityManagementPopulation).AddUnit(self as ObjectReference)
    ((self as ObjectReference) as CS_ArmyRegimentTroops).GoToState("NotSetUp")
    RegisterForSingleUpdate(0.1)
    Disable()
    if IsDisabled()
        debug.notification("Commander is recruitable!")
    endif
EndFunction

Function HireCommander(Actor NewCommander)
    if IsDisabled()
        Enable()
    endif
    if CurrentMission && CurrentMission.Commander
        CurrentMission.Commander.ForceRefTo(NewCommander)
    endif
    Commander.ForceRefTo(NewCommander)
    NewCommander.EvaluatePackage()
EndFunction

Function FireCommander()
    Actor OldCommander = Commander.GetActorRef()
    Commander.Clear()
    if CurrentMission
        CurrentMission.Commander.Clear()
    endif
    
    OldCommander.EvaluatePackage()
    if !IsDisabled()
        Disable()
    endif
EndFunction

Function SetRegimentTarget(ObjectReference NewTarget)
    RegimentTarget.ForceRefTo(NewTarget)
    Commander.TryToEvaluatePackage()
EndFunction

Function RegisterForFollowPlayer();/
    if CurrentMission
        CurrentMission.ClearTroops()
        CurrentMission = None
    endif/;
    CS_TroopFormUp.Stop()
    GrandMission = CS_StoryArmyFormUp
    CS_StoryArmyMoving.SendStoryEvent(akRef1 = Game.GetPlayer(), akRef2 = self as ObjectReference)
EndFunction

Function StopFollowPlayer();/
    if CurrentMission
        CurrentMission.ClearTroops()
        CurrentMission = None
    endif/;
    GrandMission = None
    CS_TroopFormUp.DisbandArmy()
    CS_TroopFormUp.Stop()
EndFunction

Function CancelOrders();/
    if CurrentMission
        CurrentMission.ClearTroops()
        CurrentMission = None
    endif/;
    GrandMission = None
    CS_StoryArmyMoving.SendStoryEvent((HomeStation as CS_CityManagementOwnership).VanillaCity, akRef1 = CommanderIdleMarker, akRef2 = self as ObjectReference)
EndFunction