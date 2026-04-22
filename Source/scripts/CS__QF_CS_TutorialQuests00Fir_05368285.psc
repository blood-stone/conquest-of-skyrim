;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname CS__QF_CS_TutorialQuests00Fir_05368285 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FactionName
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FactionName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Capital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Capital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaseMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaseMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
setObjectiveCompleted(32)
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
Game.GetPlayer().AddSpell(CS_AB_GatherWood)
SetObjectiveCompleted(31)
SetObjectiveDisplayed(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(0)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(100)
CS_TutorialQuests01Diplomacy.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_BaseMarker.ForceRefTo(FactionBaseMarker.GetRef())
Alias_Capital.ForceLocationTo(FactionCapital.GetLocation())
SetObjectiveCompleted(30)
SetObjectiveDisplayed(31)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
setObjectiveCompleted(10)
Alias_Steward.ForceRefTo(FactionGovSteward.GetActorRef())
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
setObjectiveCompleted(40)
setObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property FactionGovSteward  Auto  

ReferenceAlias Property FactionBaseMarker  Auto  

LocationAlias Property FactionCapital  Auto  

Quest Property CS_TutorialQuests01Diplomacy  Auto  

SPELL Property CS_AB_GatherWood  Auto  
