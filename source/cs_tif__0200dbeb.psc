;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_TIF__0200DBEB Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ASICAlias.ForceRefTo(akSpeaker)
akSpeaker.IgnoreFriendlyHits(true)
akSpeaker.SetCrimeFaction(None)
CS_GovScriptFunctions GovScriptFunctions = GetOwningQuest() as CS_GovScriptFunctions
GovScriptFunctions.RemoveFromAllCrimeFactions(akSpeaker)
GovScriptFunctions.DisplayTravelMessage(akSpeaker)
if GovScriptFunctions.CapitalGlobal.GetValueInt() >= 0
	GovScriptFunctions.Housecarls[GovScriptFunctions.CapitalGlobal.GetValueInt()].ForceRefTo(akSpeaker)
endif
if RecruitASIC.GetValue() == 0
	RecruitASIC.SetValue(1)
	GetOwningQuest().SetStage(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ASICAlias  Auto  

FormList Property OutfitASIC  Auto  

GlobalVariable Property RecruitASIC  Auto  
