;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CS_UpdateMiscGuards_05011784 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UpdateLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_UpdateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard003 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(TroopUpgradeQuest as CS_UpgradeTroopsMenu).UpgradeGuard(Alias_Guard.GetActorRef())
(TroopUpgradeQuest as CS_UpgradeTroopsMenu).UpgradeGuard(Alias_Guard000.GetActorRef())
(TroopUpgradeQuest as CS_UpgradeTroopsMenu).UpgradeGuard(Alias_Guard001.GetActorRef())
(TroopUpgradeQuest as CS_UpgradeTroopsMenu).UpgradeGuard(Alias_Guard002.GetActorRef())
(TroopUpgradeQuest as CS_UpgradeTroopsMenu).UpgradeGuard(Alias_Guard003.GetActorRef())

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TroopUpgradeQuest  Auto  
