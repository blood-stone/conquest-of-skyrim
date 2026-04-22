;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname CS_QF__0529FD9B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Defender15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY defender
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_defender Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Village
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Village Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker20 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TriggerBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TriggerBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender20 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
Alias_Attacker.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker2.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker3.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker4.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker5.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker6.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker7.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker8.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker9.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker10.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker11.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker12.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker13.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker14.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker15.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker16.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker17.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker18.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker19.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker20.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)

Alias_Defender.Clear()
Alias_Defender2.Clear()
Alias_Defender3.Clear()
Alias_Defender4.Clear()
Alias_Defender5.Clear()
Alias_Defender6.Clear()
Alias_Defender7.Clear()
Alias_Defender8.Clear()
Alias_Defender9.Clear()
Alias_Defender10.Clear()
Alias_Defender11.Clear()
Alias_Defender12.Clear()
Alias_Defender13.Clear()
Alias_Defender14.Clear()
Alias_Defender15.Clear()
Alias_Defender16.Clear()
Alias_Defender17.Clear()
Alias_Defender18.Clear()
Alias_Defender19.Clear()
Alias_Defender20.Clear()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
RegisterForUpdateGameTime(0.5)
TroopDeath.SetValue(0)
PercentRemaining.SetValue(100)
PercentRemainingTrue.SetValue(100)
UpdateCurrentInstanceGlobal(TroopDeath)
UpdateCurrentInstanceGlobal(AttackerCount)
UpdateCurrentInstanceGlobal(PercentRemaining)
SetObjectiveDisplayed(0, true)
EndFunction

Event OnUpdateGameTime()
	If Game.GetPlayer().IsInLocation(Alias_Village.GetLocation()) == 0
		If TroopDeath.GetValue() != AttackerCount.GetValue()
			SetStage(100)
			Alias_TriggerBox.GetReference().enable()
		Else
			SetStage(500)
		EndIf
	EndIf
EndEvent

Function BugFixMaybe()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
int i = 0
while i < AllLocations.GetSize()
	Location VillageLoc = AllLocations.GetAt(i) as Location
	GlobalVariable VillageHolding = AllHoldings.GetAt(i) as GlobalVariable
	GlobalVariable TaxTime = AllTaxTimes.GetAt(i) as GlobalVariable
	ObjectReference CaptureMarker = CaptureMarkers.GetAt(i) as ObjectReference
	ObjectReference ImpMarker = GarrisonMarkersImp.GetAt(i) as ObjectReference
	ObjectReference SonsMarker = GarrisonMarkersSons.GetAt(i) as ObjectReference
	If Alias_Village.GetLocation() == VillageLoc
		If (AllLocations.GetAt(0) as Location).GetKeywordData(CWOwner) == 1
			VillageHolding.SetValue(11)
			VillageLoc.SetKeywordData(CWOwner, 1)
			ImpMarker.enable()
		ElseIf (AllLocations.GetAt(0) as Location).GetKeywordData(CWOwner) == 2
			VillageHolding.SetValue(12)
			VillageLoc.SetKeywordData(CWOwner, 2)
			SonsMarker.enable()
		ElseIf (AllLocations.GetAt(0) as Location).GetKeywordData(CWOwner) == 70
			VillageHolding.SetValue(70)
			VillageLoc.SetKeywordData(CWOwner, 70)
		EndIf
		(GovQuest as CS_RecruitJarl).FireJarlSpecific(i)
		CaptureMarker.disable()
		PlayerVillageCount.SetValue(PlayerVillageCount.GetValue() - 1)
		int index = 0
		while index < (AllGuardFormLists.GetAt(i) as FormList).GetSize()
			Actor Guard = (AllGuardFormLists.GetAt(i) as FormList).GetAt(index) as Actor
			Guard.kill()
			Guard.disable()
			index += 1
		endwhile
	endIf
	i += 1
endwhile

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
TroopDeath.SetValue(TroopDeath.GetValue() + 1)
float percentchange = 100*(1/(AttackerCount.GetValue())) as float
PercentRemainingTrue.SetValue(PercentRemainingTrue.GetValue() - percentchange)
percentchange = (PercentRemaining.GetValue() - PercentRemainingTrue.GetValue()) as int

if TroopDeath.GetValue() == AttackerCount.GetValue()
	SetStage(500)
endif

if TroopDeath.GetValue() == AttackerCount.GetValue()
	PercentRemaining.SetValue(0)
	percentchange = 0
	UpdateCurrentInstanceGlobal(PercentRemaining)
	SetObjectiveCompleted(0)
