Scriptname CS_TeleportToChill extends ActiveMagicEffect  

ObjectReference Property Marker1 Auto

ObjectReference Property Marker2 Auto

ObjectReference Property Marker3 Auto

ReferenceAlias Property Prisoner1 Auto

ReferenceAlias Property Prisoner2 Auto

ReferenceAlias Property Prisoner3 Auto

ReferenceAlias Property JarlPrisonerImp Auto

ReferenceAlias Property JarlPrisonerSons Auto

Faction Property GovImperial Auto

Faction Property GovSons Auto


ReferenceAlias Property PrisonerNew Auto

Event OnEffectFinish(Actor AkTarget, Actor akCaster)
	if akTarget == JarlTrue.GetActorRef()
		if akTarget.IsInFaction(GovImperial) == 1
			JarlPrisonerImp.ForceRefTo(AkTarget)
		elseif akTarget.IsInFaction(GovSons) == 1
			JarlPrisonerSons.ForceRefTo(AkTarget)
		endif
	else
		if Prisoner1.GetActorRef() == None
			Prisoner1.ForceRefTo(AkTarget)
		elseif Prisoner2.GetActorRef() == None
			Prisoner2.ForceRefTo(AkTarget)
		elseif Prisoner3.GetActorRef() == None
			Prisoner3.ForceRefTo(AkTarget)
		endif
	endif
EndEvent

ReferenceAlias Property JarlTrue  Auto  
