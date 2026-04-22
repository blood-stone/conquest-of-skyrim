Scriptname CS_UpdateGovOutfitsOnLoadGame extends ReferenceAlias  

Event OnPlayerLoadGame()
	ReferenceAlias[] GovPositions = (GetOwningQuest() as CS_GovScriptFunctions).GovPositions
	ReferenceAlias[] JarlPositions = (GetOwningQuest() as CS_RecruitJarl).JarlAliases

	int i = 0
	while i < GovPositions.Length
		if GovPositions[i].GetActorRef()
			if GovPositions[i].GetActorRef().Is3DLoaded()
				(GovPositions[i] as CS_GovUpdateOutfit).UpdateGovOutfit()
			endif
		endif
		i += 1
	endwhile

	i = 0
	while i < JarlPositions.Length
		if JarlPositions[i].GetActorRef()
			if JarlPositions[i].GetActorRef().Is3DLoaded()
				(JarlPositions[i] as CS_GovUpdateOutfit).UpdateGovOutfit()
			endif
		endif
		i += 1
	endwhile

EndEvent