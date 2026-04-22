Scriptname CS_AttackCityFinalScript extends Quest conditional

ReferenceAlias Property CityRef Auto
ReferenceAlias Property Jarl Auto
ReferenceAlias Property JarlMarker Auto
ReferenceAlias Property Housecarl Auto
ReferenceAlias[] Property Guards Auto
ReferenceAlias[] Property GuardMarkers Auto
ReferenceAlias[] Property ResourceBarrels Auto

ObjectReference Property DefendingFaction auto hidden
ObjectReference Property CS_FactionPlayer Auto

int Property citynum Auto hidden

FormList Property CS_MarkersImpLists Auto
FormList Property CS_MarkersSonsLists Auto
FormList Property CS_JarlMarkersAttack Auto
FormList Property CS_AttackCityGuardMarkers Auto

Quest Property CS_AttackCityCitizens Auto

ActorBase[] Property CityGuardsBaseImp Auto
ActorBase[] Property CityGuardsBaseSons Auto

Faction Property CS_PlayerArmyFaction Auto
Faction Property CS_PlayerArmyCommanders Auto
Faction Property PlayerFaction Auto

Faction Property DefenderFaction Auto hidden
Faction Property DefenderFactionNPC Auto hidden

Scene Property CS_AttackCityJarlConfront Auto

;Plan Attributes
int Property AttackGates Auto conditional hidden

CS_AttackCityReinforcementsD DefenderController
CS_AttackCityReinforcementsA AttackerController
CS_TacticalPlan Property TacticalAttackPlan Auto Hidden

;Function SetAttackers() -- Sets up attacker units/troop counts and initializes attacker reinforcement controller
;Function SetDefenders() -- Sets up defender troop count and initializes defender reinforcement controller
;Function DisableGuards() -- Disables all guards of the owning faction type in the city
;Function EnableGuards() -- Enables all guards of the owning faction type in the city
;Function SpawnJarlGuards() -- Spawns the guards that protect the Jarl in the final scene
;Function SetDefendersAlly() -- Makes alliance between player and defenders, so that they don't attack each other during Jarl scene
;Function SetDefendersEnemy() -- Makes defenders and player faction go back to being enemies after scene
;Function RetreatGuards() -- Causes all remaining guards to flee
;Function ActivateBarrels() -- Enables the resource barrels for the player to plunder, guarantees at least one of each type
;Function DeactivateBarrels() -- Deactivates all barrels that are still enabled
;Function CheckAllBarrels() -- Checks to see if a barrel is still enabled, completes objective if none are enabled

Function Initialize()
    citynum = (CityRef.GetRef() as CS_CityManagementOwnership).holdnum
    SetAttackers()
    SetDefenders()
    ActivateBarrels()
    SetObjectiveDisplayed(0, true, true)
    SetObjectiveDisplayed(1, true, true)
    RegisterForSingleUpdate(0.1)
    CS_AttackCityCitizens.Stop()
    CS_AttackCityCitizens.Start()
    utility.wait(3)
    RegisterForUpdate(5)
EndFunction

Function SetAttackers()
    ;Set Attacker troop controllers and troop count
    AttackGates = 1 ; DELETE WHEN DONE!!!!!
    
    AttackerController =  (self as Quest) as CS_AttackCityReinforcementsA
    AttackerController.Initialize()
EndFunction

Function SetSiegeEquipment()
    ;Set catapults, ladders, etc
EndFunction

Function SetDefenders()
    DefendingFaction = (CityRef.GetRef() as CS_CityManagementOwnership).FactionOwnerActivator
    DefenderFaction = (DefendingFaction as CS_FactionManagementMilitary).ArmyFaction
    DefenderFactionNPC = (DefendingFaction as CS_FactionManagementMilitary).ArmyNPCFaction
    DisableGuards()
    JarlMarker.ForceRefTo(CS_JarlMarkersAttack.GetAt(citynum) as ObjectReference)
    Jarl.ForceRefTo((DefendingFaction as CS_FactionManagementOwnership).HoldLeaders[citynum])
    if (DefendingFaction as CS_FactionManagementOwnership).HoldHousecarls[citynum]
        Housecarl.ForceRefTo((DefendingFaction as CS_FactionManagementOwnership).HoldHousecarls[citynum])
    endif
    Jarl.TryToMoveTo(JarlMarker.GetRef())
    FormList GuardMarkerList = CS_AttackCityGuardMarkers.GetAt(citynum) as FormList
    int i = 0
    while i < GuardMarkers.Length
        GuardMarkers[i].ForceRefTo(GuardMarkerList.GetAt(i) as ObjectReference)
        i += 1
    endwhile
    
    DefenderController =  (self as Quest) as CS_AttackCityReinforcementsD
    DefenderController.TroopCount = 20 ; CHANGE WHEN DONE!!!!!!!!!!!!!!!!!!!!!!!
    DefenderController.Initialize()
