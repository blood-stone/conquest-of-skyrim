Scriptname CS_AttackCityTroopDeath extends Quest  

CS_AttackVillageCommanderScript Property CommanderQuest Auto

FormList Property AllLocations Auto
FormList Property SpawnPoints Auto
FormList Property SpawnPoints2 Auto
FormList Property SpawnPointsAttacker Auto
FormList Property SpawnPointsAttacker2 Auto
FormList Property AllHoldings Auto
FormList Property AttackTroops Auto

Faction Property AttackingCityFaction Auto
Faction Property AttackingMinorCityFaction Auto
Faction Property AttackFaction Auto

GlobalVariable Property TroopDeath Auto
GlobalVariable Property DefenderCount Auto
GlobalVariable Property PlayerTroopPercentRemaining Auto

ActorBase Property SiegeTroopSoldier Auto
ActorBase Property SiegeTroopSoldierSons Auto

ReferenceAlias[] Property DefenderRefs Auto
ReferenceAlias[] Property AttackerRefs Auto
ReferenceAlias[] Property AttackerRefsInterior Auto

ReferenceAlias Property AttackMarker Auto
ReferenceAlias Property AttackMarker2 Auto
ReferenceAlias Property DefenseMarker Auto
ReferenceAlias Property DefenseMarker2 Auto

LocationAlias Property City Auto

Quest Property UpgradeQuest Auto

Idle Property CWSoldierCheer Auto

float Property PlayerTroopsRemaining Auto
float Property PlayerTroopsStart Auto

Function TroopsCheer()
	int i = 0
	while i < AttackerRefs.Length
		debug.SendAnimationEvent(AttackerRefs[i].GetActorRef(), "CWSoldierCheer")
		i += 1
	endwhile
EndFunction

Function TroopDeathMinor(ReferenceAlias TroopAlias)
	ActorBase TroopBase = TroopAlias.GetActorRef().GetActorBase()
	int i = 0
	while i < AllLocations.GetSize()
		If City.GetLocation() == (AllLocations.GetAt(i) as Location)
			ObjectReference SpawnPoint = (SpawnPoints.GetAt(i) as FormList).GetAt(utility.randomint(0, (SpawnPoints.GetAt(i) as FormList).GetSize() - 1)) as ObjectReference
			If TroopDeath.GetValue() < DefenderCount.GetValue() - 20
				Actor Soldier = SpawnPoint.PlaceAtMe(TroopBase) as Actor
				TroopAlias.ForceRefTo(Soldier)
			endIf
		endIf
		i += 1
	endwhile
EndFunction

Function TroopDeathMajor(ReferenceAlias TroopAlias)
	ActorBase TroopBase = TroopAlias.GetActorRef().GetActorBase()
	int i = 0
	while i < AllLocations.GetSize()
		If City.GetLocation() == (AllLocations.GetAt(i) as Location)
			ObjectReference SpawnPoint = DoorSpawns.GetAt(i) as ObjectReference
			ObjectReference SpawnPoint2 = (SpawnPoints2.GetAt(i) as FormList).GetAt(utility.randomint(0, (SpawnPoints2.GetAt(i) as FormList).GetSize() - 1)) as ObjectReference
			If TroopDeath.GetValue() < DefenderCount.GetValue() - 10
				If TroopDeath.GetValue() < Math.Floor(0.75*DefenderCount.GetValue()) - 15
					Actor Soldier = SpawnPoint.PlaceAtMe(TroopBase) as Actor
					TroopAlias.ForceRefTo(Soldier)
				Else
					DefenseMarker.Clear()
					Actor Soldier = SpawnPoint2.PlaceAtMe(TroopBase) as Actor
					TroopAlias.ForceRefTo(Soldier)
				EndIf
			endIf
		endIf
		i += 1
	endwhile
EndFunction

Function TroopDeathPlayerMajor(ReferenceAlias TroopAlias)
	AttackTroops.RemoveAddedForm(TroopAlias.GetActorRef())
	AdjustPlayerPercentRemaining()
	int i = 0
	while i < AllLocations.GetSize()
		If City.GetLocation() == (AllLocations.GetAt(i) as Location)
			ObjectReference SpawnPoint = (SpawnPointsAttacker.GetAt(i) as FormList).GetAt(utility.randomint(0, (SpawnPointsAttacker.GetAt(i) as FormList).GetSize() - 1)) as ObjectReference
			ObjectReference SpawnPoint2 = (SpawnPointsAttacker2.GetAt(i) as FormList).GetAt(utility.randomint(0, (SpawnPointsAttacker2.GetAt(i) as FormList).GetSize() - 1)) as ObjectReference
			If TroopDeath.GetValue() < Math.Floor(0.75*DefenderCount.GetValue()) - 15
				int index = 0
				while index < AttackTroops.GetSize()
					Actor Troop = AttackTroops.GetAt(index) as Actor
					if Troop.IsDisabled() == 1
						Troop.enable()
						TroopAlias.ForceRefTo(Troop)
						;(UpgradeQuest as CS_UpgradeTroopsMenu).UpgradeTroop(AttackerRefs[deadtroopindex].GetActorRef())
						TroopAlias.GetActorRef().MoveTo(SpawnPoint)
						TroopAlias.GetActorRef().AddToFaction(AttackFaction)
						TroopAlias.GetActorRef().EvaluatePackage()
						index = 300
						i = 100
					endif
					index += 1
				endwhile
			Else
				int index = 0
				while index < AttackTroops.GetSize()
					if (AttackTroops.GetAt(index) as Actor).IsDisabled() == 1 
						Actor Troop = AttackTroops.GetAt(index) as Actor
						if Troop.IsDisabled() == 1
							Troop.enable()
							TroopAlias.ForceRefTo(Troop)
							;(UpgradeQuest as CS_UpgradeTroopsMenu).UpgradeTroop(AttackerRefs[deadtroopindex].GetActorRef())
							TroopAlias.GetActorRef().MoveTo(SpawnPoint2)
							TroopAlias.GetActorRef().AddToFaction(AttackFaction)
							TroopAlias.GetActorRef().EvaluatePackage()
							index = 300
							i = 100
						endif
					endif
					index += 1
				endwhile
			EndIf
		endIf
		i += 1
	endwhile
