Scriptname CS_CommanderOutfitScript extends Quest  conditional

FormList Property OutfitActors Auto
FormList Property CustomOutfits Auto

Faction Property CommanderOutfitFaction Auto

Message Property CommanderOutfitMenuStart Auto

bool Property FromMenu Auto conditional

CS_TroopManageMenuScript Property ManageArmy Auto

Function CommanderOutfitMenu(Actor Commander, bool menu=false, int armynum = -1, int Response = 0)
	FromMenu = menu
	Response = CommanderOutfitMenuStart.show()
	if Response < 5
		((OutfitActors.GetAt(Response) as ObjectReference) as CS_CustomOutfitArmyAddItem).armynum = Response
		(OutfitActors.GetAt(Response) as Actor).OpenInventory(true)
		if !Commander.IsInFaction(CommanderOutfitFaction)
			Commander.AddToFaction(CommanderOutfitFaction)
		endif
		Commander.SetFactionRank(CommanderOutfitFaction, Response + 1)
	elseif Response == 5
		ManageArmy.EquipmentMenu(armynum)
	endif
EndFunction

Function UpgradeCommander(Actor Commander)
	if Commander.GetFactionRank(CommanderOutfitFaction) > 0
		FormList CustomOutfit = CustomOutfits.GetAt(Commander.GetFactionRank(CommanderOutfitFaction) - 1) as FormList
		if !HasAllItems(Commander, CustomOutfit)
			Commander.UnEquipAll()
			int i = 0
			while i < CustomOutfit.GetSize()
				if Commander.GetItemCount(CustomOutfit.GetAt(i)) == 0
					Commander.AddItem(CustomOutfit.GetAt(i), 1)
				endif
				if CustomOutfit.GetAt(i) as Armor != None
					Commander.EquipItem(CustomOutfit.GetAt(i), true)
				endif
				i += 1
			endwhile
		endif
	endif 
EndFunction

bool Function HasAllItems(Actor Commander, FormList OutfitList)
	int i = 0
	bool hasitems = true
	while i < OutfitList.GetSize() && hasitems == true
		if Commander.GetItemCount(OutfitList.GetAt(i)) == 0
			hasitems = false
		endif
		i += 1
	endwhile

	return hasitems
EndFunction