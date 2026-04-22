;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_Court__02032CC2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if akSpeaker.GetRelationshipRank(Game.GetPlayer()) < 3
	akSpeaker.SetRelationshipRank(Game.GetPlayer(), akSpeaker.GetRelationshipRank(Game.GetPlayer()) + 1)
endif

if (Citizen2.GetActorRef()).GetRelationshipRank(Game.GetPlayer()) > -2
	(Citizen2.GetActorRef()).SetRelationshipRank(Game.GetPlayer(), (Citizen2.GetActorRef()).GetRelationshipRank(Game.GetPlayer()) - 1)
endif

Citizen2.GetActorRef().AddToFaction(CrimeSpecific)
Arrestee.ForceRefTo(Citizen2.GetActorRef())
ArrestingGuard.ForceRefTo(Bailiff.GetActorRef())
Citizen2.Clear()
Bailiff.Clear()
Bailiff.ForceRefTo(None)

ArrestScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Citizen2  Auto  

ReferenceAlias Property Bailiff  Auto  

ReferenceAlias Property ArrestingGuard  Auto  

ReferenceAlias Property Arrestee  Auto  

Scene Property ArrestScene  Auto  



Faction Property CrimeSpecific  Auto  
