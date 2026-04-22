;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_CS_ArmyPersonal_05025D2F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Troop003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TroopMarker003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TroopMarker003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TroopMarker000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TroopMarker000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TroopMarker002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TroopMarker002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TroopMarker001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TroopMarker001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Troop000.GetActorRef().EvaluatePackage()
Alias_Troop001.GetActorRef().EvaluatePackage()
Alias_Troop002.GetActorRef().EvaluatePackage()
Alias_Troop003.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property testMarker  Auto  
