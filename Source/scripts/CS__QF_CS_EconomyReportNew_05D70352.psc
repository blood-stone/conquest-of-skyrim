;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__QF_CS_EconomyReportNew_05D70352 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TradeCity008
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TradeCity008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TradeCity003
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TradeCity003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementResource007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementResource007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementResource005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementResource005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementText008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementText008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementResource004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementResource004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TradeCity004
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TradeCity004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionName
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementText007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementText007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Resource
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Resource Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementResource001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementResource001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementText002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementText002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementText005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementText005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TradeCity006
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TradeCity006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementResource002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementResource002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TradeCity005
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TradeCity005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TradeCity001
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TradeCity001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementResource008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementResource008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementText001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementText001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementText003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementText003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementResource006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementResource006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TradeCity002
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TradeCity002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementText006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementText006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementText004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementText004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgreementResource003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgreementResource003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TradeCity007
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TradeCity007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TradingOrNot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TradingOrNot Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_EconomyReportNewScript
Quest __temp = self as Quest
CS_EconomyReportNewScript kmyQuest = __temp as CS_EconomyReportNewScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MenuStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
