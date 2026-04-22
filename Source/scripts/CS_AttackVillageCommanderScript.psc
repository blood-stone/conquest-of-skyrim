Scriptname CS_AttackVillageCommanderScript extends Quest  

ReferenceAlias[] Property AttackMarkerAliases  Auto  
ReferenceAlias[] Property Commanders  Auto  
ReferenceAlias Property CityAttackMarker2 Auto
ReferenceAlias Property MinorCityAttackMarker2 Auto

FormList Property VillageAttackMarkers  Auto  
FormList Property VillageAttack2Markers  Auto  
FormList Property ArmyQuests Auto

Faction Property AttackFaction Auto
Faction Property AttackFaction2 Auto
Faction Property FollowerFaction Auto

GlobalVariable Property PlayerIsFollowed Auto

Function MoveToAttackStart(int armynum, int holdingnum)
	AttackMarkerAliases[armynum].ForceRefTo(VillageAttackMarkers.GetAt(holdingnum) as ObjectReference)
EndFunction

Function MoveToAttack2()
	int armynum = 0
	while armynum < Commanders.Length
		If Commanders[armynum].GetActorRef().IsInFaction(AttackFaction) == 1
			ObjectReference StartMarker = AttackMarkerAliases[armynum].GetReference()
			Commanders[armynum].GetActorRef().RemoveFromFaction(AttackFaction)
			Commanders[armynum].GetActorRef().EvaluatePackage()
			int index = VillageAttackMarkers.Find(StartMarker)
			AttackMarkerAliases[armynum].ForceRefTo(VillageAttack2Markers.GetAt(index) as ObjectReference)
			Commanders[armynum].GetActorRef().AddToFaction(AttackFaction)
			Commanders[armynum].GetActorRef().EvaluatePackage()
		endIf
		armynum += 1
	endwhile
EndFunction

Function AttackEnd()
		int armynum = 0
		while armynum < Commanders.Length
		If Commanders[armynum].GetActorRef().IsInFaction(AttackFaction) == 1
			AttackMarkerAliases[armynum].Clear()
			Commanders[armynum].GetActorRef().RemoveFromFaction(AttackFaction)
			Commanders[armynum].GetActorRef().EvaluatePackage()
		endIf
		armynum += 1
	endwhile
EndFunction

Function FollowPlayer(Actor akSpeaker)
	akSpeaker.AddToFaction(FollowerFaction)
	akSpeaker.SetPlayerTeammate(true, true)
	akSpeaker.SetAV("Confidence", 4 as Float)
	akSpeaker.SetAV("Aggression", 1 as Float)
	akSpeaker.SetAV("Morality", 0 as Float)
	int i = 0
	while i < Commanders.Length
		if (akSpeaker as ObjectReference) == Commanders[i].GetReference()
			PlayerIsFollowed.SetValue(1)
			(ArmyQuests.GetAt(i) as Quest).SetStage(10)
		endif
		i += 1
	endwhile
EndFunction

Function StopFollowPlayer(Actor akSpeaker)
	akSpeaker.RemoveFromFaction(FollowerFaction)
	akSpeaker.SetPlayerTeammate(false, false)
	akSpeaker.SetAV("Confidence", 4 as Float)
	akSpeaker.SetAV("Aggression", 1 as Float)
	akSpeaker.SetAV("Morality", 0 as Float)
	int i = 0
	while i < Commanders.Length
		if (akSpeaker as ObjectReference) == Commanders[i].GetReference()
			PlayerIsFollowed.SetValue(0)
			(ArmyQuests.GetAt(i) as Quest).SetStage(10)
		endif
		i += 1
	endwhile
EndFunction

FormList Property VillageTriggerBoxes  Auto  
