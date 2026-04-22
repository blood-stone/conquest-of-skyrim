;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname CS__QF_CS_PlayerSurrender_05A40ADA Extends Quest Hidden

;BEGIN ALIAS PROPERTY DestinationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DestinationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arrester
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arrester Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CS_PlayerSurrenderScript
Quest __temp = self as Quest
CS_PlayerSurrenderScript kmyQuest = __temp as CS_PlayerSurrenderScript
;END AUTOCAST
;BEGIN CODE
Alias_Arrester.GetActorRef().Delete()

;debug.sendAnimationEvent(Game.GetPlayer(), "OffsetBoundStandingStart")
(Game.GetPlayer() as Actor).UnEquipItem(PrisonerCuffs, abSilent=true)
(Game.GetPlayer() as Actor).RemoveItem(PrisonerCuffs, abSilent=true)
(Game.GetPlayer() as Actor).UnEquipItem(Gag, abSilent=true)
(Game.GetPlayer() as Actor).RemoveItem(Gag, abSilent=true)

Game.SetPlayerAIDriven(False)
Game.ShowFirstPersonGeometry( true )
Game.EnablePlayerControls()
Alias_Player.Clear()

StoryPlayerPrison.SendStoryEvent(akRef1 = Alias_DestinationMarker.GetRef())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if (Game.GetPlayer() as Actor).GetEquippedWeapon()
	Game.GetPlayer().UnEquipItem((Game.GetPlayer() as Actor).GetEquippedWeapon())
endif

if (Game.GetPlayer() as Actor).GetEquippedWeapon(true)
	Game.GetPlayer().UnEquipItem((Game.GetPlayer() as Actor).GetEquippedWeapon(true))
endif

if (Game.GetPlayer() as Actor).GetEquippedShield()
	Game.GetPlayer().UnEquipItem((Game.GetPlayer() as Actor).GetEquippedShield())
endif

debug.SendAnimationEvent(Game.GetPlayer(), "IdleSurrender")
Utility.Wait(3)

Alias_Player.ForceRefTo(Game.GetPlayer())
debug.sendAnimationEvent(Game.GetPlayer(), "OffsetBoundStandingStart")
(Game.GetPlayer() as Actor).EquipItem(PrisonerCuffs, abSilent=true)
(Game.GetPlayer() as Actor).EquipItem(Gag, abSilent=true)

Game.ForceThirdPerson()
Game.DisablePlayerControls(abMovement = false, abLooking = false, abCamSwitch = true, abSneaking = true)
Game.SetPlayerAIDriven()
Game.ShowFirstPersonGeometry( false )

Alias_Arrester.GetActorRef().EvaluatePackage()
Utility.Wait(3)
Alias_Player.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property PrisonerCuffs  Auto  

Armor Property Gag  Auto  

Quest Property CS_Execution  Auto  

ReferenceAlias Property Executionee  Auto  

ReferenceAlias Property ExecutionGuard  Auto  

Keyword Property StoryPlayerPrison  Auto  
