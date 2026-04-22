;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname CS_QF__0509FBAD Extends Quest Hidden

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Faction04.SetPlayerEnemy(true)
Faction04.SetEnemy(Faction01)
SceneTrigger1.disable()
ConclusionQuest.Start()
TriggerBoxActivator.enable()
CapitalDoor.lock(true)
CapitalDoor.SetLockLevel(255)
int mapmarkernum = 0
while mapmarkernum < MapMarkers.GetSize()
	ObjectReference MapMarker = MapMarkers.GetAt(mapmarkernum) as ObjectReference
	MapMarker.disable()
	mapmarkernum += 1
endwhile

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
Faction04.SetPlayerEnemy(false)
Faction04.SetEnemy(Faction01, false)

int mapmarkernum = 0
while mapmarkernum < MapMarkers.GetSize()
	ObjectReference MapMarker = MapMarkers.GetAt(mapmarkernum) as ObjectReference
	MapMarker.enable()
	mapmarkernum += 1
endwhile

ConclusionQuest.Stop()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
Faction04.SetPlayerEnemy(false)
Faction04.SetEnemy(Faction01, false)

SceneTrigger1.enable()
TriggerBoxActivator.disable()
CapitalDoor.lock(false)

UnRegisterForUpdateGameTime()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Faction Property Faction01  Auto  

Faction Property Faction02  Auto  

Faction Property Faction03  Auto  

Faction Property Faction04  Auto  

Faction Property PlayerFaction  Auto  

GlobalVariable Property VillageCount  Auto  

GlobalVariable Property CityCount  Auto  

GlobalVariable Property FortCount  Auto  

GlobalVariable Property FactionValue  Auto  

GlobalVariable[] Property HoldingsInMainHold  Auto  

Quest Property RelationsQuest  Auto  

ObjectReference Property EnemyJarlPrison  Auto  

ReferenceAlias Property EnemyJarlAlias  Auto  

Message Property Capitulation  Auto  

Actor Property EnemyHousecarl  Auto  

Actor Property EnemySteward  Auto  

ReferenceAlias Property EnemyHousecarlAlias  Auto  

ReferenceAlias Property EnemyStewardAlias  Auto  

Faction Property JarlFaction  Auto  

Faction Property PalaceOccupants  Auto  

ObjectReference Property MapMarker1  Auto  

Actor Property EnemyGuardCommander  Auto  

ReferenceAlias Property EnemyGuardCommanderAlias  Auto  

ReferenceAlias Property JarlKid1Alias  Auto  

ReferenceAlias Property JarlKid2Alias  Auto  

ReferenceAlias Property JarlKid3Alias  Auto  

ReferenceAlias Property JarlBrotherAlias  Auto  

FormList Property MarkersImp  Auto  

FormList Property MarkersSons  Auto  

Faction Property CS_AttackingVillageFaction  Auto  

Location[] Property LocationsInMainHold  Auto  

MiscObject Property Gold001  Auto  

ObjectReference Property ExileMarker  Auto  

FormList Property MapMarkers  Auto  

ObjectReference Property TriggerBoxActivator  Auto  

ObjectReference Property CapitalFires1  Auto  

ObjectReference Property CapitalDoor  Auto  

ReferenceAlias Property EnemyJarlKid1  Auto  

ReferenceAlias Property EnemyJarlKid2  Auto  

ObjectReference Property SceneTrigger1  Auto  

FormList Property CityDefenders  Auto  

Faction Property GovSons  Auto  

Faction Property GovImperial  Auto  

Faction Property CWImperialFaction  Auto  

Faction Property CWSonsFaction  Auto  


Quest Property ConclusionQuest  Auto  

ObjectReference Property GarrisonMarkerSons  Auto  
