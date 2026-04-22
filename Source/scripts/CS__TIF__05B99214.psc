;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__05B99214 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.UnEquipItem(PrisonerCuffs)
akSpeaker.RemoveItem(PrisonerCuffs)
debug.SendAnimationEvent(akSpeaker, "IdleForceDefaultState")
(GetOwningQuest() as CS_CourtScript).ClearPrisonerAlias(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PrisonerGuard  Auto  

ReferenceAlias Property Executionee  Auto  

ReferenceAlias Property ExecutionGuard  Auto  

ReferenceAlias[] Property Prisoners  Auto  

Scene Property ExecutionScene  Auto  

FormList Property AllLocations  Auto  

FormList Property AllHoldingValues  Auto  

GlobalVariable Property CapitalHoldingValue  Auto  

FormList Property NonPermPrisonerNum  Auto  

Armor Property PrisonerCuffs  Auto  
