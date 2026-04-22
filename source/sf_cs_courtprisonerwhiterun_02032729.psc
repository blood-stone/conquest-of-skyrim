;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname SF_CS_CourtPrisonerWhiterun_02032729 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
GetOwningQuest().RegisterForSingleUpdate(2)
Prisoner.Clear()
PrisonerGuard.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Prisoner  Auto  

ReferenceAlias Property PrisonerGuard  Auto  

Faction[] Property CrimeTypes  Auto  
