Scriptname CS_UpgradeTroopsMenu extends Quest  conditional

bool Property CustomOutfitGendered Auto conditional


Function MenuStart(int Response = 0)
	UpdateCurrentInstanceGlobal(Treasury)
	UpdateCurrentInstanceGlobal(Metal)
	Response = MenuStart.show()
	if Response == 0
		MenuSoldier()
	elseif Response == 1
		MenuWarrior()
	elseif Response == 2
		MenuArcher()
	elseif Response == 3
		MenuCrossbow()
	elseif Response == 4
		MenuGuard1()
	endif
EndFunction

Function MenuSoldier(int Response = 0)
	Response = MenuSoldier.show()
	If Response < 7
		UpgradeArmyTroops(0, Response)
	Else
		MenuStart()
	EndIf
endFunction

Function MenuWarrior(int Response = 0)
	Response = MenuWarrior.show()
	If Response < 7
		UpgradeArmyTroops(1, Response)
	Else
		MenuStart()
	EndIf
endFunction

Function MenuArcher(int Response = 0)
	Response = MenuArcher.show()
	If Response < 7
		UpgradeArmyTroops(2, Response)
	Else
		MenuStart()
	EndIf
endFunction

Function MenuCrossbow(int Response = 0)
	Response = MenuCrossbow.show()
	If Response < 7
		UpgradeArmyTroops(3, Response)
	Else
		MenuStart()
	EndIf
endFunction

Function MenuGuard1(int Response = 0)
	Response = MenuGuard1.show()
	If Response < 8
		UpgradeGuards(4, Response)
	ElseIf Response == 8
		MenuGuard2()
	Else
		MenuStart()
	EndIf
endFunction

Function MenuGuard2(int Response = 0)
	Response = MenuGuard2.show()
	If Response == 0
		MenuGuard1()
	ElseIf Response < 7
		UpgradeGuards(4, Response + 7)
	Else
		MenuStart()
	EndIf
endFunction

Function MenuCustom(int Response = 0)
	if MagesResearched.GetValue() == 1
		Response = CustomMenuStart.show()
		if Response == 0
			MenuCustomStandard()
		elseif Response == 1
			MenuCustomMage()
		endif
	else
		MenuCustomStandard()
	endif
EndFunction

Function MenuCustomStandard(int Response = 0)
	Response = CustomMenuStandard.show()
	if Response < 5
		MenuCustomChange("Standard", Response)
	elseif Response == 5
		MenuCustom()
	endif
EndFunction

Function MenuCustomMage(int Response = 0)
	Response = CustomMenuMage.show()
	if Response < 6
		MenuCustomChange("Mage", Response)
	elseif Response == 6
		MenuCustom()
	endif
EndFunction

Function MenuCustomChange(string type, int troopvalue, int Response = 0)
	if type == "Standard"
		UpgradeTroop.ForceRefTo(AllUpgradeTroops.GetAt(troopvalue) as ObjectReference)
		CustomOutfitGendered = CustomOutfitsGendered[troopvalue].GetValueInt() as bool
	elseif type == "Mage"
		UpgradeTroop.ForceRefTo(AllUpgradeMages.GetAt(troopvalue) as ObjectReference)
		CustomOutfitGendered = CustomOutfitsGenderedMage[troopvalue].GetValueInt() as bool
	endif
	Response = CustomMenuChange.show()
	if Response == 0
		ModifyCustomOutfit(type = type, TroopType = troopvalue)
		while Utility.IsInMenuMode()
			Utility.WaitMenuMode(1)
		endwhile
		;RefreshList(type, troopvalue)
		UpgradeArmyTroops(troopvalue, -1, type)
		MenuCustomChange(type, troopvalue)
	elseif Response == 1
		ModifyCustomOutfitMale(type = type, TroopType = troopvalue)
		while Utility.IsInMenuMode()
			Utility.WaitMenuMode(1)
		endwhile
		;RefreshList(type, troopvalue)
		UpgradeArmyTroops(troopvalue, -1, type)
		MenuCustomChange(type, troopvalue)
	elseif Response == 2
		ModifyCustomOutfitFemale(type = type, TroopType = troopvalue)
		while Utility.IsInMenuMode()
			Utility.WaitMenuMode(1)
		endwhile
		;RefreshList(type, troopvalue)
		UpgradeArmyTroops(troopvalue, -1, type)
		MenuCustomChange(type, troopvalue)
	elseif Response == 3
		EnableGenderedOutfits(type = type, TroopType = troopvalue)
		;RefreshList(type, troopvalue)
		MenuCustomChange(type, troopvalue)
	elseif Response == 4
		DisableGenderedOutfits(type = type, TroopType = troopvalue)
		;RefreshList(type, troopvalue)
		MenuCustomChange(type, troopvalue)
	elseif Response == 5
		if type == "Standard"
			MenuCustomStandard()
		elseif type == "Mage"
			MenuCustomMage()
		endif
	endif
