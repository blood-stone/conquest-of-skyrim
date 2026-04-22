;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_Court_050AF10F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Gold001, 100)

if akSpeaker.GetRelationshipRank(Game.GetPlayer()) < 3
	akSpeaker.SetRelationshipRank(Game.GetPlayer(), akSpeaker.GetRelationshipRank(Game.GetPlayer()) + 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  
