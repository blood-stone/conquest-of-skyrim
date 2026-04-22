;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_CS_PeaceFirstConcessionsP_050FB23B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(GetOwningQuest() as CS_NegotiationScript).CalculateNewScore()
(GetOwningQuest() as CS_NegotiationScript).CalculateGuestReparations()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(GetOwningQuest() as CS_NegotiationScript).CalculateGuestReparations()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
