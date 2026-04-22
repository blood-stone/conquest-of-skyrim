;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname CS_DefendCityImpScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY Attacker11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackStartMarkerPhase2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackStartMarkerPhase2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker015 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackStartMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackStartMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewJarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NewJarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TriggerBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TriggerBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY defender
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_defender Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Palace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Palace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefendMarkerPhase1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefendMarkerPhase1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefendMarkerPhase2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefendMarkerPhase2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DefenderMarker011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DefenderMarker011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker20 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Defender015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Defender015 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_8 in script CS_DefendCityImpScript
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_22 in script CS_DefendCityImpScript
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_13 in script CS_DefendCityImpScript
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_25 in script CS_DefendCityImpScript
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_11 in script CS_DefendCityImpScript
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_15 in script CS_DefendCityImpScript
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
