;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__QF_CS_MeetingCouncil_058DDF28 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MeetingChair003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingStandMarker003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingStandMarker003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingThrone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingThrone Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Map
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Map Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Palace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Palace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingStandMarker002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingStandMarker002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourtMage
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CourtMage Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ASIC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ASIC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingStandMarker005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingStandMarker005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingStandMarker004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingStandMarker004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapStandMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapStandMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingTable
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingTable Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Blacksmith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blacksmith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingStandMarker001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingStandMarker001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair002 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Steward.GetActorRef().EvaluatePackage()
Alias_ASIC.GetActorRef().EvaluatePackage()
Alias_Blacksmith.GetActorRef().EvaluatePackage()
Alias_CourtMage.GetActorRef().EvaluatePackage()
Alias_Map.GetRef().enable()
(Alias_Map.GetRef() as CS_CivilWarMapActivatorScript).ResetFlags()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
