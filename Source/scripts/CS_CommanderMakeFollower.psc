;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CS_CommanderMakeFollower Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
actor FollowerActor = akSpeaker
TroopRef.ForceRefTo(FollowerActor)
FollowerActor.SetPlayerTeammate(true, true)
FollowerActor.SetAV("Confidence", 4 as Float)
FollowerActor.SetAV("Aggression", 4 as Float)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Faction Property Faction01  Auto  

Faction Property WaitFaction  Auto  

Faction Property CurrentFollowerFaction  Auto  

Faction Property PotentialFollowerFaction  Auto  

Quest Property pDialogueFollower  Auto  

ReferenceAlias Property TroopRef  Auto  