endif

if percentchange >= 30 && PercentRemainingTrue.GetValue() > 0
	ModObjectiveGlobal(-percentchange, PercentRemaining, 0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
Alias_Attacker.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker2.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker3.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker4.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker5.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker6.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker7.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker8.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker9.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker10.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker11.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker12.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker13.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker14.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker15.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker16.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker17.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker18.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker19.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker20.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)

Alias_Defender.Clear()
Alias_Defender2.Clear()
Alias_Defender3.Clear()
Alias_Defender4.Clear()
Alias_Defender5.Clear()
Alias_Defender6.Clear()
Alias_Defender7.Clear()
Alias_Defender8.Clear()
Alias_Defender9.Clear()
Alias_Defender10.Clear()
Alias_Defender11.Clear()
Alias_Defender12.Clear()
Alias_Defender13.Clear()
Alias_Defender14.Clear()
Alias_Defender15.Clear()
Alias_Defender16.Clear()
Alias_Defender17.Clear()
Alias_Defender18.Clear()
Alias_Defender19.Clear()
Alias_Defender20.Clear()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Fail

Alias_Attacker.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker2.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker3.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker4.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker5.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker6.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker7.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker8.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker9.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker10.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker11.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker12.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker13.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker14.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker15.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker16.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker17.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker18.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker19.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)
Alias_Attacker20.GetActorRef().RemoveFromFaction(CS_AttackingVillageFaction)

Alias_Attacker.Clear()
Alias_Attacker2.Clear()
Alias_Attacker3.Clear()
Alias_Attacker4.Clear()
Alias_Attacker5.Clear()
Alias_Attacker6.Clear()
Alias_Attacker7.Clear()
Alias_Attacker8.Clear()
Alias_Attacker9.Clear()
Alias_Attacker10.Clear()
Alias_Attacker11.Clear()
Alias_Attacker12.Clear()
Alias_Attacker13.Clear()
Alias_Attacker14.Clear()
Alias_Attacker15.Clear()
Alias_Attacker16.Clear()
Alias_Attacker17.Clear()
Alias_Attacker18.Clear()
Alias_Attacker19.Clear()
Alias_Attacker20.Clear()


int i = 0
while i < AllLocations.GetSize()
	Location VillageLoc = AllLocations.GetAt(i) as Location
	GlobalVariable VillageHolding = AllHoldings.GetAt(i) as GlobalVariable
	GlobalVariable TaxTime = AllTaxTimes.GetAt(i) as GlobalVariable
	ObjectReference CaptureMarker = CaptureMarkers.GetAt(i) as ObjectReference
	ObjectReference ImpMarker = GarrisonMarkersImp.GetAt(i) as ObjectReference
	ObjectReference SonsMarker = GarrisonMarkersSons.GetAt(i) as ObjectReference
	If Alias_Village.GetLocation() == VillageLoc
		VillageHolding.SetValue(7)
		CaptureMarker.disable()
		PlayerVillageCount.SetValue(PlayerVillageCount.GetValue() - 1)
		Alias_TriggerBox.GetReference().enable()
	endIf
	i += 1
endwhile

TroopDeath.SetValue(0)
AttackerCount.SetValue(0)
Alias_Village.Clear()
Alias_TriggerBox.Clear()

SetStage(501)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property AttackerCount  Auto  

FormList Property AllHoldings  Auto  

FormList Property AllLocations  Auto  

FormList Property AllTaxTimes  Auto  

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property PlayerVillageCount  Auto  

GlobalVariable Property EnemyVillageCount  Auto  

ObjectReference Property MarkerImp  Auto  

ObjectReference Property MarkerSons  Auto  

ObjectReference Property MarkerPlayer  Auto  

FormList Property CaptureMarkers  Auto  

GlobalVariable Property TroopDeath  Auto  

FormList Property GarrisonMarkersImp  Auto  

FormList Property GarrisonMarkersSons  Auto  

Quest[] Property WarQuest  Auto  

GlobalVariable Property HoldingValueVillage1  Auto  

Faction Property CS_AttackingVillageFaction  Auto  

GlobalVariable Property PercentRemaining  Auto  

GlobalVariable Property PercentRemainingTrue  Auto  

Keyword Property CWOwner  Auto  

Quest Property GovQuest  Auto  

FormList Property AllGuardFormLists  Auto  
