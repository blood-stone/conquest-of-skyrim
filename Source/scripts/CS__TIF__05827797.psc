;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__05827797 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;(GetOwningQuest() as CS_PrisonerQuestScript).RansomMenu(ASICMenu=true)
CS_PrisonerQuestScript PrisonerQuestScript = (GetOwningQuest() as CS_PrisonerQuestScript)
PrisonerQuestScript.PrisonerMenu("ASIC", -1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
