;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__QF_CS_DragonJoinFaction_053D5E5E Extends Quest Hidden

;BEGIN ALIAS PROPERTY SpeakingDragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpeakingDragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
debug.notification("Dragon Stage Started")
DragonForceGreetScene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DragonForceGreetScene  Auto  
