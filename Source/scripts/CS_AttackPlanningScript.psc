Scriptname CS_AttackPlanningScript extends Quest  

ReferenceAlias[] Property AttackCommanders Auto
ReferenceAlias[] Property Attacker Auto
ReferenceAlias Property MeetUpMarker Auto

ReferenceAlias Property Jarl Auto
ReferenceAlias Property Steward Auto
ReferenceAlias Property Housecarl Auto
ReferenceAlias Property Wizard Auto
ReferenceAlias Property GuardCaptain Auto
ReferenceAlias Property StopCombatAlias Auto
ReferenceAlias Property AttackMarker Auto

ReferenceAlias Property JarlM Auto
ReferenceAlias Property StewardM Auto
ReferenceAlias Property HousecarlM Auto
ReferenceAlias Property WizardM Auto
ReferenceAlias Property GuardCaptainM Auto
ReferenceAlias Property StopCombatAliasM Auto
ReferenceAlias Property AttackMarkerM Auto

Quest Property CommanderQuest Auto
Quest Property CityAttackQuest Auto
Quest Property MinorCityAttackQuest Auto
Quest Property PlanningQuest Auto

CS_PatrolHoldScript Property AttackQuest Auto
CS_TroopManageMenuScript Property ManageArmy Auto
CS_GovPositions Property GovPositions Auto

Keyword Property CWOwner Auto

Faction Property AttackFaction Auto
Faction Property FollowerFaction Auto

FormList Property AttackStartMarkers Auto
FormList Property AllLocations Auto
FormList Property AttackArmies Auto
FormList Property StopCombat Auto
FormList Property AttackTroops Auto

LocationAlias Property AttackLocation Auto
LocationAlias Property CityLocationAlias Auto
LocationAlias Property MinorCityLocationAlias Auto

FormList Property ArmySelection1 Auto
FormList Property ArmySelection2 Auto
FormList Property ArmySelection3 Auto
FormList Property ArmySelection4 Auto
FormList Property ArmySelection5 Auto
FormList Property ArmySelection6 Auto

Function ArmySelectMenu1(int Response = 0)
	UpdateCurrentInstanceGlobal(TotalTroops)
	Response = (ArmySelection1.GetAt(ArmyCount.GetValue() as int) as Message).show()
	if Response < 5
		AttackCommanders[ArmyCount.GetValue() as int].ForceRefTo(AttackQuest.Commanders[Response].GetActorRef())
		AttackCommanders[ArmyCount.GetValue() as int].GetActorRef().AddToFaction(AttackFaction)
		(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable).SetValue((ManageArmy.TroopCounts.GetAt(Response) as GlobalVariable).GetValue())
		UpdateCurrentInstanceGlobal(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable)
		ArmyCount.Mod(1)
		(AttackArmies.GetAt(Response) as GlobalVariable).SetValue(1)
		TotalTroops.Mod((ManageArmy.TroopCounts.GetAt(Response) as GlobalVariable).GetValue())
		ArmySelectMenu1()
	elseif Response == 5
		ArmySelectMenu2()
	else
		SetObjectiveDisplayed(0)
	endif
EndFunction

Function ArmySelectMenu2(int Response = 0)
	UpdateCurrentInstanceGlobal(TotalTroops)
	Response = (ArmySelection2.GetAt(ArmyCount.GetValue() as int) as Message).show()
	if Response == 0
		ArmySelectMenu1()
	elseif Response > 0 && Response < 6
		AttackCommanders[ArmyCount.GetValue() as int].ForceRefTo(AttackQuest.Commanders[Response + 4].GetActorRef())
		AttackCommanders[ArmyCount.GetValue() as int].GetActorRef().AddToFaction(AttackFaction)
		(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable).SetValue((ManageArmy.TroopCounts.GetAt(Response + 4) as GlobalVariable).GetValue())
		UpdateCurrentInstanceGlobal(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable)
		ArmyCount.Mod(1)
		(AttackArmies.GetAt(Response + 4) as GlobalVariable).SetValue(1)
		TotalTroops.Mod((ManageArmy.TroopCounts.GetAt(Response + 4) as GlobalVariable).GetValue())
		ArmySelectMenu2()
	elseif Response == 6
		ArmySelectMenu3()
	else
		SetObjectiveDisplayed(0)
	endif
