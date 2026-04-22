Scriptname CS_MarriageWeddingScript extends Quest  

ReferenceAlias Property Spouse Auto
ReferenceAlias Property Sponsor Auto
ReferenceAlias Property Priest Auto

Scene Property WeddingScene Auto

GlobalVariable Property GameDaysPassed Auto

CS_GetNPCFamilyScript Property GetNPCFamilyScript Auto
CS_MarriageScript Property MarriageScript Auto

float Property WeddingDay Auto

Function StrengthenFamilyRelations()
	if Sponsor.GetActorRef()
		Actor[] SponsorFamily = GetNPCFamilyScript.GetNPCFamily(Sponsor.GetActorRef())
		Actor SponsorSpouse = GetNPCFamilyScript.GetNPCSpouse(Sponsor.GetActorRef())
		int i = 0
		while i < SponsorFamily.Length
			if SponsorFamily[i]
				SponsorFamily[i].SetRelationshipRank(Game.GetPlayer(), 3)
			endif
			i += 1
		endwhile
		if SponsorSpouse
			SponsorSpouse.SetRelationshipRank(Game.GetPlayer(), 3)
		endif
	else
		Actor[] SpouseFamily = GetNPCFamilyScript.GetNPCFamily(Spouse.GetActorRef())
		int i = 0
		while i < SpouseFamily.Length
			if SpouseFamily[i]
				SpouseFamily[i].SetRelationshipRank(Game.GetPlayer(), 3)
			endif
			i += 1
		endwhile
	endif
EndFunction

Event OnUpdateGameTime()
	if GameDaysPassed.GetValue() >= WeddingDay
		SetStage(10)
	endif
EndEvent