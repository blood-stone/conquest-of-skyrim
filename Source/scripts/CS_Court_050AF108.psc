;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_Court_050AF108 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().AddItem(Gold001, 1000)

if akSpeaker.GetRelationshipRank(Game.GetPlayer()) > -2
	akSpeaker.SetRelationshipRank(Game.GetPlayer(), akSpeaker.GetRelationshipRank(Game.GetPlayer()) - 1)
endif

akSpeaker.AddToFaction(CrimeSpecific)
Arrestee.ForceRefTo(akSpeaker)
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

MiscObject Property Gold001  Auto  
