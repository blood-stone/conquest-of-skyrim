;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_CS_ArmyPersonalAssignStan_050F0FCF Extends Quest Hidden

;BEGIN ALIAS PROPERTY StandMarker1_003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker1_003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker2_003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker2_003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker2_001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker2_001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker1_002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker1_002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker1_000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker1_000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker2_002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker2_002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker1_001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker1_001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_PlayerLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker2_000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker2_000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
int i = 0
while i < StandMarkers.Length
	StandMarkers[i].ForceRefTo(StandMarkers1[i].GetReference())
	i += 1
endwhile

StandMarkers[0].GetOwningQuest().SetStage(0)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
int i = 0
while i < StandMarkers.Length
	StandMarkers[i].ForceRefTo(StandMarkers2[i].GetReference())
	i += 1
endwhile

StandMarkers[0].GetOwningQuest().SetStage(0)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias[] Property StandMarkers  Auto  

ReferenceAlias[] Property StandMarkers1  Auto  

ReferenceAlias[] Property StandMarkers2  Auto  
