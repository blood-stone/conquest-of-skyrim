;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 23
Scriptname CS_WarRebelsScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY Second
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Second Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlWhiterun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlWhiterun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlMorthal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlMorthal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameChanger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameChanger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlSolitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlSolitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlMarkarth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlMarkarth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Capital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Capital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlWindhelm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlWindhelm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackedCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AttackedCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlWinterhold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlWinterhold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlRiften
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlRiften Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlDawnstar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlDawnstar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Leader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Leader Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
int i = AllLocations.Find(Alias_AttackedCity.GetLocation())
if i < 5
	WarScore.Mod(30)
elseif i >= 5 && i < 9
	WarScore.Mod(20)
else
	WarScore.Mod(10)
endif

if AllFortLocations.HasForm(Alias_AttackedCity.GetLocation())
	WarScore.Mod(15)
endif

If Alias_AttackedCity.GetLocation() == Alias_Capital.GetLocation()

	int capitalcitynum = 0
	while capitalcitynum < CapitalPriorityLocations.GetSize()
		if (CapitalPriority.GetAt(capitalcitynum) as GlobalVariable).GetValue() == 70
			Alias_Capital.ForceLocationTo(CapitalPriorityLocations.GetAt(capitalcitynum) as Location)
			Alias_Leader.ForceRefTo((GovQuest as CS_RecruitJarl).JarlAliases[capitalcitynum].GetActorRef())
			capitalcitynum = 100
		endif
		capitalcitynum += 1
	endwhile

	If capitalcitynum == 101
		CapitalChangeMessage.show()
	Else
		SetStage(20)
	EndIf

EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
int citynum = 0
while citynum < AllGarrisonMarkers.GetSize()
	ObjectReference Marker = AllGarrisonMarkers.GetAt(citynum) as ObjectReference
	ObjectReference DefenderMarker = AllSiegeDefenderMarkers.GetAt(citynum) as ObjectReference
	If (AllLocations.GetAt(citynum) as Location).GetKeywordData(CWOwner) == 70
		(AllLocationsCS.GetAt(citynum) as Location).SetKeywordData(Attackable, 0)
		(FortTriggerBoxes.GetAt(citynum) as ObjectReference).disable()
		if citynum == 0 || citynum == 1 || citynum == 3 || citynum == 4
			WarQuests[citynum].SetStage(105)
		elseif citynum == 2
			WarQuests[citynum].SetStage(105)
		elseif citynum >= 5
			WarQuests[citynum].SetStage(105)
			Marker.enable()
		endif
	EndIf
	citynum += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
(LoyaltyQuest as CS_LoyaltyCheckScript).ConvertVanillaToCS(Alias_Capital.GetLocation()).SetKeywordData((LoyaltyQuest as CS_LoyaltyCheckScript).Loyalty, 60)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CS_WarRebelsAttack
Quest __temp = self as Quest
CS_WarRebelsAttack kmyQuest = __temp as CS_WarRebelsAttack
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnRegisterForUpdateGameTime()
Capitulation.show()

Alias_Leader.GetActorRef().StopCombat()
Alias_Second.GetActorRef().StopCombat()
Faction01.SetEnemy(Faction03, true, true)
Faction01.SetEnemy(Faction04, true, true)
PlayerFaction.SetEnemy(Faction03, true, true)
PlayerFaction.SetEnemy(Faction04, true, true)

SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
int citynum = 0
while citynum < AllGarrisonMarkers.GetSize()
	ObjectReference Marker = AllGarrisonMarkers.GetAt(citynum) as ObjectReference
	ObjectReference DefenderMarker = AllSiegeDefenderMarkers.GetAt(citynum) as ObjectReference
	If (AllLocations.GetAt(citynum) as Location).GetKeywordData(CWOwner) == 70
		(AllLocationsCS.GetAt(citynum) as Location).SetKeywordData(Attackable, 0)
		(FortTriggerBoxes.GetAt(citynum) as ObjectReference).disable()
		if citynum < 5
			WarQuests[citynum].SetStage(106)
		elseif citynum >= 5
			WarQuests[citynum].SetStage(106)
			Marker.enable()
		endif
	EndIf
	citynum += 1
endwhile

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_WarRebelsAttack
Quest __temp = self as Quest
CS_WarRebelsAttack kmyQuest = __temp as CS_WarRebelsAttack
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(Faction03)
Game.GetPlayer().RemoveFromFaction(Faction04)
Faction01.SetEnemy(Faction02)
Faction01.SetEnemy(Faction03)
Faction01.SetEnemy(Faction04)
Faction02.SetEnemy(Faction01)
Faction03.SetEnemy(Faction01)
Faction04.SetEnemy(Faction01)
PlayerFaction.SetEnemy(Faction02)
PlayerFaction.SetEnemy(Faction03)
PlayerFaction.SetEnemy(Faction04)
Faction02.SetEnemy(PlayerFaction)
Faction03.SetEnemy(PlayerFaction)
Faction04.SetEnemy(PlayerFaction)
Faction03.SetPlayerEnemy(true)
Faction04.SetPlayerEnemy(true)
Alias_Leader.GetActorRef().MoveTo(LeaderStart)

