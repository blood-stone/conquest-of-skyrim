;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname CS__QF__05338ABB Extends Quest Hidden

;BEGIN ALIAS PROPERTY Troop010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop019
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop019 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Holding
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Holding Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop020
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop020 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Commander
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Commander Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PatrolMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PatrolMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PatrolMarker000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PatrolMarker000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Troop015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Troop015 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
Alias_Troop001.GetActorRef().disable()
Alias_Troop002.GetActorRef().disable()
Alias_Troop003.GetActorRef().disable()
Alias_Troop004.GetActorRef().disable()
Alias_Troop005.GetActorRef().disable()
Alias_Troop006.GetActorRef().disable()
Alias_Troop007.GetActorRef().disable()
Alias_Troop008.GetActorRef().disable()
Alias_Troop009.GetActorRef().disable()
Alias_Troop010.GetActorRef().disable()
Alias_Troop011.GetActorRef().disable()
Alias_Troop012.GetActorRef().disable()
Alias_Troop013.GetActorRef().disable()
Alias_Troop014.GetActorRef().disable()
Alias_Troop015.GetActorRef().disable()
Alias_Troop016.GetActorRef().disable()
Alias_Troop017.GetActorRef().disable()
Alias_Troop018.GetActorRef().disable()
Alias_Troop019.GetActorRef().disable()
Alias_Troop020.GetActorRef().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CS_ArmyTroopDeath
Quest __temp = self as Quest
CS_ArmyTroopDeath kmyQuest = __temp as CS_ArmyTroopDeath
;END AUTOCAST
;BEGIN CODE
kmyQuest.RemoveFromGarrison(Alias_Commander.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop001.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop002.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop003.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop004.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop005.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop006.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop007.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop008.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop009.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop010.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop011.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop012.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop013.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop014.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop015.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop016.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop017.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop018.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop019.GetActorRef())
kmyQuest.RemoveFromGarrison(Alias_Troop020.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
Alias_Troop001.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop002.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop003.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop004.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop005.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop006.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop007.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop008.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop009.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop010.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop011.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop012.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop013.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop014.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop015.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop016.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop017.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop018.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop019.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
Alias_Troop020.GetActorRef().MoveTo(Alias_Commander.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Troop001.GetActorRef().EvaluatePackage()
Alias_Troop002.GetActorRef().EvaluatePackage()
Alias_Troop003.GetActorRef().EvaluatePackage()
Alias_Troop004.GetActorRef().EvaluatePackage()
Alias_Troop005.GetActorRef().EvaluatePackage()
Alias_Troop006.GetActorRef().EvaluatePackage()
Alias_Troop007.GetActorRef().EvaluatePackage()
Alias_Troop008.GetActorRef().EvaluatePackage()
Alias_Troop009.GetActorRef().EvaluatePackage()
Alias_Troop010.GetActorRef().EvaluatePackage()
Alias_Troop011.GetActorRef().EvaluatePackage()
Alias_Troop012.GetActorRef().EvaluatePackage()
Alias_Troop013.GetActorRef().EvaluatePackage()
Alias_Troop014.GetActorRef().EvaluatePackage()
Alias_Troop015.GetActorRef().EvaluatePackage()
Alias_Troop016.GetActorRef().EvaluatePackage()
Alias_Troop017.GetActorRef().EvaluatePackage()
Alias_Troop018.GetActorRef().EvaluatePackage()
Alias_Troop019.GetActorRef().EvaluatePackage()
Alias_Troop020.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
Alias_Troop001.GetActorRef().enable()
Alias_Troop002.GetActorRef().enable()
Alias_Troop003.GetActorRef().enable()
Alias_Troop004.GetActorRef().enable()
Alias_Troop005.GetActorRef().enable()
Alias_Troop006.GetActorRef().enable()
Alias_Troop007.GetActorRef().enable()
Alias_Troop008.GetActorRef().enable()
Alias_Troop009.GetActorRef().enable()
Alias_Troop010.GetActorRef().enable()
Alias_Troop011.GetActorRef().enable()
Alias_Troop012.GetActorRef().enable()
Alias_Troop013.GetActorRef().enable()
Alias_Troop014.GetActorRef().enable()
Alias_Troop015.GetActorRef().enable()
Alias_Troop016.GetActorRef().enable()
Alias_Troop017.GetActorRef().enable()
Alias_Troop018.GetActorRef().enable()
Alias_Troop019.GetActorRef().enable()
Alias_Troop020.GetActorRef().enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UpgradeTroopsQuest  Auto  

ReferenceAlias Property NewTroop  Auto  

FormList Property ArmyList  Auto  
