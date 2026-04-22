;/ Decompiled by Champollion V1.0.1
Source   : CS_SelectName.psc
Modified : 2022-03-01 10:30:41
Compiled : 2022-03-01 10:30:42
User     : Emilio
Computer : DESKTOP-EH9BGO7
/;
scriptName CS_SelectName extends Quest

;-- Properties --------------------------------------
Quest property TroopUpgradeQuest auto
formlist[] property GuardFormLists auto
referencealias property NameChanger auto
objectreference property ChestObject auto
globalvariable property ChangingName auto
objectreference property FactionNameChestObject auto
referencealias property FactionName auto
globalvariable property CustomOutfitTroopType auto
referencealias property ArmyName auto

;-- Variables ---------------------------------------
String NewFactionName
String NewArmyName

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function UpdateGuardNames()

	Int i = 0
	while i < GuardFormLists.length
		Int index = 0
		while index < GuardFormLists[i].GetSize()
			NameChanger.ForceRefTo((GuardFormLists[i].GetAt(index) as actor) as objectreference)
			NameChanger.Clear()
			index += 1
		endWhile
		i += 1
	endWhile
	debug.notification("Guard Name Change Complete")
endFunction

; Skipped compiler generated GotoState

function ChangeName()

	ArmyName.ForceRefTo(ChestObject)
	FactionName.ForceRefTo(FactionNameChestObject)
	NewFactionName = ((self as form) as uilib_1).ShowTextInput("Enter Faction Name", "")
	if NewFactionName != ""
		FactionNameChestObject.GetBaseObject().SetName(NewFactionName)
	endIf
	NewArmyName = ((self as form) as uilib_1).ShowTextInput("Enter Army Prefix ex. (Stormcloak) soldier or (Imperial) archer: ", "")
	if NewArmyName != ""
		ChestObject.GetBaseObject().SetName(NewArmyName)
	endIf
endFunction

function UpdateName()

	ChestObject.GetBaseObject().SetName(NewArmyName)
	FactionNameChestObject.GetBaseObject().SetName(NewFactionName)
endFunction