int citynum = 0
while citynum < AllGarrisonMarkers.GetSize()
	ObjectReference Marker = AllGarrisonMarkers.GetAt(citynum) as ObjectReference
	ObjectReference DefenderMarker = AllSiegeDefenderMarkers.GetAt(citynum) as ObjectReference
	If (AllLocations.GetAt(citynum) as Location).GetKeywordData(CWOwner) == 70
		(AllLocations.GetAt(citynum) as Location).SetKeywordData(CWOwner, 70)
		(AllLocationsCS.GetAt(citynum) as Location).SetKeywordData(Attackable, 1)
		if citynum == 0 || citynum == 1 || citynum == 3 || citynum == 4
			(AllHoldings.GetAt(citynum) as GlobalVariable).SetValue(70)
			WarQuests[citynum].SetStage(10)
			CityCount.SetValue(CityCount.GetValue() + 1)
			(GarrisonsCount.GetAt(citynum) as GlobalVariable).SetValue(100)
			;DefenderMarker.enable()
			SetObjectiveDisplayed(citynum)
		elseif citynum == 2
			(AllHoldings.GetAt(citynum) as GlobalVariable).SetValue(70)
			WarQuests[citynum].SetStage(10)
			CityCount.SetValue(CityCount.GetValue() + 1)
			(GarrisonsCount.GetAt(citynum) as GlobalVariable).SetValue(140)
			;DefenderMarker.enable()
			SetObjectiveDisplayed(citynum)
		elseif citynum >= 5
			(AllHoldings.GetAt(citynum) as GlobalVariable).SetValue(70)
			WarQuests[citynum].SetStage(10)
			MinorCityCount.SetValue(MinorCityCount.GetValue() + 1)
			(GarrisonsCount.GetAt(citynum) as GlobalVariable).SetValue(60)
			SetObjectiveDisplayed(citynum)
			Marker.disable()
		endif
	EndIf
	citynum += 1
endwhile

int capitalcitynum = 0
while capitalcitynum < CapitalPriorityLocations.GetSize()
	if (CapitalPriority.GetAt(capitalcitynum) as GlobalVariable).GetValue() == 70
		Alias_Capital.ForceLocationTo(CapitalPriorityLocations.GetAt(capitalcitynum) as Location)
		capitalcitynum = 10
	endif
	capitalcitynum += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
int i = 0
int CaptureNum = 0
while i < HoldingsInMainHold.Length
	if HoldingsInMainHold[i].GetValue() == 1
		CaptureNum += 1
	endif
	i += 1
endwhile

if CaptureNum == HoldingsInMainHold.Length
	SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property Faction01  Auto  

Faction Property Faction02  Auto  

Faction Property Faction03  Auto  

Faction Property Faction04  Auto  

Faction Property PlayerFaction  Auto  

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property NextRespawn  Auto  

GlobalVariable Property CityCount  Auto  

GlobalVariable Property FortCount  Auto  

GlobalVariable Property TotalFactionTroops  Auto  

GlobalVariable Property AttackTroopNum  Auto  

GlobalVariable[] Property HoldingsInMainHold  Auto  

GlobalVariable[] Property PlayerGarrisonsInMainHold  Auto  

Quest Property RelationsQuest  Auto  

Location[] Property AttackedLocation  Auto  

GlobalVariable Property attackStart  Auto  

Message Property Capitulation  Auto  

FormList Property MarkersImp  Auto  

FormList Property MarkersSons  Auto  


Quest Property DefendQuest  Auto  

ReferenceAlias[] Property AttackerRefs  Auto  

Faction Property CS_AttackingVillageFaction  Auto  

GlobalVariable Property AttackerCount  Auto  

Location[] Property LocationsInMainHold  Auto  

LocationAlias Property DefendLocationAlias  Auto  

ReferenceAlias Property TriggerBoxAlias  Auto  

ObjectReference Property ExileMarker  Auto  

FormList Property AllGarrisonMarkers  Auto  

FormList Property AllSiegeDefenderMarkers  Auto  

Quest[] Property WarQuests  Auto  

ReferenceAlias[] Property JarlsInitial  Auto  

ReferenceAlias[] Property Jarls  Auto  

ObjectReference Property LeaderStart  Auto  

Quest Property CWQuest  Auto  

Quest Property CWObj  Auto  

GlobalVariable Property MinorCityCount  Auto  

FormList Property GarrisonsCount  Auto  

FormList Property FortHoldings  Auto  

FormList Property FortMarkers  Auto  

FormList Property FortMarkersMonster  Auto  

FormList Property FortTriggerBoxes  Auto  

Quest Property CW  Auto  


FormList Property GarrisonsFortCount  Auto  

FormList Property AllHoldings  Auto  

FormList Property CapitalPriority  Auto  

FormList Property CapitalPriorityLocations  Auto  

Message Property CapitalChangeMessage  Auto  


Faction Property CWImperialFaction  Auto  

Faction Property CWImperialNPCFaction  Auto  

Quest Property GovQuest  Auto  

FormList Property AllLocations  Auto  

GlobalVariable Property WarScore  Auto  

FormList Property AllFortLocations  Auto  

Keyword Property CWOwner  Auto  

Quest Property BorderQuest  Auto  

Quest Property EconReport  Auto  

GlobalVariable Property DefeatedGlobal  Auto  

Quest Property LoyaltyQuest  Auto  

FormList Property AllLocationsCS  Auto  

Keyword Property Attackable  Auto  
