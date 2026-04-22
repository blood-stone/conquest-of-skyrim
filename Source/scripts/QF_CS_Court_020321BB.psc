;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_CS_Court_020321BB Extends Quest Hidden

;BEGIN ALIAS PROPERTY CriminalDetach
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CriminalDetach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Executioner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Executioner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrisonMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TaskCommander
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TaskCommander Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThroneMorthal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThroneMorthal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThroneFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThroneFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExecutionGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExecutionGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CriminalDetach003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CriminalDetach003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThroneWindhelm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThroneWindhelm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Throne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Throne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CriminalDetach004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CriminalDetach004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CriminalDetach001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CriminalDetach001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourtCityVanilla
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CourtCityVanilla Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThroneWhiterun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThroneWhiterun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Prisoner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Prisoner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThroneMarkarth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThroneMarkarth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThroneRiften
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThroneRiften Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bailiff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bailiff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourtCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CourtCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThroneSolitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThroneSolitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChoppingBlock
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChoppingBlock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourtPrison
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CourtPrison Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Executionee
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Executionee Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThroneWinterhold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThroneWinterhold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionName
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThroneDawnstar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThroneDawnstar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PrisonerGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PrisonerGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CriminalDetach002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CriminalDetach002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CriminalDetach000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CriminalDetach000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BountyHunter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BountyHunter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenLeaving
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenLeaving Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourtCityPalace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CourtCityPalace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourtQuestLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CourtQuestLocation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
int i = 0
int randomnum = 0
while i < AllLocations.GetSize()
	Location City = AllLocations.GetAt(i) as Location
	If Alias_Steward.GetActorRef().IsInLocation(City) == 1
		int index = 0
		while index == 0
			randomnum = Utility.RandomInt(0, CityResidents[i].GetSize() - 1)
			Actor Resident = CityResidents[i].GetAt(randomnum) as Actor
			If Resident.IsDead() == 0
				If Resident.IsInFaction(GovFaction) == 0
					If Resident.IsInFaction(PrisonerFaction) == 0
						If Resident.IsChild() == 0
							Alias_Citizen1.ForceRefTo(Resident)
							index = 1
						EndIf
					EndIf
				EndIf
			EndIf
		endwhile
		index = 0
		while index == 0
			randomnum = Utility.RandomInt(0, CityResidents[i].GetSize() - 1)
			Actor Resident2 = CityResidents[i].GetAt(randomnum) as Actor
			If Resident2.IsDead() == 0
				If Resident2.IsInFaction(GovFaction) == 0
					If Resident2.IsInFaction(PrisonerFaction) == 0
						If Resident2.IsChild() == 0
							Alias_Citizen2.ForceRefTo(Resident2)
							index = 1
						EndIf
					EndIf
				EndIf
			EndIf
		endwhile
		if Alias_Bailiff.GetReference() == None
			index = 0
			while index < CityGuards[i].GetSize()
				Actor Bailiff = CityGuards[i].GetAt(index) as Actor
				if Bailiff.IsDead() == 0
					if ArrestingGuard.GetActorRef() != Bailiff
						Alias_Bailiff.ForceRefTo(Bailiff)
						index = CityGuards[i].GetSize()
					endif
				endif
				index += 1
			endwhile
		endif
		CasesHeard.SetValue(CasesHeard.GetValue() + 1)
	EndIf
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CS_CourtScript
Quest __temp = self as Quest
CS_CourtScript kmyQuest = __temp as CS_CourtScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetUpThrones()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property AllLocations  Auto  

FormList[] Property CityResidents  Auto  

Faction Property GovFaction Auto

Faction Property PrisonerFaction Auto

FormList[] Property CityGuards  Auto  

Scene Property CitizenSceneCity Auto

Scene Property CitizenSceneVillage Auto

GlobalVariable Property CasesHeard  Auto  

ReferenceAlias Property ArrestingGuard  Auto  

Faction[] Property VillageFactions  Auto  
