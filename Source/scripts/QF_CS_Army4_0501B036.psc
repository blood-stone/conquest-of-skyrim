;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_CS_Army4_0501B036 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Troop8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PatrolMarker000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PatrolMarker000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Holding
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Holding Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Commander
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Commander Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PatrolMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PatrolMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop20 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_Troop1.GetActorRef().enable()
Alias_Troop2.GetActorRef().enable()
Alias_Troop3.GetActorRef().enable()
Alias_Troop4.GetActorRef().enable()
Alias_Troop5.GetActorRef().enable()
Alias_Troop6.GetActorRef().enable()
Alias_Troop7.GetActorRef().enable()
Alias_Troop8.GetActorRef().enable()
Alias_Troop9.GetActorRef().enable()
Alias_Troop10.GetActorRef().enable()
Alias_Troop11.GetActorRef().enable()
Alias_Troop12.GetActorRef().enable()
Alias_Troop13.GetActorRef().enable()
Alias_Troop14.GetActorRef().enable()
Alias_Troop15.GetActorRef().enable()
Alias_Troop16.GetActorRef().enable()
Alias_Troop17.GetActorRef().enable()
Alias_Troop18.GetActorRef().enable()
Alias_Troop19.GetActorRef().enable()
Alias_Troop20.GetActorRef().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_Troop1.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop2.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop3.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop4.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop5.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop6.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop7.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop8.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop9.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop10.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop11.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop12.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop13.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop14.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop15.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop16.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop17.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop18.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop19.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop20.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_Troop1.GetActorRef().disable()
Alias_Troop2.GetActorRef().disable()
Alias_Troop3.GetActorRef().disable()
Alias_Troop4.GetActorRef().disable()
Alias_Troop5.GetActorRef().disable()
Alias_Troop6.GetActorRef().disable()
Alias_Troop7.GetActorRef().disable()
Alias_Troop8.GetActorRef().disable()
Alias_Troop9.GetActorRef().disable()
Alias_Troop10.GetActorRef().disable()
Alias_Troop11.GetActorRef().disable()
Alias_Troop12.GetActorRef().disable()
Alias_Troop13.GetActorRef().disable()
Alias_Troop14.GetActorRef().disable()
Alias_Troop15.GetActorRef().disable()
Alias_Troop16.GetActorRef().disable()
Alias_Troop17.GetActorRef().disable()
Alias_Troop18.GetActorRef().disable()
Alias_Troop19.GetActorRef().disable()
Alias_Troop20.GetActorRef().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_ArmyTroopDeath
Quest __temp = self as Quest
CS_ArmyTroopDeath kmyQuest = __temp as CS_ArmyTroopDeath
;END AUTOCAST
;BEGIN CODE
kmyQuest.RemoveFromGarrison(Alias_Commander.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop1.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop2.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop3.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop4.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop5.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop6.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop7.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop8.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop9.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop10.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop11.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop12.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop13.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop14.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop15.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop16.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop17.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop18.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop19.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop20.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Troop1.GetActorRef().EvaluatePackage()
Alias_Troop2.GetActorRef().EvaluatePackage()
Alias_Troop3.GetActorRef().EvaluatePackage()
Alias_Troop4.GetActorRef().EvaluatePackage()
Alias_Troop5.GetActorRef().EvaluatePackage()
Alias_Troop6.GetActorRef().EvaluatePackage()
Alias_Troop7.GetActorRef().EvaluatePackage()
Alias_Troop8.GetActorRef().EvaluatePackage()
Alias_Troop9.GetActorRef().EvaluatePackage()
Alias_Troop10.GetActorRef().EvaluatePackage()
Alias_Troop11.GetActorRef().EvaluatePackage()
Alias_Troop12.GetActorRef().EvaluatePackage()
Alias_Troop13.GetActorRef().EvaluatePackage()
Alias_Troop14.GetActorRef().EvaluatePackage()
Alias_Troop15.GetActorRef().EvaluatePackage()
Alias_Troop16.GetActorRef().EvaluatePackage()
Alias_Troop17.GetActorRef().EvaluatePackage()
Alias_Troop18.GetActorRef().EvaluatePackage()
Alias_Troop19.GetActorRef().EvaluatePackage()
Alias_Troop20.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
