;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__0550B579 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
FetchQuest.Start()
QuestItemAlias.ForceRefTo(RestorationBook)
FetchQuest.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FetchQuest  Auto  

ReferenceAlias Property QuestItemAlias  Auto  

ObjectReference Property RestorationBook  Auto  
