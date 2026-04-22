;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_TIF__0504E9CE Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SMAlias.ForceRefTo(akSpeaker)
akSpeaker.IgnoreFriendlyHits(true)
akSpeaker.SetCrimeFaction(None)
CS_GovScriptFunctions GovScriptFunctions = GetOwningQuest() as CS_GovScriptFunctions
GovScriptFunctions.RemoveFromAllCrimeFactions(akSpeaker)
GovScriptFunctions.DisplayTravelMessage(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SMAlias  Auto  

FormList Property OutfitSpymaster  Auto  