EndFunction

Function ArmySelectMenu3(int Response = 0)
	UpdateCurrentInstanceGlobal(TotalTroops)
	Response = (ArmySelection3.GetAt(ArmyCount.GetValue() as int) as Message).show()
	if Response == 0
		ArmySelectMenu2()
	elseif Response > 0 && Response < 6
		AttackCommanders[ArmyCount.GetValue() as int].ForceRefTo(AttackQuest.Commanders[Response + 9].GetActorRef())
		AttackCommanders[ArmyCount.GetValue() as int].GetActorRef().AddToFaction(AttackFaction)
		(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable).SetValue((ManageArmy.TroopCounts.GetAt(Response + 9) as GlobalVariable).GetValue())
		UpdateCurrentInstanceGlobal(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable)
		ArmyCount.Mod(1)
		(AttackArmies.GetAt(Response + 9) as GlobalVariable).SetValue(1)
		TotalTroops.Mod((ManageArmy.TroopCounts.GetAt(Response + 9) as GlobalVariable).GetValue())
		ArmySelectMenu3()
	elseif Response == 6
		ArmySelectMenu4()
	else
		SetObjectiveDisplayed(0)
	endif
EndFunction

Function ArmySelectMenu4(int Response = 0)
	UpdateCurrentInstanceGlobal(TotalTroops)
	Response = (ArmySelection4.GetAt(ArmyCount.GetValue() as int) as Message).show()
	if Response == 0
		ArmySelectMenu3()
	elseif Response > 0 && Response < 6
		AttackCommanders[ArmyCount.GetValue() as int].ForceRefTo(AttackQuest.Commanders[Response + 14].GetActorRef())
		AttackCommanders[ArmyCount.GetValue() as int].GetActorRef().AddToFaction(AttackFaction)
		(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable).SetValue((ManageArmy.TroopCounts.GetAt(Response + 14) as GlobalVariable).GetValue())
		UpdateCurrentInstanceGlobal(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable)
		ArmyCount.Mod(1)
		(AttackArmies.GetAt(Response + 14) as GlobalVariable).SetValue(1)
		TotalTroops.Mod((ManageArmy.TroopCounts.GetAt(Response + 14) as GlobalVariable).GetValue())
		ArmySelectMenu4()
	elseif Response == 6
		ArmySelectMenu5()
	else
		SetObjectiveDisplayed(0)
	endif
EndFunction

Function ArmySelectMenu5(int Response = 0)
	UpdateCurrentInstanceGlobal(TotalTroops)
	Response = (ArmySelection5.GetAt(ArmyCount.GetValue() as int) as Message).show()
	if Response == 0
		ArmySelectMenu4()
	elseif Response > 0 && Response < 6
		AttackCommanders[ArmyCount.GetValue() as int].ForceRefTo(AttackQuest.Commanders[Response + 19].GetActorRef())
		AttackCommanders[ArmyCount.GetValue() as int].GetActorRef().AddToFaction(AttackFaction)
		(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable).SetValue((ManageArmy.TroopCounts.GetAt(Response + 19) as GlobalVariable).GetValue())
		UpdateCurrentInstanceGlobal(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable)
		ArmyCount.Mod(1)
		(AttackArmies.GetAt(Response + 19) as GlobalVariable).SetValue(1)
		TotalTroops.Mod((ManageArmy.TroopCounts.GetAt(Response + 19) as GlobalVariable).GetValue())
		ArmySelectMenu5()
	elseif Response == 6
		ArmySelectMenu6()
	else
		SetObjectiveDisplayed(0)
	endif
EndFunction