EndFunction

Function ModifyCustomOutfit(string type, int TroopType)
	if type == "Standard"
		(CustomOutfitNPC[TroopType] as Actor).OpenInventory(true)
	elseif type == "Mage"
		(CustomOutfitNPCMage[TroopType] as Actor).OpenInventory(true)
	endif
EndFunction

Function ModifyCustomOutfitMale(string type, int TroopType)
	if type == "Standard"
		(CustomOutfitNPCMale[TroopType] as Actor).OpenInventory(true)
	elseif type == "Mage"
		(CustomOutfitNPCMageMale[TroopType] as Actor).OpenInventory(true)
	endif
EndFunction

Function ModifyCustomOutfitFemale(string type, int TroopType)
	if type == "Standard"
		(CustomOutfitNPCFemale[TroopType] as Actor).OpenInventory(true)
	elseif type == "Mage"
		(CustomOutfitNPCMageFemale[TroopType] as Actor).OpenInventory(true)
	endif
EndFunction

Function EnableGenderedOutfits(string type, int TroopType)
	if type == "Standard"
		CustomOutfitsGendered[TroopType].SetValue(1)
	elseif type == "Mage"
		CustomOutfitsGenderedMage[TroopType].SetValue(1)
	endif
EndFunction

Function DisableGenderedOutfits(string type, int TroopType)
	if type == "Standard"
		CustomOutfitsGendered[TroopType].SetValue(0)
	elseif type == "Mage"
		CustomOutfitsGenderedMage[TroopType].SetValue(1)
	endif
EndFunction

Function RefreshList(string type, int TroopType)
	if type == "Standard"
		OutfitListsMale[TroopType].Revert()
		OutfitListsFemale[TroopType].Revert()
		ItemListsMale[TroopType].Revert()
		ItemListsFemale[TroopType].Revert()
		if CustomOutfitsGendered[TroopType].GetValue() == 1
			int i = 0
			while i < CustomOutfitsMale[TroopType].GetSize()
				if CustomOutfitsMale[TroopType].GetAt(i) as Armor
					OutfitListsMale[TroopType].AddForm(CustomOutfitsMale[TroopType].GetAt(i), 0, 1)
				else
					ItemListsMale[TroopType].AddForm(CustomOutfitsMale[TroopType].GetAt(i), 0, 1)
				endif
				i += 1
			endwhile
			i = 0
			while i < CustomOutfitsFemale[TroopType].GetSize()
				if CustomOutfitsFemale[TroopType].GetAt(i) as Armor
					OutfitListsFemale[TroopType].AddForm(CustomOutfitsFemale[TroopType].GetAt(i), 0, 1)
				else
					ItemListsFemale[TroopType].AddForm(CustomOutfitsFemale[TroopType].GetAt(i), 0, 1)
				endif
				i += 1
			endwhile
		else
			int i = 0
			while i < CustomOutfits[TroopType].GetSize()
				if CustomOutfits[TroopType].GetAt(i) as Armor
					OutfitListsMale[TroopType].AddForm(CustomOutfits[TroopType].GetAt(i), 0, 1)
					OutfitListsFemale[TroopType].AddForm(CustomOutfits[TroopType].GetAt(i), 0, 1)
				else
					ItemListsMale[TroopType].AddForm(CustomOutfits[TroopType].GetAt(i), 0, 1)
					ItemListsFemale[TroopType].AddForm(CustomOutfits[TroopType].GetAt(i), 0, 1)
				endif
				i += 1
			endwhile
		endif
	endif
