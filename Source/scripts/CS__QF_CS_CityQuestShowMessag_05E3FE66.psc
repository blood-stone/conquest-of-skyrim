;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__QF_CS_CityQuestShowMessag_05E3FE66 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CityOpinionIncreasedOrDecreased
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityOpinionIncreasedOrDecreased Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InfluenceIncreasedOrDecreased
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InfluenceIncreasedOrDecreased Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If Alias_InfluenceIncreasedOrDecreased.GetRef()
	InfluenceMessage.show()
EndIf

If Alias_CityOpinionIncreasedOrDecreased.GetRef()
	CityOpinionMessage.show()
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property InfluenceMessage  Auto  

Message Property CityOpinionMessage  Auto  
