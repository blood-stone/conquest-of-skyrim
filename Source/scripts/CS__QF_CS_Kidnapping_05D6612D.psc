;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CS__QF_CS_Kidnapping_05D6612D Extends Quest Hidden

;BEGIN ALIAS PROPERTY FactionName
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY target
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_target Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spymaster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spymaster Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_KidnappingScript
Quest __temp = self as Quest
CS_KidnappingScript kmyQuest = __temp as CS_KidnappingScript
;END AUTOCAST
;BEGIN CODE
Alias_Target.GetActorRef().MoveTo(Alias_Spymaster.GetActorRef(), afXOffset = 40)
Alias_Target.GetActorRef().EquipItem(kmyQuest.PrisonerCuffs)
Alias_Target.GetActorRef().EquipItem(kmyQuest.ExecutionHood)
Utility.Wait(2)
debug.sendAnimationEvent(Alias_Target.GetActorRef(), "IdleBoundKneesStart")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