EndFunction

Function ActivateBarrels()
    int i = 0
    while i < ResourceBarrels.Length
        if i % 4 == 0
            ResourceBarrels[i].GoToState("Activated")
            ResourceBarrels[i].RegisterForSingleUpdate(0.1)
        else
            int activechance = utility.randomint(0, 1)
            debug.trace("Activechance = " + activechance)
            if activechance == 1
                ResourceBarrels[i].GoToState("Activated")
                ResourceBarrels[i].RegisterForSingleUpdate(0.1)
            endif
        endif
        i += 1
    endwhile
EndFunction

Function DeactivateBarrels()
    int i = 0
    while i < ResourceBarrels.Length
        ResourceBarrels[i].TryToDisable()
        i += 1
    endwhile
EndFunction

Function CheckAllBarrels()
    int i = 0
    while i < ResourceBarrels.Length
        if ResourceBarrels[i].GetRef() && ResourceBarrels[i].GetRef().IsEnabled()
            return
        endif
        i += 1
    endwhile
    
    SetObjectiveCompleted(12)
EndFunction

Function DisableGuards()
    FormList ImpList = CS_MarkersImpLists.GetAt(citynum) as FormList
    FormList SonsList = CS_MarkersSonsLists.GetAt(citynum) as FormList
    int i = 0
    while i < ImpList.GetSize()
        (ImpList.GetAt(i) as ObjectReference).disable()
        (SonsList.GetAt(i) as ObjectReference).disable()
        i += 1
    endwhile
EndFunction

Function EnableGuards()
    FormList ImpList = CS_MarkersImpLists.GetAt(citynum) as FormList
    FormList SonsList = CS_MarkersSonsLists.GetAt(citynum) as FormList
    int enemyfactionnum = (DefendingFaction as CS_FactionManagementDiplomacy).factionnum
    int i = 0
    while i < ImpList.GetSize()
        if enemyfactionnum == 1
            (ImpList.GetAt(i) as ObjectReference).enable()
        elseif enemyfactionnum == 2
            (SonsList.GetAt(i) as ObjectReference).enable()
        endif
        i += 1
    endwhile
EndFunction

Function SpawnJarlGuards()
    SetDefendersAlly()
    ActorBase GuardBase
    if (DefendingFaction as CS_FactionManagementDiplomacy).FactionNum == 1
        GuardBase = CityGuardsBaseImp[citynum]
    elseif (DefendingFaction as CS_FactionManagementDiplomacy).FactionNum == 2
        GuardBase = CityGuardsBaseSons[citynum]
    endif
    
    int i = 0
    while i < Guards.Length
        Guards[i].ForceRefTo(GuardMarkers[i].GetRef().PlaceAtMe(GuardBase))
        i += 1
    endwhile
EndFunction

Function SetDefendersAlly()
    CS_PlayerArmyFaction.SetAlly(DefenderFaction)
    CS_PlayerArmyCommanders.SetAlly(DefenderFaction)
    PlayerFaction.SetAlly(DefenderFaction)
    CS_PlayerArmyFaction.SetAlly(DefenderFactionNPC)
    CS_PlayerArmyCommanders.SetAlly(DefenderFactionNPC)
    PlayerFaction.SetAlly(DefenderFactionNPC)
EndFunction

Function SetDefendersEnemy()
    CS_PlayerArmyFaction.SetEnemy(DefenderFaction)
    CS_PlayerArmyCommanders.SetEnemy(DefenderFaction)
    PlayerFaction.SetEnemy(DefenderFaction)
    CS_PlayerArmyFaction.SetEnemy(DefenderFactionNPC)
    CS_PlayerArmyCommanders.SetEnemy(DefenderFactionNPC)
    PlayerFaction.SetEnemy(DefenderFactionNPC)
EndFunction

Function RetreatGuards()
    int i = 0
    while i < Guards.Length
        if Guards[i].GetActorRef() && !Guards[i].GetActorRef().IsDead()
            (Guards[i].GetActorRef() as CS_TroopScript).GoToState("Retreat")
            (Guards[i].GetActorRef() as CS_TroopScript).RegisterForSingleUpdate(0.1)
            Guards[i].Clear()
        endif
        i += 1
    endwhile
EndFunction

Function TransferCity()
    (CityRef.GetRef() as CS_CityManagementOwnership).ChangeGovernments(CS_FactionPlayer)
EndFunction

Function UnInitialize()
    SetDefendersEnemy()
    DeactivateBarrels()
    CS_AttackCityCitizens.Stop()
    Stop()
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
    TacticalAttackPlan = akRef2 as CS_TacticalPlan
    Initialize()
EndEvent