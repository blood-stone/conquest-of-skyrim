;/ Decompiled by Champollion V1.0.1
Source   : CS_AttackingTroopDeath.psc
Modified : 2022-04-05 15:01:05
Compiled : 2022-04-05 15:01:06
User     : Emilio
Computer : DESKTOP-EH9BGO7
/;
scriptName CS_AttackingTroopDeath extends Actor

;-- Properties --------------------------------------
faction property AttackingCityFaction auto
faction property CS_DefendingCityFaction auto
quest property CityQuest auto
faction property CS_AttackingMinorCityFaction auto
quest property MinorCityQuest auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnCellDetach()

	if self.IsDead() == 1 as Bool
		self.delete()
	endIf
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnUpdate()

	self.delete()
endFunction

function MarkForDelete()

	self.RegisterForSingleUpdate(10 as Float)
endFunction

function OnDeath(Actor akKiller)

	if self.IsInFaction(AttackingCityFaction) == 1 as Bool
		self.MarkForDelete()
	elseIf self.IsInFaction(CS_AttackingMinorCityFaction) == 1 as Bool
		self.MarkForDelete()
	endIf
endFunction
