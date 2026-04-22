;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname CS__QF_CS_AttackCityApproachG_050CB505 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GuardMarker001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardMarker001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardMarker000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardMarker000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExteriorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WarRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WarRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardMarker002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardMarker002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityManagementActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityManagementActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardMarker003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardMarker003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard002 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_AttackCityApproachGatesScript
Quest __temp = self as Quest
CS_AttackCityApproachGatesScript kmyQuest = __temp as CS_AttackCityApproachGatesScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MovePlayerToEntrance()
if kmyQuest.CS_TroopFormUp.IsRunning() && (kmyQuest.CS_TroopFormUp as CS_TroopFormUpScript).Waiting == 0
	;Start Attack City
	;Force Following Following Troops To Attack City Troops
else
	kmyQuest.SpawnGuards()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CS_AttackCityApproachGatesScript
Quest __temp = self as Quest
CS_AttackCityApproachGatesScript kmyQuest = __temp as CS_AttackCityApproachGatesScript
;END AUTOCAST
;BEGIN CODE
;Jarl Refuses to Surrender

;Fade To Black
Actor PlayerRef = Game.GetPlayer()
Game.FadeOutGame(false, true, 1, 1) ;Fade to Black
Alias_Jarl.TryToMoveTo(kmyQuest.OriginalJarlLocation);Jarl Moves Back to Original Location
ObjectReference JarlLocation = kmyQuest.OriginalJarlLocation
kmyQuest.OriginalJarlLocation = None
JarlLocation.disable()
JarlLocation.delete()

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_AttackCityApproachGatesScript
Quest __temp = self as Quest
CS_AttackCityApproachGatesScript kmyQuest = __temp as CS_AttackCityApproachGatesScript
;END AUTOCAST
;BEGIN CODE
Game.EnablePlayerControls()

kmyQuest.DeleteGuards()
kmyQuest.ReturnToEnemies()
debug.trace("ApproachGates Quest Stopped")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Jarl Surrenders City

Game.EnablePlayerControls()

;Initiate Holding Transfer

(Alias_ExteriorMarker as CS_AttackCityApproachGatesExtMarker).GoToState("StopOnUnattach");Stop quest on unload of Exterior Marker
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CS_AttackCityApproachGatesScript
Quest __temp = self as Quest
CS_AttackCityApproachGatesScript kmyQuest = __temp as CS_AttackCityApproachGatesScript
;END AUTOCAST
;BEGIN CODE
;Player wants to speak to Jarl

Game.DisablePlayerControls(abMovement = true, abLooking = false, abCamSwitch = true, abSneaking = true)
Actor PlayerRef = Game.GetPlayer()
Game.FadeOutGame(false, true, 1, 1) ;Fade to Black
kmyQuest.OriginalJarlLocation = Alias_Jarl.GetActorRef().PlaceAtMe(kmyQuest.CS_XMarker)
Alias_Jarl.TryToMoveTo(Alias_GuardMarker000.GetRef()); Move Jarl to Exterior Marker
;Fade Back to Normal
Alias_Jarl.TryToEvaluatePackage(); Evaluate Jarl Package

;Jarl Starts Dialogue
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Guard is no longer cooperative and just tells the player to leave

Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
