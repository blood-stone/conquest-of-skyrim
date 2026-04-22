Scriptname CS_AttackCityDefenderScript extends ReferenceAlias

ReferenceAlias[] Property SpawnMarkers Auto hidden
FormList Property SpawnMarkers2 Auto hidden
FormList Property SpawnMarkers3 Auto hidden

bool Property Ranged Auto

;Function SpawnTroop() -- Spawns a troop of the type of the defending faction and forces it into this alias
;Function SetSpawnMarkers() -- Sets the SpawnMarkers Alias to either the ranged or melee spawn markers
;ObjectReference Function GetSpawnMarker() -- Gets a random marker from the SpawnMarkers Alias

Function SpawnTroop()
    ObjectReference DefendingFaction = (GetOwningQuest() as CS_AttackCityFinalScript).DefendingFaction
    CS_FactionManagementMilitary FactionMilitary = (DefendingFaction as CS_FactionManagementMilitary)
    ActorBase TroopType
    if Ranged
        TroopType = FactionMilitary.InitialTroopTypes.GetAt(2) as ActorBase
    else
        TroopType = FactionMilitary.InitialTroopTypes.GetAt(0) as ActorBase
    endif
    
    ObjectReference SpawnMarker = GetSpawnMarker()
    Actor Troop = SpawnMarker.PlaceAtMe(TroopType) as Actor
    ForceRefTo(Troop)
    if GetState() != "Spawn2" && GetState() != "Spawn3"
        GoToState("Spawn2")
    endif
EndFunction

ObjectReference Function GetSpawnMarker()
    if !SpawnMarkers
        SetSpawnMarkers()
    endif

    ObjectReference SpawnMarker
    while !SpawnMarker
        int spawnmarkernum = utility.randomint(0, SpawnMarkers.Length - 1)
        SpawnMarker = SpawnMarkers[spawnmarkernum].GetRef()
    endwhile
    
    return SpawnMarker
EndFunction

Function SetSpawnMarkers()
    if Ranged
        SpawnMarkers = (GetOwningQuest() as CS_AttackCityReinforcementsD).DMMarkersRanged
    else
        SpawnMarkers = (GetOwningQuest() as CS_AttackCityReinforcementsD).DMMarkersMelee
    endif
    
    SpawnMarkers2 = (GetOwningQuest() as CS_AttackCityReinforcementsD).SpawnPoints2
    SpawnMarkers3 = (GetOwningQuest() as CS_AttackCityReinforcementsD).SpawnPoints3
EndFunction

Event OnDying(Actor akKiller)
    (GetOwningQuest() as CS_AttackCityReinforcementsD).TroopDeath()
EndEvent

Event OnUpdate()
    if GetActorRef()
        if GetActorRef().IsDead()
            Clear()
            SpawnTroop()
        endif
    else
        SpawnTroop()
    endif
EndEvent

State Spawn2
    
    ObjectReference Function GetSpawnMarker()
        int spawnmarkernum = utility.randomint(0, SpawnMarkers2.GetSize() - 1)
        ObjectReference SpawnMarker = SpawnMarkers2.GetAt(spawnmarkernum) as ObjectReference
        
        return SpawnMarker
    EndFunction
    
EndState

State Spawn3
    
    ObjectReference Function GetSpawnMarker()
        int spawnmarkernum = utility.randomint(0, SpawnMarkers3.GetSize() - 1)
        ObjectReference SpawnMarker = SpawnMarkers3.GetAt(spawnmarkernum) as ObjectReference
        
        return SpawnMarker
    EndFunction
    
EndState