EndFunction

Function MenuCustomOutfit(int TroopType, int Response = 0)
	Response = CustomOutfitMenus[TroopType].show()
	If Response == 0
		(CustomOutfitNPC[TroopType] as Actor).OpenInventory(true)
	ElseIf Response == 1
		(CustomOutfitNPCMale[TroopType] as Actor).OpenInventory(true)
	ElseIf Response == 2
		(CustomOutfitNPCFemale[TroopType] as Actor).OpenInventory(true)
	ElseIf Response == 3
		CustomOutfitsGendered[TroopType].SetValue(1)	
		MenuCustomOutfit(TroopType)
	ElseIf Response == 4
		CustomOutfitsGendered[TroopType].SetValue(0)
		MenuCustomOutfit(TroopType)
	EndIf
EndFunction

Function PayForUpgrade(int CoinAmount, int MetalAmount, int TroopType, int NewOutfitNum)
	If Treasury.GetValue() < CoinAmount
		debug.notification("Not enough gold!")
	ElseIf Metal.GetValue() < MetalAmount
		debug.notification("Not enought metal!")
	Else
		Treasury.SetValue(Treasury.GetValue() - CoinAmount)
		debug.notification(CoinAmount + " Gold deducted from the Treasury!")
		CoinSound.Play(Game.GetPlayer())
		Metal.SetValue(Metal.GetValue() - MetalAmount)
		debug.notification(MetalAmount + " Metal deducted from the Reserve!")
		MetalSound.Play(Game.GetPlayer())
		(UpgradePurchased[TroopType].GetAt(NewOutfitNum - 1) as GlobalVariable).SetValue(1)
		If TroopType != 4
			UpgradeArmyTroops(TroopType, NewOutfitNum)
		Else
			UpgradeGuards(TroopType, NewOutfitNum)
		EndIf
	EndIf
endFunction

Function UpgradeArmyTroops(int TroopType, int NewOutfitNum, string type = "Standard")
	debug.notification("Upgrading Troops...")
	if type == "Standard"
		OutfitNum[TroopType].SetValue(NewOutfitNum)
		EquipmentUpdater.UpdateList(TroopType)
	elseif type == "Mage"
		MageOutfitNums[TroopType].SetValue(NewOutfitNum)
		if TroopType < 3
			TroopType = 5
		else
			TroopType += 3
		endif
	endif
	int index = 0
	while index < CommanderScript.Commanders.Length
		if CommanderScript.Commanders[index].GetActorRef()
			Actor Commander = CommanderScript.Commanders[index].GetActorRef()
			Actor[] ArmyTroops = CommanderScript.ArmyScripts[index].GetAllTroops()
			int i = 0
			while i < ArmyTroops.Length
				Actor Troop = ArmyTroops[i]
				if Troop
					if Troop.GetActorBase() == TroopManage.Troops[TroopType]
						if Commander.Is3DLoaded()
							Troop.reset(Troop)
						else
							((Troop as ObjectReference) as CS_UpgradeTroopOnAttach).FlaggedForReset = true
						endif
					endif
				endif
				i += 1
			endwhile
		endif
		index += 1
	endwhile
	debug.notification("Troop Upgrade Complete!")
EndFunction

Function UpgradeTroopCustom(int TroopType)
	If TroopType < 4
		UpgradeArmyTroops(TroopType, -1)
	ElseIf TroopType == 4
		UpgradeGuards(NewOutfitNum = -1)
	EndIf
EndFunction