EndFunction

Function TroopDeathPlayerMinor(ReferenceAlias TroopAlias)
	AttackTroops.RemoveAddedForm(TroopAlias.GetActorRef())
	AdjustPlayerPercentRemaining()
	int i = 0
	while i < AllLocations.GetSize()
		If City.GetLocation() == (AllLocations.GetAt(i) as Location)
			ObjectReference SpawnPoint = SpawnPointsAttacker.GetAt(i) as ObjectReference
			int index = 0
			while index < AttackTroops.GetSize()
				Actor Troop = AttackTroops.GetAt(index) as Actor
				if Troop.IsDisabled() == 1
					Troop.enable()
					TroopAlias.ForceRefTo(Troop)
					;(UpgradeQuest as CS_UpgradeTroopsMenu).UpgradeTroop(AttackerRefs[deadtroopindex].GetActorRef())
					TroopAlias.GetActorRef().MoveTo(SpawnPoint)
					TroopAlias.GetActorRef().AddToFaction(AttackFaction)
					TroopAlias.GetActorRef().EvaluatePackage()
					index = 300
					i = 100
				endif
				index += 1
			endwhile
		endIf
		i += 1
	endwhile
EndFunction

Function MoveToMarkerEnd()
	AttackMarker.ForceRefTo(AttackMarker2.GetReference())
	int i = 0
	while i < AttackerRefs.Length
		AttackerRefs[i].GetActorRef().RemoveFromFaction(AttackFaction)
		AttackerRefs[i].GetActorRef().EvaluatePackage()
		AttackerRefs[i].GetActorRef().MoveTo(Game.GetPlayer())
		AttackerRefs[i].GetActorRef().AddToFaction(AttackFaction)
		AttackerRefs[i].GetActorRef().EvaluatePackage()
		i += 1
	endwhile
EndFunction

Function AssignInteriorTroops()
	int i = 0
	while i < AttackerRefsInterior.Length
		AttackerRefsInterior[i].ForceRefTo(AttackerRefs[i].GetActorRef())
		AttackerRefs[i].Clear()
		AttackerRefsInterior[i].GetActorRef().MoveTo(Game.GetPlayer())
		i += 1
	endwhile
EndFunction

Function RemoveFromAttackFaction()
	int i = 0
	while i < AttackerRefs.Length
		AttackerRefs[i].GetActorRef().RemoveFromFaction(AttackFaction)
		i += 1
	endwhile
	i = 0
	while i < AttackerRefsInterior.Length
		AttackerRefsInterior[i].GetActorRef().RemoveFromFaction(AttackFaction)
		i += 1
	endwhile
	i = 0
	while i < CommanderQuest.Commanders.Length
		if CommanderQuest.Commanders[i].GetActorRef() != None
			if CommanderQuest.Commanders[i].GetActorRef().IsInFaction(AttackFaction) == 1
				CommanderQuest.Commanders[i].GetActorRef().RemoveFromFaction(AttackFaction)
			endif
		endif
		i += 1
	endwhile
EndFunction

Function SetUpPlayerTroopCounts()
	PlayerTroopsStart = AttackTroops.GetSize() as float
	PlayerTroopsRemaining = PlayerTroopsStart
	PlayerTroopPercentRemaining.SetValue(100)
	UpdateCurrentInstanceGlobal(PlayerTroopPercentRemaining)
EndFunction

Function AdjustPlayerPercentRemaining()
	PlayerTroopsRemaining -= 1
	int PercentRemainingInitial = PlayerTroopPercentRemaining.GetValue() as int
	float NewPercentRemaining = math.floor(100*(PlayerTroopsRemaining/PlayerTroopsStart))
	if NewPercentRemaining <= PercentRemainingInitial - 10
		int percentchange = PercentRemainingInitial - NewPercentRemaining as int
		If PlayerTroopsRemaining <= 0
			PlayerTroopPercentRemaining.SetValue(0)
			UpdateCurrentInstanceGlobal(PlayerTroopPercentRemaining)
			SetObjectiveDisplayed(5)
		Else
			ModObjectiveGlobal(-percentchange, PlayerTroopPercentRemaining, 5) 
		EndIf
	endif
EndFunction

Function ReEnableTroops()
	int i = 0
	while i < AttackTroops.GetSize()
		(AttackTroops.GetAt(i) as Actor).enable()
		i += 1
	endwhile
	AttackTroops.Revert()
EndFunction

FormList Property DoorSpawns  Auto  