Function ArmySelectMenu6(int Response = 0)
	UpdateCurrentInstanceGlobal(TotalTroops)
	Response = (ArmySelection6.GetAt(ArmyCount.GetValue() as int) as Message).show()
	if Response == 0
		ArmySelectMenu5()
	elseif Response > 0 && Response < 6
		AttackCommanders[ArmyCount.GetValue() as int].ForceRefTo(AttackQuest.Commanders[Response + 24].GetActorRef())
		AttackCommanders[ArmyCount.GetValue() as int].GetActorRef().AddToFaction(AttackFaction)
		(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable).SetValue((ManageArmy.TroopCounts.GetAt(Response + 24) as GlobalVariable).GetValue())
		UpdateCurrentInstanceGlobal(AttackPlanningTroopCounts.GetAt(ArmyCount.GetValue() as int) as GlobalVariable)
		ArmyCount.Mod(1)
		(AttackArmies.GetAt(Response + 24) as GlobalVariable).SetValue(1)
		TotalTroops.Mod((ManageArmy.TroopCounts.GetAt(Response + 24) as GlobalVariable).GetValue())
		ArmySelectMenu6()
	else
		SetObjectiveDisplayed(0)
	endif
EndFunction

Function SetUpMeetUpMarker()
	int i = 0
	while i < AllLocations.GetSize()
		if AllLocations.GetAt(i) as Location == AttackLocation.GetLocation()
			MeetUpMarker.ForceRefTo(AttackStartMarkers.GetAt(i) as ObjectReference)
		endif
		i += 1
	endwhile
EndFunction

Function SetUpCommanderMarker()
	int armynum = 0
	while armynum < AttackQuest.Commanders.Length
		If AttackQuest.Commanders[armynum].GetActorRef().IsInFaction(AttackFaction) == 1
			(CommanderQuest as CS_PatrolHoldScript).ClearFactions(AttackQuest.Commanders[armynum].GetActorRef())
			AttackQuest.Commanders[armynum].GetActorRef().RemoveFromFaction(AttackFaction)
			AttackQuest.Commanders[armynum].GetActorRef().EvaluatePackage()
			AttackQuest.AttackMarkerAliases[armynum].ForceRefTo(MeetUpMarker.GetReference())
			AttackQuest.Commanders[armynum].GetActorRef().AddToFaction(AttackFaction)
			AttackQuest.Commanders[armynum].GetActorRef().EvaluatePackage()
		endIf
		armynum += 1
	endwhile
	int i = 0
	while i < AttackerSpots.Length
		AttackerSpots[i].ForceRefTo((AttackerSpotRefs.GetAt(AllLocations.Find(AttackLocation.GetLocation())) as FormList).GetAt(i) as ObjectReference)
		i += 1
	endwhile
EndFunction

Function MoveToCommanderMarker()
	int armynum = 0
	while armynum < AttackQuest.Commanders.Length
		If AttackQuest.Commanders[armynum].GetActorRef().IsInFaction(AttackFaction) == 1
			AttackQuest.Commanders[armynum].GetActorRef().MoveTo(MeetUpMarker.GetReference())
		endIf
		armynum += 1
	endwhile
	int troopnum = 0
	while troopnum < AttackTroops.GetSize()
		if (AttackTroops.GetAt(troopnum) as Actor).IsDisabled() == 0
			(AttackTroops.GetAt(troopnum) as Actor).MoveTo(AttackerSpots[troopnum].GetReference())
		endif
		troopnum += 1
	endwhile
EndFunction

