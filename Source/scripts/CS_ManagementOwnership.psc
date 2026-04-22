Scriptname CS_ManagementOwnership extends ObjectReference  

ObjectReference Property FactionOwnerActivator Auto
ObjectReference Property HQ Auto

Actor Property Leader Auto
Actor Property Second Auto
Actor Property ArmyLeader Auto

Function SetHQ(ObjectReference HQRef)
    HQ = HQRef
EndFunction

Function SetOwnerFaction(ObjectReference OwnerFaction)
    FactionOwnerActivator = OwnerFaction
EndFunction