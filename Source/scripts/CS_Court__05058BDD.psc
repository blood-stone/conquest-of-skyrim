;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_Court__05058BDD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
LawApproval.SetValue(1)
SpecificLaw.SetValue(1)
FreeSpeechScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FreeSpeechScene  Auto  

GlobalVariable Property SpecificLaw  Auto  

GlobalVariable Property LawApproval  Auto  
