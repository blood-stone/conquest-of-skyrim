;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname CS__QF__05389D0F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BountyCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BountyCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BountyLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BountyLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bounty
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bounty Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Commander
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Commander Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BountyHunter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BountyHunter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BountyCityCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BountyCityCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(LoyaltyQuest as CS_LoyaltyCheckScript).ConvertVanillaToCS(Alias_BountyCity.GetLocation()).SetKeywordData(CourtCaseBandit, 0)
int holdnum = AllLocations.Find(Alias_BountyCity.GetLocation())
Actor BountyBoss = (AmbushMarker.GetAt(holdnum) as ObjectReference).PlaceAtMe(BanditBoss) as Actor
Alias_Bounty.ForceRefTo(BountyBoss)
(AmbushMarker.GetAt(holdnum) as ObjectReference).PlaceAtMe(Bandit, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Success after Bounty Hunter kills bounty
SetObjectiveCompleted(30)
Alias_BountyLocation.GetLocation().SetCleared(true)
(LoyaltyQuest as CS_LoyaltyCheckScript).AdjustLoyalty((LoyaltyQuest as CS_LoyaltyCheckScript).ConvertVanillaToCS(Alias_BountyCity.GetLocation()), 3)
(LoyaltyQuest as CS_LoyaltyCheckScript).ConvertVanillaToCS(Alias_BountyCity.GetLocation()).SetKeywordData(CourtCaseBandit, 2)
Alias_Bounty.GetActorRef().kill()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Success after Commander kills bounty
SetObjectiveCompleted(25)
Alias_BountyLocation.GetLocation().SetCleared(true)
(LoyaltyQuest as CS_LoyaltyCheckScript).AdjustLoyalty((LoyaltyQuest as CS_LoyaltyCheckScript).ConvertVanillaToCS(Alias_BountyCity.GetLocation()), 5)
Alias_Bounty.GetActorRef().kill()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_BountyScript
Quest __temp = self as Quest
CS_BountyScript kmyQuest = __temp as CS_BountyScript
;END AUTOCAST
;BEGIN CODE
; Player chose commander to kill bounty
SetObjectiveDisplayed(20, abForce=true)
kmyQuest.PlayerDecision = 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Success after Player kills bounty themselves
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(25)
SetObjectiveCompleted(30)
(LoyaltyQuest as CS_LoyaltyCheckScript).AdjustLoyalty((LoyaltyQuest as CS_LoyaltyCheckScript).ConvertVanillaToCS(Alias_BountyCity.GetLocation()), 10)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CS_BountyScript
Quest __temp = self as Quest
CS_BountyScript kmyQuest = __temp as CS_BountyScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)
kmyQuest.RegisterForUpdateGameTime(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player chose to do bounty themselves
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CS_BountyScript
Quest __temp = self as Quest
CS_BountyScript kmyQuest = __temp as CS_BountyScript
;END AUTOCAST
;BEGIN CODE
; Player chose bounty hunter to kill bounty
kmyQuest.PlayerDecision = 3
SetObjectiveDisplayed(30)
kmyQuest.RegisterForUpdateGameTime(24)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property LoyaltyQuest  Auto  

Keyword Property CourtCaseBandit  Auto  

ActorBase Property BanditBoss  Auto  

ActorBase Property bandit  Auto  

FormList Property AmbushMarker  Auto  

FormList Property AllLocations  Auto  
