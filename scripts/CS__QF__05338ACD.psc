;/ Decompiled by Champollion V1.0.1
Source   : CS__QF__05338ACD.psc
Modified : 2022-04-26 08:28:30
Compiled : 2022-04-26 08:28:32
User     : Emilio
Computer : DESKTOP-EH9BGO7
/;
scriptName CS__QF__05338ACD extends Quest hidden

;-- Properties --------------------------------------
locationalias property Alias_Holding auto
referencealias property Alias_PatrolMarker auto
referencealias property Alias_Troop14 auto
referencealias property Alias_PatrolMarker000 auto
referencealias property Alias_Troop8 auto
referencealias property Alias_Troop7 auto
referencealias property Alias_Troop20 auto
referencealias property Alias_Troop9 auto
referencealias property Alias_Troop1 auto
referencealias property Alias_Troop16 auto
referencealias property Alias_Troop5 auto
referencealias property Alias_Troop10 auto
referencealias property Alias_Troop18 auto
referencealias property Alias_Troop2 auto
Quest property UpgradeTroopsQuest auto
referencealias property Alias_Troop6 auto
referencealias property NewTroop auto
referencealias property Alias_Commander auto
formlist property ArmyList auto
referencealias property Alias_Troop15 auto
referencealias property Alias_Troop11 auto
referencealias property Alias_Troop13 auto
referencealias property Alias_Troop17 auto
referencealias property Alias_Troop19 auto
referencealias property Alias_Troop12 auto
referencealias property Alias_Troop3 auto
referencealias property Alias_Troop4 auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_12()

	Alias_Troop1.GetActorRef().enable(false)
	Alias_Troop2.GetActorRef().enable(false)
	Alias_Troop3.GetActorRef().enable(false)
	Alias_Troop4.GetActorRef().enable(false)
	Alias_Troop5.GetActorRef().enable(false)
	Alias_Troop6.GetActorRef().enable(false)
	Alias_Troop7.GetActorRef().enable(false)
	Alias_Troop8.GetActorRef().enable(false)
	Alias_Troop9.GetActorRef().enable(false)
	Alias_Troop10.GetActorRef().enable(false)
	Alias_Troop11.GetActorRef().enable(false)
	Alias_Troop12.GetActorRef().enable(false)
	Alias_Troop13.GetActorRef().enable(false)
	Alias_Troop14.GetActorRef().enable(false)
	Alias_Troop15.GetActorRef().enable(false)
	Alias_Troop16.GetActorRef().enable(false)
	Alias_Troop17.GetActorRef().enable(false)
	Alias_Troop18.GetActorRef().enable(false)
	Alias_Troop19.GetActorRef().enable(false)
	Alias_Troop20.GetActorRef().enable(false)
endFunction

; Skipped compiler generated GetState

function Fragment_0()

	Alias_Troop1.GetActorRef().EvaluatePackage()
	Alias_Troop2.GetActorRef().EvaluatePackage()
	Alias_Troop3.GetActorRef().EvaluatePackage()
	Alias_Troop4.GetActorRef().EvaluatePackage()
	Alias_Troop5.GetActorRef().EvaluatePackage()
	Alias_Troop6.GetActorRef().EvaluatePackage()
	Alias_Troop7.GetActorRef().EvaluatePackage()
	Alias_Troop8.GetActorRef().EvaluatePackage()
	Alias_Troop9.GetActorRef().EvaluatePackage()
	Alias_Troop10.GetActorRef().EvaluatePackage()
	Alias_Troop11.GetActorRef().EvaluatePackage()
	Alias_Troop12.GetActorRef().EvaluatePackage()
	Alias_Troop13.GetActorRef().EvaluatePackage()
	Alias_Troop14.GetActorRef().EvaluatePackage()
	Alias_Troop15.GetActorRef().EvaluatePackage()
	Alias_Troop16.GetActorRef().EvaluatePackage()
	Alias_Troop17.GetActorRef().EvaluatePackage()
	Alias_Troop18.GetActorRef().EvaluatePackage()
	Alias_Troop19.GetActorRef().EvaluatePackage()
	Alias_Troop20.GetActorRef().EvaluatePackage()
endFunction

function Fragment_10()

	Quest __temp = self as Quest
	cs_armytroopdeath kmyQuest = __temp as cs_armytroopdeath
	kmyQuest.RemoveFromGarrison(Alias_Commander.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop1.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop2.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop3.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop4.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop5.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop6.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop7.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop8.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop9.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop10.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop11.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop12.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop13.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop14.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop15.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop16.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop17.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop18.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop19.GetActorRef())
	kmyQuest.RemoveFromGarrison(Alias_Troop20.GetActorRef())
endFunction

function Fragment_13()

	Alias_Troop1.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop2.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop3.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop4.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop5.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop6.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop7.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop8.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop9.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop10.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop11.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop12.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop13.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop14.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop15.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop16.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop17.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop18.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop19.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
	Alias_Troop20.GetActorRef().MoveTo(Alias_Commander.GetActorRef() as objectreference, 0.000000, 0.000000, 0.000000, true)
endFunction

; Skipped compiler generated GotoState
