;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_CS_CatapultQuest_050F0F33 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CatapultOp
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CatapultOp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InvadeLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_InvadeLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CatapultOp002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CatapultOp002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CatapultOp003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CatapultOp003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CatapultOp000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CatapultOp000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CatapultOp001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CatapultOp001 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Catapults.SetValue(1)
int i = 0
while i < AllLocations.GetSize()
	Location CityLoc = AllLocations.GetAt(i) as Location
	GlobalVariable CatapultsUsed = CatapultsUsedList.GetAt(i) as GlobalVariable
	if CityLoc == InvadeLocation.GetLocation()
		int catapultnum = 0
		while catapultnum < CatapultsPurchased.GetValue()
			ObjectReference Catapult = CatapultList[i].GetAt(catapultnum) as ObjectReference
			ObjectReference CatapultOp = CatapultOpsList[i].GetAt(catapultnum) as ObjectReference
			Catapult.enable()
			CatapultOp.enable()
			NameChanger.ForceRefTo(CatapultOp)
			NameChanger.Clear()
			CatapultOpsArray[catapultnum].ForceRefTo(CatapultOp)
			catapultnum += 1
		endwhile
		if CatapultsUsed.GetValue() == 0
			(FiresMarkers.GetAt(i) as ObjectReference).enable()
			int index = 0
			int troopdeath = 0
			int totaltroopdeath = utility.randomint(2*CatapultsPurchased.GetValue() as int - 1, 2*CatapultsPurchased.GetValue() as int + 1)
			while troopdeath < totaltroopdeath
				Actor Defender = SiegeDefenders[i].GetAt(index) as Actor
				if Defender.IsDisabled() == 0
					Defender.MoveTo(DeadTroopsMarker)
					Defender.kill()
					troopdeath += 1
				endif
				index += 1
			endwhile
			CatapultsUsed.SetValue(1)
		endif
	endif
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Catapults.SetValue(0)
int i = 0
int catapultnum
while i < 9
	catapultnum = 0
	while catapultnum < CatapultList[i].GetSize()
		ObjectReference Catapult = CatapultList[i].GetAt(catapultnum) as ObjectReference
		ObjectReference CatapultOp = CatapultOpsList[i].GetAt(catapultnum) as ObjectReference
		Catapult.disable()
		CatapultOp.disable()
		CatapultOpsArray[catapultnum].Clear()
		catapultnum += 1
	endwhile
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Catapults  Auto  

FormList[] Property CatapultList  Auto  

FormList[] Property CatapultOpsList  Auto  

FormList Property AllLocations  Auto  

GlobalVariable Property CatapultsPurchased  Auto  

LocationAlias Property InvadeLocation  Auto  

ReferenceAlias[] Property CatapultOpsArray  Auto  

FormList[] Property SiegeDefenders  Auto  

FormList Property CatapultsUsedList  Auto  

FormList Property DeadTroopsArmor  Auto  

FormList Property DeadTroops  Auto  

ObjectReference Property DeadTroopsMarker  Auto  

FormList Property FiresMarkers  Auto  

ReferenceAlias Property NameChanger  Auto  
