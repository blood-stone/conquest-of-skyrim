Scriptname CS_PlayerLeaveClaimedArea extends ReferenceAlias  



Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akOldLoc == (GetOwningQuest() as CS_ClaimAreaQuestScript).Alias_ClaimedArea.GetLocation()
		int i = 0
		while i <(GetOwningQuest() as CS_ClaimAreaQuestScript).Bandits.Length
			if (GetOwningQuest() as CS_ClaimAreaQuestScript).Bandits[i].GetActorRef() != None
				(GetOwningQuest() as CS_ClaimAreaQuestScript).Bandits[i].GetActorRef().disable()
			endif
			i += 1
		endwhile
		GetOwningQuest().Stop()
	endif
EndEvent
