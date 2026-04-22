Scriptname CS_AttackCitySiegeScript extends Quest conditional

LocationAlias Property City Auto

ReferenceAlias Property CityRef Auto

FormList Property CatapultsList Auto ;All catapults lists at all cities
FormList Property CatapultOpsList Auto
FormList Property Catapults Auto hidden ;Catapult list for just this city
FormList Property CatapultOps Auto hidden
FormList Property MarkersImpLists Auto
FormList Property MarkersSonsLists Auto
FormList Property CampMarkers1 Auto
FormList Property CampMarkers2 Auto

GlobalVariable Property CS_BattleSize Auto
GlobalVariable Property CS_BattleSpeed Auto

int Property holdnum Auto hidden
int Property enemyfactionnum Auto hidden

Keyword Property StoryAttackCity Auto

CS_AttackCitySiegeAttackerScript[] Property Attackers Auto
CS_AttackCitySiegeCommanderScript[] Property Commanders Auto
ReferenceAlias[] Property AttackerMarkers1 Auto
ReferenceAlias[] Property AttackerMarkers2 Auto
ReferenceAlias[] Property CommanderMarkers1 Auto
ReferenceAlias[] Property CommanderMarkers2 Auto
ReferenceAlias Property CWSiegeMarker Auto
ReferenceAlias Property CampMarker1 Auto
ReferenceAlias Property CampMarker2 Auto

CS_TacticalPlan Property AttackPlan Auto

;Function EnableCampMarkers() -- Enables the markers that allow the player to fast travel to the siege camps
;Function SpawnSiegeEquipment() -- Spawns the catapults that the player chose to bring from the plan
;Function SpawnAttackers() -- Spawns the attackers at the spawn markers indicated by what entrance the player chose to attack

Function Initialize()
    debug.trace("Started Siege Initialization")
    holdnum = AttackPlan.holdnum
    SpawnSiegeEquipment()
    SpawnCommanders()
    SpawnAttackers()
    EnableCampMarkers()
    if AttackerMarkers1[0].GetRef().Is3DLoaded()
        SetStage(10)
    endif
    debug.trace("Siege initialized!")
    ;Wait for player to start
EndFunction

Function EnableCampMarkers()
    CampMarker1.ForceRefTo(CampMarkers1.GetAt(holdnum) as ObjectReference)
    CampMarker2.ForceRefTo(CampMarkers2.GetAt(holdnum) as ObjectReference)
    
    if AttackPlan.DoubleAttack
        CampMarker1.TryToEnable()
        CampMarker2.TryToEnable()
    elseif AttackPlan.AttackEntrance == 1
        CampMarker1.TryToEnable()
    elseif AttackPlan.AttackEntrance == 2
        CampMarker2.TryToEnable()
    endif
EndFunction

Function DisableCampMarkers()
    CampMarker1.TryToDisable()
    CampMarker2.TryToDisable()
EndFunction

Function SpawnSiegeEquipment()
    Catapults = CatapultsList.GetAt(holdnum) as FormList
    CatapultOps = CatapultOpsList.GetAt(holdnum) as FormList
    
    int i = 0
    while i < AttackPlan.NumCatapults
        (Catapults.GetAt(i) as ObjectReference).enable()
        (CatapultOps.GetAt(i) as Actor).enable()
        (CatapultOps.GetAt(i) as Actor).reset()
        i += 1
    endwhile
EndFunction

Function SpawnCommanders()
    int assignedcommanders = 0
    int spawn_points_used1 = 0
    int spawn_points_used2 = 0
    int armynum = 0
    AttackPlan.Units[armynum].OrdersNum = 3 ; DELETE THIS LATER AFTER ATTACK PLANNING
    Actor Commander = AttackPlan.Units[armynum].Commander.GetActorRef()
    while assignedcommanders < 10 && armynum < AttackPlan.NumUnits
        if Commander
            Commanders[assignedcommanders].Commander = Commander
            if AttackPlan.DoubleAttack
                if spawn_points_used1 > spawn_points_used2
                    Commanders[assignedcommanders].SpawnPoint = CommanderMarkers2[spawn_points_used2].GetRef()
                    spawn_points_used2 += 1
                else
                    Commanders[assignedcommanders].SpawnPoint = CommanderMarkers1[spawn_points_used1].GetRef()
                    spawn_points_used1 += 1
                endif
            elseif AttackPlan.AttackEntrance == 1
                Commanders[assignedcommanders].SpawnPoint = CommanderMarkers1[spawn_points_used1].GetRef()
                spawn_points_used1 += 1
            elseif AttackPlan.AttackEntrance == 2
                Commanders[assignedcommanders].SpawnPoint = CommanderMarkers2[spawn_points_used2].GetRef()
                spawn_points_used2 += 1
            endif
            Commanders[assignedcommanders].RegisterForSingleUpdate(0.1)
            assignedcommanders += 1
        endif
        
        armynum += 1

        if armynum < AttackPlan.NumUnits
            Commander = AttackPlan.Units[armynum].Commander.GetActorRef()
            AttackPlan.Units[armynum].OrdersNum = 3 ; DELETE THIS LATER AFTER ATTACK PLANNING
        endif
    endwhile
EndFunction

Function SpawnAttackers()
    int assignedtroops = 0
    int spawn_points_used1 = 0
    int spawn_points_used2 = 0
    int i = 0
    int armynum = 0
    CS_ArmyUnitTroopScript[] UnitTroops = AttackPlan.Units[armynum].TroopAliases
    AttackPlan.Units[armynum].OrdersNum = 3 ; DELETE THIS LATER AFTER ATTACK PLANNING
    while assignedtroops < 20 && armynum < AttackPlan.NumUnits
        if UnitTroops[i].GetRef()
            Attackers[assignedtroops].Troop = UnitTroops[i].GetActorRef()
            UnitTroops[i].GoToState("Enabled")
            if AttackPlan.DoubleAttack
                if spawn_points_used1 > spawn_points_used2
                    Attackers[assignedtroops].SpawnPoint = AttackerMarkers2[spawn_points_used2].GetRef()
                    spawn_points_used2 += 1
                else
                    Attackers[assignedtroops].SpawnPoint = AttackerMarkers1[spawn_points_used1].GetRef()
                    spawn_points_used1 += 1
                endif
            elseif AttackPlan.AttackEntrance == 1
                Attackers[assignedtroops].SpawnPoint = AttackerMarkers1[spawn_points_used1].GetRef()
                spawn_points_used1 += 1
            elseif AttackPlan.AttackEntrance == 2
                Attackers[assignedtroops].SpawnPoint = AttackerMarkers2[spawn_points_used2].GetRef()
                spawn_points_used2 += 1
            endif
            Attackers[assignedtroops].RegisterForSingleUpdate(0.1)
            assignedtroops += 1
        endif
        
        i += 1
        if i == 20
            armynum += 1
            i = 0
            if armynum < AttackPlan.NumUnits
                UnitTroops = AttackPlan.Units[armynum].TroopAliases
                AttackPlan.Units[armynum].OrdersNum = 3 ; DELETE THIS LATER AFTER ATTACK PLANNING
            endif
        endif
    endwhile
EndFunction

Function CancelAttack()
    ;Remove Unit Orders
    Stop()
EndFunction

Function LaunchAttack()
    StoryAttackCity.SendStoryEventAndWait(City.GetLocation(), CityRef.GetRef(), AttackPlan as ObjectReference)
    Stop()
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
    ;AttackPlan = akRef2 as CS_TacticalPlan
EndEvent