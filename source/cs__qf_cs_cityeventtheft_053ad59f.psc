;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname CS__QF_CS_CityEventTheft_053AD59F Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneMarker001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RunawayMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RunawayMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger_Box
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Trigger_Box Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityCS
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CityCS Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thief
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thief Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
Alias_Trigger_Box.GetReference().disable()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(EventManager as CS_CityEventManagerScript).GuardArrestPrisoner(Alias_Guard.GetActorRef(), Alias_Thief.GetActorRef(), Alias_City.GetLocation())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
(EventManager as CS_CityEventManagerScript).QuestEnd(Alias_Guard.GetOwningQuest(), Alias_City.GetLocation())
SetStage(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
EventScene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Trigger_Box.GetReference().enable()
Alias_Thief.GetActorRef().MoveTo(Alias_SceneMarker.GetReference())
Alias_Citizen.GetActorRef().MoveTo(Alias_SceneMarker000.GetReference())
Alias_Guard.GetActorRef().MoveTo(Alias_SceneMarker001.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property EventManager  Auto  

Scene Property EventScene  Auto  
