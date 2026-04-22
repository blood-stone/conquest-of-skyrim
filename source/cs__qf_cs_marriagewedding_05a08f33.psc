;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname CS__QF_CS_MarriageWedding_05A08F33 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WitnessSpot005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitnessSpot002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitnessSpot007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Priest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Priest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Palace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Palace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWitness006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerWitness006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitnessSpot006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitnessSpot009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpouseWitness001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpouseWitness001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitnessSpot011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpouseWitness006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpouseWitness006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpouseWitness004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpouseWitness004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sponsor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sponsor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWitness003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerWitness003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpouseWitness005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpouseWitness005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWitness001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerWitness001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpouseWitness002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpouseWitness002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWitness005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerWitness005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpouseSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpouseSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitnessSpot010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitnessSpot008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWitness002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerWitness002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitnessSpot004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpouseWitness003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpouseWitness003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerWitness004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerWitness004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PriestSpot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PriestSpot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitnessSpot001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitnessSpot003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitnessSpot003 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CS_MarriageWeddingScript
Quest __temp = self as Quest
CS_MarriageWeddingScript kmyQuest = __temp as CS_MarriageWeddingScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(20)

Alias_Priest.GetActorRef().MoveTo(Alias_PriestSpot.GetRef())
Alias_Spouse.GetActorRef().MoveTo(Alias_SpouseSpot.GetRef())
if Alias_Sponsor.GetActorRef() != Alias_Spouse.GetActorRef()
	Alias_Sponsor.GetActorRef().MoveTo(Alias_WitnessSpot001.GetRef())
endif

Alias_SpouseWitness001.TryToMoveTo(Alias_WitnessSpot002.GetRef())
Alias_SpouseWitness002.TryToMoveTo(Alias_WitnessSpot003.GetRef())
Alias_SpouseWitness003.TryToMoveTo(Alias_WitnessSpot004.GetRef())
Alias_SpouseWitness004.TryToMoveTo(Alias_WitnessSpot005.GetRef())
Alias_SpouseWitness005.TryToMoveTo(Alias_WitnessSpot006.GetRef())

Alias_PlayerWitness001.TryToMoveTo(Alias_WitnessSpot007.GetRef())
Alias_PlayerWitness002.TryToMoveTo(Alias_WitnessSpot008.GetRef())
Alias_PlayerWitness003.TryToMoveTo(Alias_WitnessSpot009.GetRef())
Alias_PlayerWitness004.TryToMoveTo(Alias_WitnessSpot010.GetRef())
Alias_PlayerWitness005.TryToMoveTo(Alias_WitnessSpot011.GetRef())

if Alias_PriestSpot.GetRef().Is3DLoaded()
	kmyQuest.WeddingScene.ForceStart()
	SetObjectiveCompleted(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_MarriageWeddingScript
Quest __temp = self as Quest
CS_MarriageWeddingScript kmyQuest = __temp as CS_MarriageWeddingScript
;END AUTOCAST
;BEGIN CODE
;Check for the player's wedding day
kmyQuest.WeddingDay = (Math.Floor(kmyquest.GameDaysPassed.GetValue())) + 1
kmyQuest.RegisterForUpdateGameTime(1)

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CS_MarriageWeddingScript
Quest __temp = self as Quest
CS_MarriageWeddingScript kmyQuest = __temp as CS_MarriageWeddingScript
;END AUTOCAST
;BEGIN CODE
Alias_Spouse.GetActorReference().RemoveFromFaction(RelationshipCourtingFaction)
Alias_Spouse.GetActorReference().RemoveFromFaction(PotentialHireling)
Alias_Spouse.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 4)
Alias_Spouse.GetActorReference().AddtoFaction(PlayerFaction)
Alias_Spouse.GetActorReference().AddtoFaction(PlayerMarriedFaction)
Alias_Spouse.GetActorReference().AddtoFaction(MarriedToPlayerFaction)

Game.GetPlayer().AddtoFaction(PlayerMarriedFaction)

Game.GetPlayer().AddItem(MarriageRingBondsofMatrimony, 1)
Alias_Spouse.GetActorReference().AddItem(MarriageRingBondsofMatrimony, 1)

kmyQuest.MarriageScript.SetUpSpouseHouse()

kmyQuest.StrengthenFamilyRelations()

kmyquest.UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CS_MarriageWeddingScript
Quest __temp = self as Quest
CS_MarriageWeddingScript kmyQuest = __temp as CS_MarriageWeddingScript
;END AUTOCAST
;BEGIN CODE
;Priest begins the ceremony
Game.ForceThirdPerson()
Game.DisablePlayerControls(abLooking = false, abCamSwitch = true, abSneaking = true)
Game.SetPlayerAIDriven()
Game.ShowFirstPersonGeometry( false )
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Priest asks the player to say vows
Game.SetPlayerAIDriven(False)
Game.ShowFirstPersonGeometry( true )
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property MarriageRingBondsofMatrimony  Auto  

Faction Property PlayerFaction  Auto  

Faction Property PlayerMarriedFaction  Auto  

Faction Property RelationshipCourtingFaction  Auto  

Faction Property PotentialHireling  Auto  

Faction Property MarriedToPlayerFaction  Auto  
