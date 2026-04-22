Scriptname CS_CityManagementFactionOwnership extends ObjectReference  

ObjectReference Property FactionOwnerActivator Auto

CS_FactionManagementDiplomacy Property FactionManagementDiplomacy Auto
CS_FactionManagementEconomy Property FactionManagementEconomy Auto
CS_FactionManagementOwnership Property FactionManagementOwnership Auto
CS_ManagementReserves Property FactionManagementReserves Auto

Function SetOwnerFaction(ObjectReference OwnerFaction)
    FactionOwnerActivator = OwnerFaction
    FactionManagementDiplomacy = OwnerFaction as CS_FactionManagementDiplomacy
    FactionManagementEconomy = OwnerFaction as CS_FactionManagementEconomy
    FactionManagementOwnership = OwnerFaction as CS_FactionManagementOwnership
    FactionManagementReserves = OwnerFaction as CS_ManagementReserves
EndFunction