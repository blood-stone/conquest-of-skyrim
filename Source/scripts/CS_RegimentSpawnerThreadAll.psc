Scriptname CS_RegimentSpawnerThreadAll extends Quest  

ActorBase Property TroopType Auto hidden
ReferenceAlias Property TroopAlias Auto
;/
Function SpawnTroop()
    Actor Troop = ((self as Quest) as CS_RegimentScript).Commander.GetActorRef().PlaceAtMe(TroopType, abForcePersist=true) as Actor
    TroopAlias.ForceRefTo(Troop)
    GoToState("Spawned")
EndFunction

State UnSpawned

    Event OnUpdate()
        SpawnTroop()
    EndEvent
    
EndState

State Spawned
    
EndState/;