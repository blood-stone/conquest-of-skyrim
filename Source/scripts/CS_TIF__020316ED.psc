;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_TIF__020316ED Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int i = 0
while i < AllLocations.GetSize()
	if akSpeaker.IsInLocation(AllLocations.GetAt(i) as Location)
		if PrisonerNew.GetActorRef() == JarlTrue[i].GetActorRef()
			if PrisonerNew.GetActorRef().IsInFaction(GovImperial) == 1
				JarlPrisonerImp[i].ForceRefTo(PrisonerNew.GetActorRef())
			elseif PrisonerNew.GetActorRef().IsInFaction(GovSons) == 1
				JarlPrisonerSons[i].ForceRefTo(PrisonerNew.GetActorRef())
			endif
		endif
		PrisonerGuard[i].ForceRefTo(akSpeaker)
	endif
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias[] Property JarlPrisonerImp  Auto 

ReferenceAlias[] Property JarlPrisonerSons  Auto  

Armor Property PrisonerCuffs  Auto  

Idle Property OffsetBoundStandingStart  Auto  

ReferenceAlias[] Property PrisonerGuard  Auto  

ReferenceAlias Property PrisonerNew  Auto  

ReferenceAlias Property GuardFollower  Auto  

FormList Property AllLocations  Auto  

Faction Property GovImperial  Auto  

Faction Property GovSons  Auto  

ReferenceAlias[] Property JarlTrue  Auto  
