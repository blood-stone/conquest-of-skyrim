Scriptname CS_CommanderAliasScript extends ReferenceAlias  conditional

bool Property ArmyEquipment Auto

Event OnLoad()
	UpgradeCommander(GetActorRef())
	;(GetOwningQuest() as CS_ArmyTroopDeath).ResetAllTroops()
	(GetOwningQuest() as CS_ArmyTroopDeath).SpawnNewUnSpawnedTroops(GetActorRef())
EndEvent

Function UpgradeCommander(Actor Commander)

	if ArmyEquipment == true
		AddArmyEquipment()
	endif

	CS_CommanderOutfitScript OutfitScript = (GetOwningQuest() as CS_ArmyTroopDeath).ManageArmy.CommanderOutfitScript
	if Commander.GetFactionRank(OutfitScript.CommanderOutfitFaction) > 0
		Commander.UnEquipAll()
		if ArmyEquipment == true
			AddArmyEquipment()
		endif
		FormList CustomOutfit = OutfitScript.CustomOutfits.GetAt(Commander.GetFactionRank(OutfitScript.CommanderOutfitFaction) - 1) as FormList
		if !HasAllItems(Commander, CustomOutfit)
			int i = 0
			while i < CustomOutfit.GetSize()
				if Commander.GetItemCount(CustomOutfit.GetAt(i)) == 0
					Commander.AddItem(CustomOutfit.GetAt(i), 1)
				endif
				if CustomOutfit.GetAt(i) as Armor != None
					Commander.EquipItem(CustomOutfit.GetAt(i) as Armor, true)
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
		if Commander.GetItemCount(OutfitList.GetAt(i)) == 0 || Commander.IsEquipped(OutfitList.GetAt(i)) == 0
			hasitems = false
		endif
		i += 1
	endwhile

	return hasitems
EndFunction

Function AddArmyEquipment()
	CS_UpgradeTroopsMenu CS_UpgradeTroopsReport = (GetOwningQuest() as CS_ArmyTroopDeath).ManageArmy.UpgradeQuest as CS_UpgradeTroopsMenu
	int armynum = GetArmyNum()
	if (CS_UpgradeTroopsReport.CustomOutfitsArmy.GetAt(armynum) as FormList).GetSize() > 0
		FormList ArmyOutfit = CS_UpgradeTroopsReport.CustomOutfitsArmy.GetAt(armynum) as FormList
		if !HasAllItems(self.GetActorRef(), ArmyOutfit)
			int i = 0
			while i < ArmyOutfit.GetSize()
				if self.GetActorRef().GetItemCount(ArmyOutfit.GetAt(i)) == 0 
					self.GetActorRef().AddItem(ArmyOutfit.GetAt(i), 1)
				endif
				if ArmyOutfit.GetAt(i) as Armor != None
					self.GetActorRef().EquipItem(ArmyOutfit.GetAt(i), true)
				endif
				i += 1
			endwhile
		endif
	endif
EndFunction

int Function GetArmyNum()
	return (GetOwningQuest() as CS_ArmyTroopDeath).ManageArmy.CommanderQuest.Commanders.Find(self)
EndFunction