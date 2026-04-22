Scriptname CS_AttackCitySiegeCommanderScript extends ReferenceAlias  

Actor Property Commander Auto

ObjectReference Property SpawnPoint Auto

Function SpawnCommander()
    ForceRefTo(Commander)
    Commander.MoveTo(SpawnPoint)
    Commander.Enable()
EndFunction

Event OnUpdate()
    SpawnCommander()
EndEvent