Function AssignTroops()
	AttackTroops.Revert()
	int armynum = 0
	while armynum < AttackQuest.Commanders.Length
			If AttackQuest.Commanders[armynum].GetActorRef().IsInFaction(AttackFaction) == 1
				if armynum == 0
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops1.Length
						If ManageArmy.ArmyTroops1[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops1[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 1
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops2.Length
						If ManageArmy.ArmyTroops2[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops2[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 2
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops3.Length
						If ManageArmy.ArmyTroops3[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops3[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 3
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops4.Length
						If ManageArmy.ArmyTroops4[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops4[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 4
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops5.Length
						If ManageArmy.ArmyTroops5[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops5[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 5
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops6.Length
						If ManageArmy.ArmyTroops6[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops6[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 6
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops7.Length
						If ManageArmy.ArmyTroops7[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops7[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 7
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops8.Length
						If ManageArmy.ArmyTroops8[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops8[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 8
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops9.Length
						If ManageArmy.ArmyTroops9[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops9[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 9
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops10.Length
						If ManageArmy.ArmyTroops10[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops10[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				ElseIf armynum == 10
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops11.Length
						If ManageArmy.ArmyTroops11[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops11[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 11
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops12.Length
						If ManageArmy.ArmyTroops12[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops12[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 12
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops13.Length
						If ManageArmy.ArmyTroops13[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops13[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 13
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops14.Length
						If ManageArmy.ArmyTroops14[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops14[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 14
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops15.Length
						If ManageArmy.ArmyTroops15[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops15[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 15
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops16.Length
						If ManageArmy.ArmyTroops16[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops16[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 16
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops17.Length
						If ManageArmy.ArmyTroops17[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops17[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 17
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops18.Length
						If ManageArmy.ArmyTroops18[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops18[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 18
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops19.Length
						If ManageArmy.ArmyTroops19[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops19[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 19
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops20.Length
						If ManageArmy.ArmyTroops20[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops20[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 20
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops21.Length
						If ManageArmy.ArmyTroops21[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops21[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 21
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops22.Length
						If ManageArmy.ArmyTroops22[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops22[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 22
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops23.Length
						If ManageArmy.ArmyTroops23[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops23[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 23
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops24.Length
						If ManageArmy.ArmyTroops24[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops24[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 24
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops25.Length
						If ManageArmy.ArmyTroops25[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops25[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 25
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops26.Length
						If ManageArmy.ArmyTroops26[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops26[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 26
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops27.Length
						If ManageArmy.ArmyTroops27[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops27[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 27
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops28.Length
						If ManageArmy.ArmyTroops28[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops28[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 28
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops29.Length
						If ManageArmy.ArmyTroops29[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops29[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 29
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops30.Length
						If ManageArmy.ArmyTroops30[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops30[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				endif
			EndIf
		armynum += 1
	endwhile
	int i = 0
	while i < AttackTroops.GetSize()
		(AttackTroops.GetAt(i) as Actor).RemoveFromFaction(AttackFaction)
		i += 1
	endwhile
EndFunction

Function AddFollowCommander()
	int armynum = 0
	while armynum < AttackQuest.Commanders.Length
			If AttackQuest.Commanders[armynum].GetActorRef().IsInFaction(FollowerFaction) == 1
				(CommanderQuest as CS_PatrolHoldScript).StopFollowPlayer(AttackQuest.Commanders[armynum].GetActorRef())
				AttackQuest.Commanders[armynum].GetActorRef().AddToFaction(AttackFaction)
				AttackCommanders[ArmyCount.GetValue() as int].ForceRefTo(AttackQuest.Commanders[armynum].GetActorRef())
				ArmyCount.Mod(1)
				SetUpCommanderMarker()
				if armynum == 0
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops1.Length
						If ManageArmy.ArmyTroops1[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops1[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 1
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops2.Length
						If ManageArmy.ArmyTroops2[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops2[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 2
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops3.Length
						If ManageArmy.ArmyTroops3[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops3[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 3
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops4.Length
						If ManageArmy.ArmyTroops4[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops4[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 4
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops5.Length
						If ManageArmy.ArmyTroops5[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops5[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 5
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops6.Length
						If ManageArmy.ArmyTroops6[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops6[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 6
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops7.Length
						If ManageArmy.ArmyTroops7[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops7[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 7
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops8.Length
						If ManageArmy.ArmyTroops8[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops8[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 8
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops9.Length
						If ManageArmy.ArmyTroops9[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops9[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				elseif armynum == 9
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops10.Length
						If ManageArmy.ArmyTroops10[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops10[troopnum].GetActorRef())
						endif
						troopnum += 1
					endwhile
				ElseIf armynum == 10
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops11.Length
						If ManageArmy.ArmyTroops11[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops11[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 11
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops12.Length
						If ManageArmy.ArmyTroops12[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops12[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 12
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops13.Length
						If ManageArmy.ArmyTroops13[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops13[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 13
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops14.Length
						If ManageArmy.ArmyTroops14[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops14[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 14
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops15.Length
						If ManageArmy.ArmyTroops15[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops15[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 15
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops16.Length
						If ManageArmy.ArmyTroops16[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops16[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 16
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops17.Length
						If ManageArmy.ArmyTroops17[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops17[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 17
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops18.Length
						If ManageArmy.ArmyTroops18[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops18[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 18
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops19.Length
						If ManageArmy.ArmyTroops19[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops19[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 19
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops20.Length
						If ManageArmy.ArmyTroops20[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops20[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 20
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops21.Length
						If ManageArmy.ArmyTroops21[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops21[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 21
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops22.Length
						If ManageArmy.ArmyTroops22[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops22[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 22
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops23.Length
						If ManageArmy.ArmyTroops23[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops23[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 23
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops24.Length
						If ManageArmy.ArmyTroops24[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops24[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 24
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops25.Length
						If ManageArmy.ArmyTroops25[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops25[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 25
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops26.Length
						If ManageArmy.ArmyTroops26[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops26[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 26
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops27.Length
						If ManageArmy.ArmyTroops27[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops27[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 27
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops28.Length
						If ManageArmy.ArmyTroops28[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops28[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 28
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops29.Length
						If ManageArmy.ArmyTroops29[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops29[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				ElseIf armynum == 29
					int troopnum = 0
					while troopnum < ManageArmy.ArmyTroops30.Length
						If ManageArmy.ArmyTroops30[troopnum].GetActorRef() != None
							AttackTroops.AddForm(ManageArmy.ArmyTroops30[troopnum].GetActorRef())
						EndIf
						troopnum += 1
					endwhile
				endif
				DisableReinforcements()
			EndIf
		armynum += 1
	endwhile
EndFunction

Function AddAttackersToAliases()
	int i = 0
	while i < 20
		Attacker[i].ForceRefTo(AttackTroops.GetAt(i) as Actor)
		If Attacker[i].GetActorRef().IsDisabled() == 1
			Attacker[i].GetActorRef().enable()
		EndIf
		Attacker[i].GetActorRef().AddToFaction(AttackFaction)
		(UpgradeQuest as CS_UpgradeTroopsMenu).UpgradeTroop(Attacker[i].GetActorRef())
		i += 1
	endwhile
EndFunction

Function UpgradeAttackers()
	int i = 0
	while i < Attacker.Length
		;(UpgradeQuest as CS_UpgradeTroopsMenu).UpgradeTroop(Attacker[i].GetActorRef())
		i += 1
	endwhile
EndFunction

Function DisableReinforcements()
	int attacktroopsnum = AttackTroops.GetSize()
	int i = 0
	while i < AttackTroops.GetSize()
		if (AttackTroops.GetAt(i) as Actor).IsInFaction(AttackFaction) == 0
			(AttackTroops.GetAt(i) as Actor).disable()
			attacktroopsnum -= 1
		endif
		i += 1
	endwhile
	debug.notification(attacktroopsnum + " Troops attacking")
EndFunction

Function ReEnableTroops()
	int i = 0
	while i < AttackTroops.GetSize()
		if (AttackTroops.GetAt(i) as Actor).IsDisabled() == 1
			(AttackTroops.GetAt(i) as Actor).enable()
		endif
		i += 1
	endwhile
	AttackTroops.Revert()
EndFunction

Function StartAttackQuest()
	(SiegeMapMarkers.GetAt(AllLocations.Find(AttackLocation.GetLocation())) as ObjectReference).disable()
	AddFollowCommander()

	debug.notification("Starting Attack Quest...")
	CityLocationAlias.ForceLocationTo(AttackLocation.GetLocation())
	CityAttackQuest.Start()

EndFunction

Function UpdateTroopTarget()
	int i = 0
	while i < (CityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs.Length
		(CityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs[i].GetActorRef().RemoveFromFaction(AttackFaction)
		(CityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs[i].GetActorRef().EvaluatePackage()
		(CityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs[i].GetActorRef().AddToFaction(AttackFaction)
		(CityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs[i].GetActorRef().EvaluatePackage()
		i += 1
	endwhile
EndFunction

Function UpdateTroopTargetMinor()
	int i = 0
	while i < (MinorCityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs.Length
		(MinorCityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs[i].GetActorRef().RemoveFromFaction(AttackFaction)
		(MinorCityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs[i].GetActorRef().EvaluatePackage()
		(MinorCityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs[i].GetActorRef().AddToFaction(AttackFaction)
		(MinorCityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs[i].GetActorRef().EvaluatePackage()
		i += 1
	endwhile
EndFunction

Function ResetPlanning()
	ArmyCount.SetValue(0)
	TotalTroops.SetValue(0)
	int armynum = 0
	while armynum < AttackQuest.Commanders.Length
		(AttackArmies.GetAt(armynum) as GlobalVariable).SetValue(0)
		If AttackQuest.Commanders[armynum].GetActorRef() != None
			If AttackQuest.Commanders[armynum].GetActorRef().IsInFaction(AttackFaction) == 1
				AttackQuest.Commanders[armynum].GetActorRef().RemoveFromFaction(AttackFaction)
				RespawnCommanders[armynum].ForceRefTo(AttackQuest.Commanders[armynum].GetActorRef())
			EndIf
		endIf
		armynum += 1
	endwhile
	AttackTroops.Revert()
	SetObjectiveCompleted(0)
	SetObjectiveCompleted(1)
	if (CatapultsQuest as QF_CS_CatapultQuest_050F0F33).Catapults.GetValue() == 1
		CatapultsQuest.SetStage(20)
	endif
	DisableCamp()
	PlanningQuest.Stop()
EndFunction

Function AttackCityAssignAliases(Location CityLocation)
	(SiegeMapMarkers.GetAt(AllLocations.Find(CityLocation)) as ObjectReference).disable()
	int i = 0
	while i < AllLocations.GetSize()
		if (AllLocations.GetAt(i) as Location) == CityLocation

			if i < 5

				Jarl.ForceRefTo((GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef())
				if CityLocation.GetKeywordData(CWOwner) == 1
					Steward.ForceRefTo(GovPositions.StewardsImp[i])
					Housecarl.ForceRefTo(GovPositions.HousecarlsImp[i])
					GuardCaptain.ForceRefTo(GovPositions.GuardCaptainsImp[i])
					StopCombatAlias.ForceRefTo(StopCombat.GetAt(i) as ObjectReference)
				elseif CityLocation.GetKeywordData(CWOwner) == 2
					Steward.ForceRefTo(GovPositions.StewardsSons[i])
					Housecarl.ForceRefTo(GovPositions.HousecarlsSons[i])
					GuardCaptain.ForceRefTo(GovPositions.GuardCaptainsSons[i])
					StopCombatAlias.ForceRefTo(StopCombat.GetAt(i) as ObjectReference)
				endif

				int troopnum = 0
				while troopnum < (CityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs.Length
					if Attacker[troopnum].GetActorRef() != None
						(CityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs[troopnum].ForceRefTo(Attacker[troopnum].GetActorRef())
					endif
					troopnum += 1
				endwhile

			else

				JarlM.ForceRefTo((GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef())
				if CityLocation.GetKeywordData(CWOwner) == 1
					StewardM.ForceRefTo(GovPositions.StewardsImp[i])
					HousecarlM.ForceRefTo(GovPositions.HousecarlsImp[i])
					GuardCaptainM.ForceRefTo(GovPositions.GuardCaptainsImp[i])
					StopCombatAliasM.ForceRefTo(StopCombat.GetAt(i) as ObjectReference)
				elseif CityLocation.GetKeywordData(CWOwner) == 2
					StewardM.ForceRefTo(GovPositions.StewardsSons[i])
					HousecarlM.ForceRefTo(GovPositions.HousecarlsSons[i])
					GuardCaptainM.ForceRefTo(GovPositions.GuardCaptainsSons[i])
					StopCombatAliasM.ForceRefTo(StopCombat.GetAt(i) as ObjectReference)
				endif

				int troopnum = 0
				while troopnum < (MinorCityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs.Length
					(MinorCityAttackQuest as CS_AttackCityTroopDeath).AttackerRefs[troopnum].ForceRefTo(Attacker[troopnum].GetActorRef())
					troopnum += 1
				endwhile

			endif
		endif
		i += 1
	endwhile

EndFunction

Function DeployCatapults()
	if (CatapultsQuest as QF_CS_CatapultQuest_050F0F33).Catapults.GetValue() == 1
		CatapultsQuest.SetStage(20)
		CatapultsQuest.SetStage(10)
	endif
EndFunction

Function PlaceCampBanner()
	ObjectReference NewBannerFlag = SiegeCampBannerPost.GetRef().PlaceAtMe(FactionBanner.GetReference().GetBaseObject(), abForcePersist=true)
	SiegeCampBanner.ForceRefTo(NewBannerFlag)
	NewBannerFlag.MoveTo(SiegeCampBannerPost.GetRef(), afXOffset=3, afZOffset=390)
EndFunction

Function EnableCamp()
	SiegeCampMarker.GetReference().Enable()
EndFunction

Function DisableCamp()
	SiegeCampMarker.GetReference().Disable()
	SiegeCampBanner.GetReference().delete()
	SiegeCampBanner.Clear()
EndFunction

Function LaunchInvasion()
	debug.notification("Launching invasion... don't travel to the invasion location yet.")
	SetObjectiveCompleted(0)
	SetActive()
	EnableCamp()
	SetUpMeetUpMarker()
	SetUpCommanderMarker()
	DeployCatapults()
	AssignTroops()
	AddAttackersToAliases()
	DisableReinforcements()
	SetObjectiveDisplayed(1)
	(SiegeMapMarkers.GetAt(AllLocations.Find(AttackLocation.GetLocation())) as ObjectReference).enable()
	(SiegeMapMarkers.GetAt(AllLocations.Find(AttackLocation.GetLocation())) as ObjectReference).AddToMap(true)
	debug.notification("Invasion launched! It is now safe to travel to the invasion location!")
EndFunction


FormList Property SiegeMapMarkers  Auto  

GlobalVariable Property TotalTroops  Auto  

FormList Property AttackPlanningTroopCounts  Auto  

GlobalVariable Property ArmyCount  Auto  

Quest Property CityAttackQuestStart  Auto  

Quest Property UpgradeQuest  Auto  

ReferenceAlias[] Property RespawnCommanders Auto

ReferenceAlias[] Property AttackerSpots  Auto  

FormList Property AttackerSpotRefs  Auto  

Quest Property CatapultsQuest Auto

Quest Property GovQuest Auto

ActorBase Property centurion  Auto  

ReferenceAlias Property SiegeCampMarker  Auto  

ReferenceAlias Property SiegeCampBannerPost  Auto  

ReferenceAlias Property SiegeCampBanner  Auto  

ReferenceAlias Property FactionBanner  Auto  