Function UpgradeGuards(int TroopType = 4, int NewOutfitNum)
	debug.notification("Upgrading Guards... ")
	TroopType = 4
	OutfitNum[TroopType].SetValue(NewOutfitNum)
	EquipmentUpdater.UpdateList(TroopType)
	int index = 0
	while index < AllGuardFormLists.GetSize()
		if Game.GetPlayer().IsInLocation(AllLocations.GetAt(index) as Location)
			int i = 0
			while i < (AllGuardFormLists.GetAt(index) as FormList).GetSize()
				Actor Troop = (AllGuardFormLists.GetAt(index) as FormList).GetAt(i) as Actor
				if Troop.Is3DLoaded()
					((Troop as ObjectReference) as CS_UpgradeGuardOnAttach).UpgradeTroop(Troop)	
				endif	
				i += 1
			endwhile
		endif
		index += 1
	endwhile
	debug.notification("Guard Upgrade Complete!")
EndFunction

Function UpgradeGuard(Actor Troop)
		OutfitChanger.ForceRefTo(Troop)
		OutfitChanger.Clear()
				if OutfitNum[4].GetValue() == -1
					if CustomOutfitsGendered[4].GetValue() == 1
						if Troop.GetLeveledActorBase().GetSex() == 0
							if Troop.IsEquipped(CustomOutfitsMale[4]) != 1 || Troop.IsInFaction(NeedOutfitFaction) == 1
								Troop.RemoveAllItems()
								int outfitpiece = 0
								while outfitpiece < CustomOutfitsMale[4].GetSize()
									Troop.AddItem(CustomOutfitsMale[4].GetAt(outfitpiece), 1)
									if CustomOutfitsMale[4].GetAt(outfitpiece).HasKeyword(ArmorHeavy) || CustomOutfitsMale[4].GetAt(outfitpiece).HasKeyword(ArmorLight) || CustomOutfitsMale[4].GetAt(outfitpiece).HasKeyword(ArmorClothing) || CustomOutfitsMale[4].GetAt(outfitpiece).HasKeyword(ArmorJewelry)
										Troop.EquipItem(CustomOutfitsMale[4].GetAt(outfitpiece), true)
									endif
									outfitpiece += 1
								endwhile
								Troop.RemoveFromFaction(NeedOutfitFaction)
							endif
						elseif Troop.GetLeveledActorBase().GetSex() == 1
							if Troop.IsEquipped(CustomOutfitsFemale[4]) != 1 || Troop.IsInFaction(NeedOutfitFaction) == 1
								Troop.RemoveAllItems()
								int outfitpiece = 0
								while outfitpiece < CustomOutfitsFemale[4].GetSize()
									Troop.AddItem(CustomOutfitsFemale[4].GetAt(outfitpiece), 1)
									if CustomOutfitsFemale[4].GetAt(outfitpiece).HasKeyword(ArmorHeavy) || CustomOutfitsFemale[4].GetAt(outfitpiece).HasKeyword(ArmorLight) || CustomOutfitsFemale[4].GetAt(outfitpiece).HasKeyword(ArmorClothing) || CustomOutfitsFemale[4].GetAt(outfitpiece).HasKeyword(ArmorJewelry)
										Troop.EquipItem(CustomOutfitsFemale[4].GetAt(outfitpiece), true)
									endif
									outfitpiece += 1
								endwhile
								Troop.RemoveFromFaction(NeedOutfitFaction)
							endif
						endif
					else
						if Troop.IsEquipped(CustomOutfits[4]) != 1 || Troop.IsInFaction(NeedOutfitFaction) == 1
							Troop.RemoveAllItems()
							int outfitpiece = 0
							while outfitpiece < CustomOutfits[4].GetSize()
								Troop.AddItem(CustomOutfits[4].GetAt(outfitpiece), 1)
								if CustomOutfits[4].GetAt(outfitpiece).HasKeyword(ArmorHeavy) || CustomOutfits[4].GetAt(outfitpiece).HasKeyword(ArmorLight) || CustomOutfits[4].GetAt(outfitpiece).HasKeyword(ArmorClothing) || CustomOutfits[4].GetAt(outfitpiece).HasKeyword(ArmorJewelry)
									Troop.EquipItem(CustomOutfits[4].GetAt(outfitpiece), true)
								endif
								outfitpiece += 1
							endwhile
							Troop.RemoveFromFaction(NeedOutfitFaction)
						endif
					endif
				else
					FormList NewOutfit = (Outfits[4].GetAt(OutfitNum[4].GetValue() as int) as FormList)
					If Troop.IsEquipped(NewOutfit.GetAt(0) as Armor) != 1 || Troop.IsInFaction(NeedOutfitFaction) == 1
						Troop.RemoveAllItems()
						int outfitpiece = 0
						while outfitpiece < NewOutfit.GetSize()
							Troop.EquipItem(NewOutfit.GetAt(outfitpiece) as Armor, true)
							outfitpiece += 1
						endwhile
						Troop.AddItem((Swords[4].GetAt(utility.randomint(0, Swords[4].GetSize() - 1)) as FormList).GetAt(OutfitNum[4].GetValue() as int) as Weapon, 1)
						Troop.EquipItem(Shields[4].GetAt(OutfitNum[4].GetValue() as int) as Armor)
						Troop.AddItem(Bows[4].GetAt(OutfitNum[4].GetValue() as int) as Weapon, 1)
						Troop.AddItem(Ammos[4].GetAt(OutfitNum[4].GetValue() as int) as Ammo, 100)
						Troop.EquipItem(Ammos[4].GetAt(OutfitNum[4].GetValue() as int) as Ammo)
						Troop.RemoveFromFaction(NeedOutfitFaction)
					EndIf
				endif
