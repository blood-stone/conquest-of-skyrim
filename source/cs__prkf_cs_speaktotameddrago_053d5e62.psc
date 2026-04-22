;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname CS__PRKF_CS_SpeakToTamedDrago_053D5E62 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
SpeakingDragon.ForceRefTo(akTargetRef)
debug.notification("Forced Dragon To Speaking Alias")
(akTargetRef as Actor).EvaluatePackage()
SpeakingDragon.GetOwningQuest().SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DragonJoinQuest  Auto  

ReferenceAlias Property SpeakingDragon  Auto  
