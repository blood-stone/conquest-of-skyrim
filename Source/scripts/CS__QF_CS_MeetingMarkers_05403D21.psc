;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname CS__QF_CS_MeetingMarkers_05403D21 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MeetingChair008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarkerSteward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarkerSteward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Palace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Palace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingTableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingTableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlSpeaking
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlSpeaking Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlMootNominator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlMootNominator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlBeginMeeting
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlBeginMeeting Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingThrone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingThrone Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeetingChair002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeetingChair002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandMarker003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandMarker003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl007 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE CS_MeetingScript
Quest __temp = self as Quest
CS_MeetingScript kmyQuest = __temp as CS_MeetingScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30)
kmyQuest.EndMoot()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CS_MeetingScript
Quest __temp = self as Quest
CS_MeetingScript kmyQuest = __temp as CS_MeetingScript
;END AUTOCAST
;BEGIN CODE
;Jarl Moot Vote Stage
SetObjectiveDisplayed(30)
kmyQuest.StartMootVote()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE CS_MeetingScript
Quest __temp = self as Quest
CS_MeetingScript kmyQuest = __temp as CS_MeetingScript
;END AUTOCAST
;BEGIN CODE
; Ending Stage
kmyQuest.RegisterForJarlsToLeave()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CS_MeetingScript
Quest __temp = self as Quest
CS_MeetingScript kmyQuest = __temp as CS_MeetingScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartMeeting()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_MeetingScript
Quest __temp = self as Quest
CS_MeetingScript kmyQuest = __temp as CS_MeetingScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MeetingDay = math.floor(kmyQuest.GameDaysPassed.GetValue()) + 1
RegisterForUpdateGameTime(1)
SetObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CS_MeetingScript
Quest __temp = self as Quest
CS_MeetingScript kmyQuest = __temp as CS_MeetingScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.JarlsSit()
SetObjectiveCompleted(10)
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_MeetingScript
Quest __temp = self as Quest
CS_MeetingScript kmyQuest = __temp as CS_MeetingScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GetJarls()
kmyQuest.GetMinorThrone()
kmyQuest.MoveToMarkers()
kmyQuest.RegisterForJarlsToStand()
SetObjectiveCompleted(0)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
