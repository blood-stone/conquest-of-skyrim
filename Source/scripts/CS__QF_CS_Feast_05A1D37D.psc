;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname CS__QF_CS_Feast_05A1D37D Extends Quest Hidden

;BEGIN ALIAS PROPERTY SpeechTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpeechTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityManagementActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityManagementActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard1Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard1Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Palace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Palace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PalaceEntranceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PalaceEntranceMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard2Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard2Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Throne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Throne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guest004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guest004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BardMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BardEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
kmyQuest.EveryoneEat()
kmyQuest.BardResumePlaying()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
Alias_CenterMarker.TryToEnable()
Alias_SpeechTrigger.TryToEnable()
if Game.GetPlayer().IsInLocation(Alias_Palace.GetLocation())
	SetStage(10)
else
	SetObjectiveDisplayed(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
;Alias_FestivalFoodMarker.TryToDisable()
;Alias_FestivalDecorationsMarker.TryToDisable()
Alias_BardEnableMarker.TryToDisable()
Alias_SpeechTrigger.TryToDisable()
kmyQuest.RemoveGuestsFromFaction()
if kmyQuest.EntertainmentType == 1
	Alias_Bard.GetActorRef().disable()
	Alias_Bard.GetActorRef().delete()
elseif kmyQuest.EntertainmentType == 2
	kmyQuest.CS_BardBand.DeleteBand()
endif
kmyQuest.CalculateInfluenceChange("Jarl", "Nobility")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetUp()
kmyQuest.MoveGuestsToPalace()
SetObjectiveCompleted(0)
SetObjectiveDisplayed(10)

if kmyQuest.EntertainmentType == 1
	Alias_BardEnableMarker.TryToEnable()
	if Alias_CenterMarker.GetRef().Is3DLoaded()
		kmyQuest.SpawnBard()
	else
		kmyQuest.BardsSpawned = 0
	endif
elseif kmyQuest.EntertainmentType == 2
	if Alias_CenterMarker.GetRef().Is3DLoaded()
		kmyQuest.SpawnBand()
	else
		kmyQuest.BardsSpawned = 0
	endif
endif

if kmyQuest.Speech == 1
	kmyQuest.SpeechTime = kmyQuest.GameDaysPassed.GetValue() + 0.021
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.BardStopPlaying()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
JarlSpeechScene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property JarlSpeechScene  Auto  
