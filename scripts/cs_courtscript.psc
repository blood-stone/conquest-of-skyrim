;/ Decompiled by Champollion V1.0.1
Source   : CS_CourtScript.psc
Modified : 2022-04-22 10:28:26
Compiled : 2022-04-22 10:28:28
User     : Emilio
Computer : DESKTOP-EH9BGO7
/;
scriptName CS_CourtScript extends Quest

;-- Properties --------------------------------------
scene property StewardForceGreetScene auto
Quest property ExecutionQuest auto
referencealias[] property Stewards auto
formlist property AllLocations auto
cs_prisonscript property PrisonScript auto
referencealias property Steward auto
referencealias[] property Thrones auto
referencealias property ChoppingBlock auto
keyword property JarlManage auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function StartExecution(Actor Victim)

	ChoppingBlock.GetReference().enable(false)
	ExecutionQuest.Start()
	Int i = 0
	Int FoundAlias = 0
	while i < (ExecutionQuest as cs_executionscript).Executionees.length && FoundAlias == 0
		if (ExecutionQuest as cs_executionscript).Executionees[i].GetActorRef() == none
			(ExecutionQuest as cs_executionscript).Executionees[i].ForceRefTo(Victim as ObjectReference)
			FoundAlias = 1
			i = (ExecutionQuest as cs_executionscript).Executionees.length
		endIf
		i += 1
	endWhile
	if FoundAlias == 0
		debug.notification("There are too many prisoners getting executed right now!")
	endIf
endFunction

function StewardStart(Int citynum)

	if citynum != -1
		Steward.ForceRefTo(Stewards[citynum].GetActorRef() as ObjectReference)
		StewardForceGreetScene.ForceStart()
	endIf
endFunction

Int function CheckIfThrone(ObjectReference Chair)

	Int i = 0
	Int isthrone = -1
	while i < Thrones.length && isthrone as Bool == false
		if Thrones[i].GetReference() == Chair
			if (AllLocations.GetAt(i) as location).GetKeywordData(JarlManage) == 0 as Float
				isthrone = i
			endIf
		endIf
		i += 1
	endWhile
	return isthrone
endFunction

function ClearPrisonerAlias(Actor Prisoner)

	Int FoundAlias = 0
	Int i = 0
	while i < PrisonScript.PrisonersMarkarth.length && FoundAlias == 0
		if PrisonScript.PrisonersMarkarth[i].GetActorRef() == Prisoner
			PrisonScript.PrisonersMarkarth[i].Clear()
			PrisonScript.PrisonersMarkarth[i].ForceRefTo(none)
			FoundAlias = 1
		elseIf PrisonScript.PrisonersRiften[i].GetActorRef() == Prisoner
			PrisonScript.PrisonersRiften[i].Clear()
			PrisonScript.PrisonersRiften[i].ForceRefTo(none)
			FoundAlias = 1
		elseIf PrisonScript.PrisonersSolitude[i].GetActorRef() == Prisoner
			PrisonScript.PrisonersSolitude[i].Clear()
			PrisonScript.PrisonersSolitude[i].ForceRefTo(none)
			FoundAlias = 1
		elseIf PrisonScript.PrisonersWhiterun[i].GetActorRef() == Prisoner
			PrisonScript.PrisonersWhiterun[i].Clear()
			PrisonScript.PrisonersWhiterun[i].ForceRefTo(none)
			FoundAlias = 1
		elseIf PrisonScript.PrisonersWindhelm[i].GetActorRef() == Prisoner
			PrisonScript.PrisonersWindhelm[i].Clear()
			PrisonScript.PrisonersWindhelm[i].ForceRefTo(none)
			FoundAlias = 1
		elseIf PrisonScript.PrisonersDawnstar[i].GetActorRef() == Prisoner
			PrisonScript.PrisonersDawnstar[i].Clear()
			PrisonScript.PrisonersDawnstar[i].ForceRefTo(none)
			FoundAlias = 1
		elseIf PrisonScript.PrisonersFalkreath[i].GetActorRef() == Prisoner
			PrisonScript.PrisonersFalkreath[i].Clear()
			PrisonScript.PrisonersFalkreath[i].ForceRefTo(none)
			FoundAlias = 1
		elseIf PrisonScript.PrisonersMorthal[i].GetActorRef() == Prisoner
			PrisonScript.PrisonersMorthal[i].Clear()
			PrisonScript.PrisonersMorthal[i].ForceRefTo(none)
			FoundAlias = 1
		elseIf PrisonScript.PrisonersWinterhold[i].GetActorRef() == Prisoner
			PrisonScript.PrisonersWinterhold[i].Clear()
			PrisonScript.PrisonersWinterhold[i].ForceRefTo(none)
			FoundAlias = 1
		endIf
		i += 1
	endWhile
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState
