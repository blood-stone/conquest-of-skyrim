Scriptname CS_UpgradeGuardOnAttach extends Actor 

CS_UpgradeTroopsMenu Property CS_UpgradeTroopsReport Auto

Event OnInIt()
	UpgradeTroop(self)
EndEvent

Event OnCellAttach()
	UpgradeTroop(self)
EndEvent

Event OnAttachedToCell()
	UpgradeTroop(self)
EndEvent

Function UpgradeTroop(Actor Troop)
	debug.trace("Upgrading Guard...")

	Troop.reset(Troop)

	CS_UpgradeTroopsReport.OutfitChanger.ForceRefTo(Troop)
	CS_UpgradeTroopsReport.OutfitChanger.Clear()

	debug.trace("Guard upgraded.")
EndFunction

Function OldUpgradeTroop(Actor Troop)
	if CS_UpgradeTroopsReport.AllowedRaces.HasForm(Troop.GetRace()) != 1
		Troop.reset()
	endif
	int TroopType = 4
		CS_UpgradeTroopsReport.OutfitChanger.ForceRefTo(Troop)
		CS_UpgradeTroopsReport.OutfitChanger.Clear()
				if CS_UpgradeTroopsReport.OutfitNum[TroopType].GetValue() == -1
					if CS_UpgradeTroopsReport.CustomOutfitsGendered[TroopType].GetValue() == 1
						if Troop.GetLeveledActorBase().GetSex() == 0
							if !HasAllItems(CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType])
								debug.trace("Upgrading guard...")
								Troop.RemoveAllItems()
								int outfitpiece = 0
								while outfitpiece < CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetSize()
									if Troop.GetItemCount(CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetAt(outfitpiece)) == 0
										Troop.AddItem(CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetAt(outfitpiece), 1)
									endif
									if CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetAt(outfitpiece) as Armor != None
										Troop.EquipItem(CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetAt(outfitpiece), true)
									endif
									outfitpiece += 1
								endwhile
							endif
						elseif Troop.GetLeveledActorBase().GetSex() == 1
							if !HasAllItems(CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType])
								debug.trace("Upgrading guard...")
								Troop.RemoveAllItems()
								int outfitpiece = 0
								while outfitpiece < CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetSize()
									if Troop.GetItemCount(CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetAt(outfitpiece)) == 0
										Troop.AddItem(CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetAt(outfitpiece), 1)
									endif
									if CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetAt(outfitpiece) as Armor != None
										Troop.EquipItem(CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetAt(outfitpiece), true)
									endif
									outfitpiece += 1
								endwhile
							endif
						endif
					else
						if !HasAllItems(CS_UpgradeTroopsReport.CustomOutfits[TroopType])
							debug.trace("Upgrading guard...")
							Troop.RemoveAllItems()
							int outfitpiece = 0
							while outfitpiece < CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetSize()
								if Troop.GetItemCount(CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetAt(outfitpiece)) == 0
									Troop.AddItem(CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetAt(outfitpiece), 1)
								endif
								if CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetAt(outfitpiece) as Armor != None
									Troop.EquipItem(CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetAt(outfitpiece), true)
								endif
								outfitpiece += 1
							endwhile
						endif
					endif
				else
					FormList NewOutfit
					NewOutfit = (CS_UpgradeTroopsReport.Outfits[4].GetAt(CS_UpgradeTroopsReport.OutfitNum[4].GetValue() as int) as FormList)
					If !HasAllItems(NewOutfit)
						debug.trace("Upgrading guard...")
						Troop.RemoveAllItems()
						int outfitpiece = 0
						while outfitpiece < NewOutfit.GetSize()
							Troop.EquipItem(NewOutfit.GetAt(outfitpiece) as Armor, true)
							outfitpiece += 1
						endwhile
						Troop.AddItem((CS_UpgradeTroopsReport.Swords[4].GetAt(utility.randomint(0, CS_UpgradeTroopsReport.Swords[4].GetSize() - 1)) as FormList).GetAt(CS_UpgradeTroopsReport.OutfitNum[4].GetValue() as int) as Weapon, 1)
						Troop.EquipItem(CS_UpgradeTroopsReport.Shields[4].GetAt(CS_UpgradeTroopsReport.OutfitNum[4].GetValue() as int) as Armor)
						Troop.AddItem(CS_UpgradeTroopsReport.Bows[4].GetAt(CS_UpgradeTroopsReport.OutfitNum[4].GetValue() as int) as Weapon, 1)
						Troop.AddItem(CS_UpgradeTroopsReport.Ammos[4].GetAt(CS_UpgradeTroopsReport.OutfitNum[4].GetValue() as int) as Ammo, 100)
						Troop.EquipItem(CS_UpgradeTroopsReport.Ammos[4].GetAt(CS_UpgradeTroopsReport.OutfitNum[4].GetValue() as int) as Ammo)
					EndIf
				endif
		debug.trace("Guard upgraded.")
EndFunction

bool Function HasAllItems(FormList OutfitList)

	bool hasitems = true

	if OutfitList.GetSize() == 0

		hasitems = false

	else

		int i = 0

		while i < OutfitList.GetSize() && hasitems == true
			if GetItemCount(OutfitList.GetAt(i)) == 0 || IsEquipped(OutfitList.GetAt(i)) == 0
				hasitems = false
			endif
			i += 1
		endwhile

	endif

	return hasitems
EndFunction