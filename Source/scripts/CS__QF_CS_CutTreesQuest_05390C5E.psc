;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname CS__QF_CS_CutTreesQuest_05390C5E Extends Quest Hidden

;BEGIN ALIAS PROPERTY tree
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tree Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_AdvanceTimeScript
Quest __temp = self as Quest
CS_AdvanceTimeScript kmyQuest = __temp as CS_AdvanceTimeScript
;END AUTOCAST
;BEGIN CODE
if Alias_tree.GetRef()
	Game.DisablePlayerControls(abMovement = true, abLooking = false, abCamSwitch = true, abSneaking = true)
	Actor PlayerRef = Game.GetPlayer()
	Game.FadeOutGame(false, true, 4, 2)
	kmyQuest.AdvanceTimeBy(1)
	WoodCutSound.PlayAndWait(PlayerRef)
	WoodCutSound.PlayAndWait(PlayerRef)
	WoodCutSound.PlayAndWait(PlayerRef)
	PlayerRef.AddItem(CS_ResourceWoodLog, 1)
	Game.EnablePlayerControls()
else
	debug.notification("There are no trees nearby!")
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property CS_ResourceWoodLog  Auto  

Sound Property WoodCutSound  Auto  
