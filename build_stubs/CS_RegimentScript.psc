Scriptname CS_RegimentScript extends Quest

ReferenceAlias Property Commander Auto
ReferenceAlias Property ExteriorMarker Auto
ReferenceAlias Property CityManagementActivator Auto

LocationAlias Property BaseLocation Auto
LocationAlias Property ArmyName Auto
LocationAlias Property CommanderTitle Auto

Armor[] Property CustomEquipment Auto hidden
Form[] Property CustomItems Auto hidden
int[] Property CustomItemsAmount Auto hidden

int Property OrdersNum Auto hidden
int Property TroopCount Auto hidden
bool Property ArmyMission Auto hidden

Function AddToDeadCount()
EndFunction

Function SpawnTroops()
EndFunction

Function HireCommander(Actor akSpeaker)
EndFunction
