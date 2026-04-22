Scriptname CS_MarriageScript extends Quest  

Faction Property MarriageAskedFaction Auto
Faction Property PotentialMarriageFaction Auto
Faction Property CS_JarlFaction Auto
Faction Property MarriagePalaceFaction Auto

ReferenceAlias Property LoveInterest Auto
ReferenceAlias Property NewSpouseAlias Auto
ReferenceAlias Property Sponsor Auto
ReferenceAlias Property AdoptionSpouse Auto
ReferenceAlias Property KingConsort Auto
ReferenceAlias Property QueenConsort Auto

GlobalVariable Property PlayerCapital Auto

FormList Property AllPalaces Auto
FormList Property OwnershipFactions Auto

LocationAlias Property Palace Auto
ReferenceAlias[] Property SpouseHouses Auto

Quest Property WeddingQuest Auto
Quest Property BYOHRelationshipAdoption Auto

CS_RecruitJarl Property JarlScript Auto

Function StartMarriage(Actor NewSpouse)
	NewSpouseAlias.ForceRefTo(NewSpouse)
	NewSpouseAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
	if !Sponsor.GetActorRef().IsInFaction(CS_JarlFaction) && PlayerCapital.GetValue() == -1
		LoveInterest.ForceRefTo(NewSpouse)
		LoveInterest.GetActorRef().AddToFaction(MarriageAskedFaction)
		LoveInterest.GetActorRef().AddToFaction(PotentialMarriageFaction)
		LoveInterest.GetOwningQuest().SetStage(20)
	else
		Palace.ForceLocationTo(AllPalaces.GetAt(PlayerCapital.GetValueInt()) as Location)
		if !Palace.GetLocation()
			int jarlnum = -1
			int i = 0
			while i < JarlScript.JarlAliases.Length && jarlnum == -1
				if NewSpouseAlias.GetActorRef() == JarlScript.JarlAliases[i].GetActorRef()
					jarlnum = i
				endif
				i += 1
			endwhile
			Palace.ForceLocationTo(AllPalaces.GetAt(jarlnum) as Location)
		endif

		WeddingQuest.Start()
	endif
EndFunction

Function SetUpSpouseHouse()
	;Bed.ForceRefto(NewSpouseAlias.GetActorRef().GetLinkedRef(apKeyword = SpouseBedKeyword))

	;If the Adoption system is running, update the spouse refs there.

	if (BYOHRelationshipAdoption.IsRunning())
   	  AdoptionSpouse.ForceRefTo(NewSpouseAlias.GetActorRef())
	EndIf

	if NewSpouseAlias.GetActorRef().IsInFaction(CS_JarlFaction)
		;Live at their own palace like usual
	elseif PlayerCapital.GetValue() != -1
		NewSpouseAlias.GetActorRef().AddToFaction(MarriagePalaceFaction)

		int i = 0
		while i < SpouseHouses.Length
			SpouseHouses[i].Clear()
			i += 1
		endwhile

		if NewSpouseAlias.GetActorRef()
			SpouseHouses[PlayerCapital.GetValueInt()].ForceRefTo(NewSpouseAlias.GetActorRef())
		endif

		FormList PalaceOwnershipFactions = OwnershipFactions.GetAt(PlayerCapital.GetValueInt()) as FormList
		i = 0
		while i < PalaceOwnershipFactions.GetSize()
			NewSpouseAlias.GetActorRef().AddToFaction(PalaceOwnershipFactions.GetAt(i) as Faction)
			i += 1
		endwhile
	endif
EndFunction

Function MakeConsort(Actor Spouse)
	if Spouse.GetActorBase().GetSex() == 0
		KingConsort.ForceRefTo(Spouse)
	else
		QueenConsort.ForceRefTo(Spouse)
	endif
EndFunction