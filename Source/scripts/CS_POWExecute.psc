;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS_POWExecute Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
POWFaction.SetEnemy(POWGuardFaction)
POWGuardFaction.SetEnemy(POWFaction)
int i = 0
while i < Guards.Length
	Guards[i].Clear()
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property POWFaction  Auto  

Faction Property POWGuardFaction  Auto  

ReferenceAlias[] Property Guards  Auto  
