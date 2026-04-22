;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_TIF__0200DBED Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
StewardAlias.ForceRefTo(akSpeaker)
CourtSteward.ForceRefTo(akSpeaker)
akSpeaker.IgnoreFriendlyHits(true)
akSpeaker.SetCrimeFaction(None)
CS_GovScriptFunctions GovScriptFunctions = GetOwningQuest() as CS_GovScriptFunctions
GovScriptFunctions.RemoveFromAllCrimeFactions(akSpeaker)
GovScriptFunctions.DisplayTravelMessage(akSpeaker)
if GovScriptFunctions.CapitalGlobal.GetValueInt() >= 0
	GovScriptFunctions.Stewards[GovScriptFunctions.CapitalGlobal.GetValueInt()].ForceRefTo(akSpeaker)
endif
if RecruitSteward.GetValue() == 0
	RecruitSteward.SetValue(1)
	GetOwningQuest().SetStage(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property StewardAlias  Auto  

ReferenceAlias Property CourtSteward  Auto  

FormList Property OutfitSteward  Auto  

GlobalVariable Property RecruitSteward  Auto  