EndFunction

Function UpgradeTroop(Actor Troop)
	int TroopType = BaseTroop.Find(Troop.GetActorBase())
		OutfitChanger.ForceRefTo(Troop)
		OutfitChanger.Clear()
		if TroopType >=0 && TroopType != 5
				if OutfitNum[TroopType].GetValue() == -1
					if CustomOutfitsGendered[TroopType].GetValue() == 1
						if Troop.GetLeveledActorBase().GetSex() == 0
							if Troop.IsEquipped(CustomOutfitsMale[TroopType]) != 1 || Troop.IsInFaction(NeedOutfitFaction) == 1
								Troop.RemoveAllItems()
								int outfitpiece = 0
								while outfitpiece < CustomOutfitsMale[TroopType].GetSize()
									debug.notification("Stuck on Line 426")
									debug.trace("Stuck on Line 426")
									Troop.AddItem(CustomOutfitsMale[TroopType].GetAt(outfitpiece), 1)
									if CustomOutfitsMale[TroopType].GetAt(outfitpiece).HasKeyword(ArmorHeavy) || CustomOutfitsMale[TroopType].GetAt(outfitpiece).HasKeyword(ArmorLight) || CustomOutfitsMale[TroopType].GetAt(outfitpiece).HasKeyword(ArmorClothing) || CustomOutfitsMale[TroopType].GetAt(outfitpiece).HasKeyword(ArmorJewelry)
										Troop.EquipItem(CustomOutfitsMale[TroopType].GetAt(outfitpiece), true)
									endif
									outfitpiece += 1
								endwhile
								Troop.RemoveFromFaction(NeedOutfitFaction)
							endif
						elseif Troop.GetLeveledActorBase().GetSex() == 1
							if Troop.IsEquipped(CustomOutfitsFemale[TroopType]) != 1 || Troop.IsInFaction(NeedOutfitFaction) == 1
								Troop.RemoveAllItems()
								int outfitpiece = 0
								while outfitpiece < CustomOutfitsFemale[TroopType].GetSize()
									debug.notification("Stuck on Line 441")
									debug.trace("Stuck on Line 441")
									Troop.AddItem(CustomOutfitsFemale[TroopType].GetAt(outfitpiece), 1)
									if CustomOutfitsFemale[TroopType].GetAt(outfitpiece).HasKeyword(ArmorHeavy) || CustomOutfitsFemale[TroopType].GetAt(outfitpiece).HasKeyword(ArmorLight) || CustomOutfitsFemale[TroopType].GetAt(outfitpiece).HasKeyword(ArmorClothing) || CustomOutfitsFemale[TroopType].GetAt(outfitpiece).HasKeyword(ArmorJewelry)
										Troop.EquipItem(CustomOutfitsFemale[TroopType].GetAt(outfitpiece), true)
									endif
									outfitpiece += 1
								endwhile
								Troop.RemoveFromFaction(NeedOutfitFaction)
							endif
						endif
					else
						if Troop.IsEquipped(CustomOutfits[TroopType]) != 1 || Troop.IsInFaction(NeedOutfitFaction) == 1
							Troop.RemoveAllItems()
							int outfitpiece = 0
							while outfitpiece < CustomOutfits[TroopType].GetSize()
								debug.notification("Stuck on Line 457")
								debug.trace("Stuck on Line 457")
								Troop.AddItem(CustomOutfits[TroopType].GetAt(outfitpiece), 1)
								if CustomOutfits[TroopType].GetAt(outfitpiece).HasKeyword(ArmorHeavy) || CustomOutfits[TroopType].GetAt(outfitpiece).HasKeyword(ArmorLight) || CustomOutfits[TroopType].GetAt(outfitpiece).HasKeyword(ArmorClothing) || CustomOutfits[TroopType].GetAt(outfitpiece).HasKeyword(ArmorJewelry)
									Troop.EquipItem(CustomOutfits[TroopType].GetAt(outfitpiece), true)
								endif
								outfitpiece += 1
							endwhile
							Troop.RemoveFromFaction(NeedOutfitFaction)
						endif
					endif
				else
					FormList NewOutfit
					if TroopType < 5
						NewOutfit = (Outfits[TroopType].GetAt(OutfitNum[TroopType].GetValue() as int) as FormList)
					elseif TroopType > 5
						NewOutfit = (Outfits[TroopType].GetAt(MageLevels[TroopType].GetValue() as int) as FormList)
					endif
					If Troop.IsEquipped(NewOutfit.GetAt(0) as Armor) != 1 || Troop.IsInFaction(NeedOutfitFaction) == 1
						Troop.RemoveAllItems()
						int outfitpiece = 0
						while outfitpiece < NewOutfit.GetSize()
							debug.notification("Stuck on Line 479")
							debug.trace("Stuck on Line 479")
							Troop.EquipItem(NewOutfit.GetAt(outfitpiece) as Armor, true)
							outfitpiece += 1
						endwhile
						if TroopType < 5
							Troop.AddItem((Swords[TroopType].GetAt(utility.randomint(0, Swords[TroopType].GetSize() - 1)) as FormList).GetAt(OutfitNum[TroopType].GetValue() as int) as Weapon, 1)
							Troop.EquipItem(Shields[TroopType].GetAt(OutfitNum[TroopType].GetValue() as int) as Armor)
							Troop.AddItem(Bows[TroopType].GetAt(OutfitNum[TroopType].GetValue() as int) as Weapon, 1)
							Troop.AddItem(Crossbows[TroopType], 1)
							Troop.AddItem(Ammos[TroopType].GetAt(OutfitNum[TroopType].GetValue() as int) as Ammo, 100)
							Troop.EquipItem(Ammos[TroopType].GetAt(OutfitNum[TroopType].GetValue() as int) as Ammo)
							If TroopType == 3
								Troop.AddItem(CrossbowBolts, 100)
								Troop.EquipItem(CrossbowBolts)
							EndIf
						endif
						Troop.RemoveFromFaction(NeedOutfitFaction)
					EndIf
				endif
		endif
