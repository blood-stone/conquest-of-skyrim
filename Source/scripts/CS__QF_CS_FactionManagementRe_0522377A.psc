;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__QF_CS_FactionManagementRe_0522377A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Customer008
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Customer008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction008
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Faction008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Customer003
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Customer003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MilitaryUnitType001
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_MilitaryUnitType001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Customer001
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Customer001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MilitaryUnitType002
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_MilitaryUnitType002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerFactionActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerFactionActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Customer002
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Customer002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MilitaryUnitType000
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_MilitaryUnitType000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction005
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Faction005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionName
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FactionName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction007
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Faction007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Overlord
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Overlord Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionType
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FactionType Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionSteward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionSteward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction004
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Faction004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Customer005
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Customer005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionCapital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FactionCapital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionHousecarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionHousecarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionNamePrefix
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FactionNamePrefix Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionLeader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionLeader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction002
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Faction002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction006
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Faction006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction003
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Faction003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction001
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Faction001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Customer009
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Customer009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Building005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Building005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionMage
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionMage Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Customer006
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Customer006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Building002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Building002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Faction009
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Faction009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Customer007
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Customer007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Customer004
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Customer004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Building004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Building004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Building001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Building001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Building003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Building003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Recipe009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Recipe009 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_FactionManagementReport
Quest __temp = self as Quest
CS_FactionManagementReport kmyQuest = __temp as CS_FactionManagementReport
;END AUTOCAST
;BEGIN CODE
Start()
kmyQuest.MenuStart()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
