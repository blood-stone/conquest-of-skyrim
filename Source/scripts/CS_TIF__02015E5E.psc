;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_TIF__02015E5E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ArchitectAlias.ForceRefTo(akSpeaker)
akSpeaker.IgnoreFriendlyHits(true)
akSpeaker.SetCrimeFaction(None)
CS_GovScriptFunctions GovScriptFunctions = GetOwningQuest() as CS_GovScriptFunctions
GovScriptFunctions.RemoveFromAllCrimeFactions(akSpeaker)
GovScriptFunctions.DisplayTravelMessage(akSpeaker)
if GetOwningQuest().GetStage() == 10
	GetOwningQuest().SetStage(11)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ArchitectAlias  Auto  

FormList Property OutfitArchitect  Auto  