EndFunction

CS_PatrolHoldScript Property CommanderScript Auto
CS_TroopManageMenuScript Property TroopManage Auto
CS_TroopEquipmentUpdaterScript Property EquipmentUpdater Auto

FormList Property AllLocations Auto

ActorBase[] Property BaseTroop Auto

Message Property MenuStart  Auto  
Message Property MenuSoldier Auto

ReferenceAlias Property OutfitChanger Auto

GlobalVariable[] Property OutfitNum Auto

FormList Property AllArmyQuests Auto
FormList Property AllGuardFormLists Auto
FormList[] Property Outfits Auto
FormList[] Property Swords Auto
FormList[] Property Bows Auto
FormList[] Property Shields Auto
FormList[] Property Ammos Auto

Faction Property NeedOutfitFaction Auto

GlobalVariable Property Treasury  Auto  

GlobalVariable Property Metal  Auto  

Sound Property CoinSound  Auto  

Sound Property MetalSound  Auto  

FormList[] Property UpgradePurchased  Auto  

Message Property MenuArcher Auto
Message Property MenuWarrior Auto
Message Property MenuCrossbow Auto
Message Property MenuGuard1  Auto  
Message Property MenuGuard2  Auto  
Message Property MenuGuard3  Auto  
Message Property MenuGuard4  Auto  

