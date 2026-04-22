;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname CS__QF__053724DB Extends Quest Hidden

;BEGIN ALIAS PROPERTY Capital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Capital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionName
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FactionName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaseMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaseMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TradeJarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TradeJarl Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(0)
SetObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(3)
SetObjectiveDisplayed(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_BaseMarker.ForceRefTo(FactionBaseMarker.GetRef())
Alias_Capital.ForceLocationTo(FactionCapital.GetLocation())
SetObjectiveCompleted(2)
SetObjectiveDisplayed(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
setObjectiveCompleted(1)
Alias_Steward.ForceRefTo(FactionGovSteward.GetActorRef())
SetObjectiveDisplayed(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(6)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(4)
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property FactionGovSteward  Auto  

ReferenceAlias Property FactionBaseMarker  Auto  

LocationAlias Property FactionCapital  Auto  
