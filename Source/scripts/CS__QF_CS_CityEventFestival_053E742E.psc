;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname CS__QF_CS_CityEventFestival_053E742E Extends Quest Hidden

;BEGIN ALIAS PROPERTY SpeechTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpeechTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityManagementActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityManagementActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FestivalSandboxMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FestivalSandboxMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard1Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard1Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FestivalDecorationsMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FestivalDecorationsMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FestivalFoodMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FestivalFoodMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen020
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen020 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CitizenSpeech
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CitizenSpeech Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard2Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard2Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen015 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen019
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen019 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardLeadMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BardLeadMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BardEnableMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BardEnableMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen012 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
Alias_CitizenSpeech.TryToEvaluatePackage()
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
kmyQuest.Setup()
if kmyQuest.FoodType > 0
	Alias_FestivalFoodMarker.TryToEnable()
endif

SetObjectiveDisplayed(0)

if kmyQuest.EntertainmentType == 1
	Alias_BardEnableMarker.TryToEnable()
	if Alias_FestivalSandboxMarker.GetRef().Is3DLoaded()
		kmyQuest.SpawnBard()
	else
		kmyQuest.BardsSpawned = 0
	endif
elseif kmyQuest.EntertainmentType == 2
	if Alias_FestivalSandboxMarker.GetRef().Is3DLoaded()
		kmyQuest.SpawnBand()
	else
		kmyQuest.BardsSpawned = 0
	endif
endif

if kmyQuest.Speech == 1
	Alias_SpeechTrigger.TryToEnable()
endif

if kmyQuest.Decorations == 1
	Alias_FestivalDecorationsMarker.TryToEnable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(5)
Game.EnablePlayerControls()
Game.SetPlayerAIDriven(False)
Game.GetPlayer().ClearLookAt()
kmyQuest.GuestsStopWatchPlayerGiveSpeech()
kmyQuest.BardResumePlaying()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailed(5)
Game.EnablePlayerControls()
Game.SetPlayerAIDriven(False)
Game.GetPlayer().ClearLookAt()
kmyQuest.GuestsStopWatchPlayerGiveSpeech()
kmyQuest.BardResumePlaying()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GuestsWatchPlayerGiveSpeech()
Game.DisablePlayerControls(abMovement = true, abLooking = false, abCamSwitch = true, abSneaking = true)
Game.SetPlayerAIDriven(True)
Game.GetPlayer().SetLookAt(Alias_FestivalSandboxMarker.GetRef(), true)
Game.GetPlayer().EvaluatePackage()
CS_CityEventFestivalSpeechStart.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_FeastScript
Quest __temp = self as Quest
CS_FeastScript kmyQuest = __temp as CS_FeastScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
Alias_FestivalFoodMarker.TryToDisable()
Alias_FestivalDecorationsMarker.TryToDisable()
Alias_BardEnableMarker.TryToDisable()
Alias_SpeechTrigger.TryToDisable()
if kmyQuest.EntertainmentType == 1
	Alias_Bard.GetActorRef().disable()
	Alias_Bard.GetActorRef().delete()
elseif kmyQuest.EntertainmentType == 2
	kmyQuest.CS_BardBand.DeleteBand()
endif
kmyQuest.CalculateInfluenceChange("Player", "Commoner")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(0)
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property CS_CityEventFestivalSpeechStart  Auto  
