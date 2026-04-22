;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_Court__050B424D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
LawApproval.SetValue(1)
SpecificLaw.SetValue(4)
CouncilScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property CouncilScene  Auto  

GlobalVariable Property LawApproval  Auto  

GlobalVariable Property SpecificLaw  Auto  
