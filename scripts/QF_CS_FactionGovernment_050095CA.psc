;/ Decompiled by Champollion V1.0.1
Source   : QF_CS_FactionGovernment_050095CA.psc
Modified : 2022-05-31 18:11:32
Compiled : 2022-05-31 18:11:33
User     : Emilio
Computer : DESKTOP-EH9BGO7
/;
scriptName QF_CS_FactionGovernment_050095CA extends Quest hidden

;-- Properties --------------------------------------
referencealias property Alias_JarlMarkarth auto
referencealias property Alias_StewardWhiterun auto
referencealias property Alias_LeaderRorikstead auto
referencealias property Alias_ArmySecondInCommand auto
referencealias property Alias_JarFalkreath auto
referencealias property Alias_BaseMarker auto
referencealias property Alias_PlayerArmyName auto
locationalias property Alias_JarlChooseCity auto
locationalias property Alias_EnemyCity5 auto
referencealias property Alias_Spymaster auto
locationalias property Alias_Capital auto
referencealias property Alias_PlayerTitle auto
referencealias property Alias_StewardWinterhold auto
objectreference property BannerRoomTeleport auto
locationalias property Alias_EnemyCity2 auto
locationalias property Alias_UpgradeCity auto
referencealias property Alias_LeaderShorsStone auto
referencealias property Alias_ParadeCommander auto
locationalias property Alias_LawCity auto
locationalias property Alias_ParadeCity auto
referencealias property Alias_LeaderIvarstead auto
locationalias property Alias_ParadeCityPrevious auto
locationalias property Alias_CapitalPalace auto
referencealias property Alias_FactionName auto
referencealias property Alias_JarlSolitude auto
referencealias property Alias_LawStatue auto
referencealias property Alias_JarlWinterhold auto
referencealias property Alias_StewardDawnstar auto
referencealias property Alias_StewardMorthal auto
referencealias property Alias_PlayerAlias auto
referencealias property Alias_OutfitChangerMkII auto
locationalias property Alias_EnemyCity3 auto
locationalias property Alias_EnemyCity6 auto
referencealias property Alias_LeaderRiverwood auto
locationalias property Alias_EnemyCity1 auto
referencealias property Alias_JarlMorthal auto
referencealias property Alias_Blacksmith auto
locationalias property Alias_MessagingCity auto
locationalias property Alias_EnemyCity0 auto
referencealias property Alias_NameChangerFaction auto
referencealias property Alias_NameChangerMkI auto
referencealias property Alias_LawAlias1 auto
locationalias property Alias_InvadeLocation auto
locationalias property Alias_EnemyCity8 auto
referencealias property Alias_JarlWindhelm auto
referencealias property Alias_LawAlias0 auto
referencealias property Alias_StewardWindhelm auto
referencealias property Alias_JarlWhiterun auto
referencealias property Alias_JarlChoose auto
locationalias property Alias_CapitalCS auto
referencealias property Alias_CourtMage auto
referencealias property Alias_StewardSolitude auto
locationalias property Alias_EnemyCity4 auto
referencealias property Alias_OutfitChangerMkI auto
Quest property GovQuest auto
referencealias property Alias_JarlDawnstar auto
referencealias property Alias_StewardMarkarth auto
objectreference property PreviousLoc auto
locationalias property Alias_EnemyCity7 auto
globalvariable property GovCosts auto
spell property BannerSpell auto
globalvariable property FactionStarted auto
referencealias property Alias_StewardRiften auto
referencealias property Alias_FactionFlag auto
referencealias property Alias_LeaderKarthwasten auto
referencealias property Alias_Steward auto
referencealias property Alias_LeaderDragonBridge auto
referencealias property Alias_MessagingPerson auto
referencealias property Alias_StewardFalkreath auto
referencealias property Alias_PlayerAliasWithTitle auto
locationalias property Alias_FirstCity auto
referencealias property Alias_JarlRiften auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function Fragment_20()

	self.SetObjectiveCompleted(13, true)
	self.SetObjectiveDisplayed(14, true, false)
endFunction

function Fragment_15()

	self.SetObjectiveCompleted(10, true)
	self.SetObjectiveDisplayed(11, true, false)
endFunction

; Skipped compiler generated GetState

function Fragment_19()

	self.SetObjectiveCompleted(12, true)
	self.SetObjectiveDisplayed(13, true, false)
endFunction

function Fragment_8()

	self.SetObjectiveCompleted(6, true)
	self.SetObjectiveDisplayed(7, true, false)
endFunction

function Fragment_7()

	self.SetObjectiveCompleted(2, true)
	self.SetObjectiveDisplayed(3, true, false)
endFunction

function Fragment_23()

	self.SetObjectiveCompleted(15, true)
	self.SetObjectiveDisplayed(16, true, false)
endFunction

function Fragment_11()

	self.SetObjectiveCompleted(7, true)
	self.SetObjectiveDisplayed(8, true, false)
endFunction

function Fragment_14()

	self.SetObjectiveCompleted(9, true)
	self.SetObjectiveDisplayed(10, true, false)
endFunction

function Fragment_24()

	self.SetObjectiveCompleted(16, true)
	self.SetObjectiveDisplayed(17, true, false)
endFunction

function Fragment_12()

	self.SetObjectiveCompleted(8, true)
	self.SetObjectiveDisplayed(9, true, false)
endFunction

function Fragment_10()

	self.SetObjectiveCompleted(0, true)
	self.SetObjectiveDisplayed(1, true, false)
endFunction

function Fragment_0()

	Quest __temp = self as Quest
	cs_selectname kmyQuest = __temp as cs_selectname
	FactionStarted.SetValue(1 as Float)
	game.GetPlayer().AddSpell(BannerSpell, true)
	kmyQuest.ChangeName()
	PreviousLoc.MoveTo(game.GetPlayer() as objectreference, 0.000000, 0.000000, 0.000000, true)
	game.GetPlayer().MoveTo(BannerRoomTeleport, 0.000000, 0.000000, 0.000000, true)
	(GovQuest as cs_changewarmaps).ReplaceMaps()
endFunction

function Fragment_4()

	self.SetObjectiveCompleted(4, true)
	self.SetObjectiveDisplayed(5, true, false)
endFunction

function Fragment_25()

	self.SetObjectiveCompleted(17, true)
endFunction

function Fragment_2()

	self.SetObjectiveCompleted(3, true)
	self.SetObjectiveDisplayed(4, true, false)
endFunction

function Fragment_22()

	self.SetObjectiveCompleted(14, true)
	self.SetObjectiveDisplayed(15, true, false)
endFunction

function Fragment_6()

	self.SetObjectiveCompleted(1, true)
	self.SetObjectiveDisplayed(2, true, false)
endFunction

function Fragment_16()

	self.SetObjectiveCompleted(11, true)
	self.SetObjectiveDisplayed(12, true, false)
endFunction

function Fragment_5()

	self.SetObjectiveCompleted(5, true)
	self.SetObjectiveDisplayed(6, true, false)
endFunction
