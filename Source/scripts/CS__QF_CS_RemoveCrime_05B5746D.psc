;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__QF_CS_RemoveCrime_05B5746D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrimeHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CrimeHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int holdnum = AllHolds.Find(Alias_CrimeHold.GetLocation())
if (AllHoldings.GetAt(holdnum) as GlobalVariable).GetValueInt() == 1
	debug.notification("You own this city... Bounty reset to 0")
	(CrimeFactions.GetAt(holdnum) as Faction).SetCrimeGold(0)
	(CrimeFactions.GetAt(holdnum) as Faction).SetCrimeGoldViolent(0)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property CrimeFactions  Auto  

Keyword Property CWOwner  Auto  

FormList Property AllHolds  Auto  

FormList Property AllHoldings  Auto  
