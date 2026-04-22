;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PF_CS_EscortPrisonerWhiterun_020258B3 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
Prisoner.GetReference().MoveTo(PrisonMarker)
PrisonerGuard.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PrisonerGuard  Auto  

ReferenceAlias Property Prisoner  Auto  

ObjectReference Property PrisonMarker  Auto  
