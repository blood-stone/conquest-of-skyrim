Scriptname CS_AttackCitySiegeAttackerScript extends ReferenceAlias  

Actor Property Troop Auto

ObjectReference Property SpawnPoint Auto

Function SpawnTroop()
    ForceRefTo(Troop)
    Troop.MoveTo(SpawnPoint)
    Troop.Enable()
EndFunction

Event OnUpdate()
    SpawnTroop()
EndEvent