Weapon[] Property Crossbows Auto
Ammo Property CrossbowBolts Auto
GlobalVariable[] Property TroopCosts  Auto  

ReferenceAlias Property OutfitChanger2  Auto  
ReferenceAlias Property UpgradeTroop Auto

ReferenceAlias Property ParadeGuard Auto

ObjectReference[] Property CustomOutfitNPC Auto

FormList[] Property CustomOutfits  Auto  
FormList Property CustomOutfitsArmy Auto
FormList Property ArmyGroupFactions Auto

Outfit Property NoneOutfit  Auto  

Message[] Property CustomOutfitMenus  Auto
Message Property CustomMenuStart Auto
Message Property CustomMenuStandard Auto
Message Property CustomMenuMage Auto
Message Property CustomMenuChange Auto

ObjectReference[] Property CustomOutfitNPCMale  Auto  
ObjectReference[] Property CustomOutfitNPCFemale  Auto  

ObjectReference[] Property CustomOutfitNPCMage Auto
ObjectReference[] Property CustomOutfitNPCMageMale Auto
ObjectReference[] Property CustomOutfitNPCMageFemale Auto

FormList[] Property CustomOutfitsMale  Auto  
FormList[] Property CustomOutfitsFemale  Auto 

LeveledItem[] Property OutfitListsMale Auto
LeveledItem[] Property OutfitListsFemale Auto
LeveledItem[] Property ItemListsMale Auto
LeveledItem[] Property ItemListsFemale Auto

GlobalVariable[] Property CustomOutfitsGendered Auto
GlobalVariable Property MagesResearched Auto
GlobalVariable Property DestructionMageLevel Auto

GlobalVariable[] Property MageLevels Auto
GlobalVariable[] Property MageOutfitNums Auto
GlobalVariable[] Property CustomOutfitsGenderedMage Auto

FormList Property MageOutfits Auto

FormList Property CustomMageOutfits Auto
FormList Property CustomMageOutfitsMale Auto
FormList Property CustomMageOutfitsFemale Auto
FormList Property AllUpgradeTroops Auto
FormList Property AllUpgradeMages Auto
FormList Property AllUpgradeDwarves Auto
FormList Property AllUpgradeCreatures Auto
FormList Property DestructionSpellsFire Auto
FormList Property DestructionSpellsFrost Auto
FormList Property DestructionSpellsShock Auto
FormList Property AllowedRaces Auto

Faction Property DestructionMageFire Auto
Faction Property DestructionMageFrost Auto
Faction Property DestructionMageShock Auto
Faction Property PlayerVampireFaction Auto
Faction Property CreatureFaction Auto
Faction Property DwarvenFaction Auto

TextureSet Property RedEyeTexture Auto

Perk Property VampirePerk1 Auto

Keyword Property ArmorHeavy Auto
Keyword Property ArmorLight Auto
Keyword Property ArmorClothing Auto
Keyword Property ArmorJewelry Auto
Keyword Property VendorItemArrow Auto