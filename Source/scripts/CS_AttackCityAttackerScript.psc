Scriptname CS_AttackCityAttackerScript extends ReferenceAlias  

FormList Property SpawnMarkers2 Auto hidden
FormList Property SpawnMarkers3 Auto hidden

Actor Property Troop Auto hidden

CS_AttackCitySiegeAttackerScript Property SiegeAttacker Auto 

Function SpawnTroop()
    ForceRefTo(Troop)
    
    ObjectReference SpawnPoint = GetSpawnMarker()
    
    Troop.MoveTo(SpawnPoint)
    Troop.Enable()
    
EndFunction

ObjectReference Function GetSpawnMarker()
EndFunction

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

Event OnUpdate()
    SpawnMarkers2 = (GetOwningQuest() as CS_AttackCityReinforcementsA).SpawnPoints2
    SpawnMarkers3 = (GetOwningQuest() as CS_AttackCityReinforcementsA).SpawnPoints3
    GoToState("Spawn2")
EndEvent

Event OnInIt()
    if SiegeAttacker.Troop
        Troop = SiegeAttacker.Troop
        ForceRefTo(Troop)
    endif
EndEvent