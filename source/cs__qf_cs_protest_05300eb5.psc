;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname CS__QF_CS_Protest_05300EB5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OrganizerMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OrganizerMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneStartTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneStartTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardFollower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardFollower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldOrganizer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OldOrganizer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Organizer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Organizer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenMarker007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenMarker007 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CS_ProtestScript
Quest __temp = self as Quest
CS_ProtestScript kmyQuest = __temp as CS_ProtestScript
;END AUTOCAST
;BEGIN CODE
; Make it publicly known that you don't care
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
kmyQuest.RemoveAllFactions()
kmyQuest.LoyaltyScript.AdjustLoyalty(kmyQuest.LoyaltyScript.ConvertVanillaToCS(Alias_City.GetLocation()), -20)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CS_ProtestScript
Quest __temp = self as Quest
CS_ProtestScript kmyQuest = __temp as CS_ProtestScript
;END AUTOCAST
;BEGIN CODE
;Arrest Organizer
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
kmyQuest.RemoveAllFactions()
kmyQuest.ArrestOrganizer()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CS_ProtestScript
Quest __temp = self as Quest
CS_ProtestScript kmyQuest = __temp as CS_ProtestScript
;END AUTOCAST
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_ProtestScript
Quest __temp = self as Quest
CS_ProtestScript kmyQuest = __temp as CS_ProtestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ProtestDay = math.floor(kmyQuest.GameDaysPassed.GetValue())
kmyQuest.RegisterForUpdateGameTime(1)
kmyQuest.LoyaltyScript.MakeAliasRebellionLeader(Alias_Organizer, Alias_City.GetLocation())
kmyQuest.ProtestMessage.show()
kmyQuest.AssignFaction()
Alias_Organizer.GetActorRef().MoveTo(Alias_OrganizerMarker.GetReference())
kmyQuest.LoyaltyScript.MakeRebellionLeader(Alias_Organizer.GetActorRef(), Alias_City.GetLocation())
Alias_SceneStartTrigger.GetReference().enable()
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE CS_ProtestScript
Quest __temp = self as Quest
CS_ProtestScript kmyQuest = __temp as CS_ProtestScript
;END AUTOCAST
;BEGIN CODE
; Listen to Organizer's demands
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
kmyQuest.RemoveAllFactions()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CS_ProtestScript
Quest __temp = self as Quest
CS_ProtestScript kmyQuest = __temp as CS_ProtestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartProtest()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
Alias_GuardFollower.GetActorRef().delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CS_ProtestScript
Quest __temp = self as Quest
CS_ProtestScript kmyQuest = __temp as CS_ProtestScript
;END AUTOCAST
;BEGIN CODE
; Completely ignore protest
SetObjectiveFailed(10)
SetObjectiveFailed(20)
SetObjectiveFailed(30)
kmyQuest.LoyaltyScript.AdjustLoyalty(kmyQuest.LoyaltyScript.ConvertVanillaToCS(Alias_City.GetLocation()), -10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
