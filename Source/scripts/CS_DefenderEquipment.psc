Scriptname CS_DefenderEquipment extends ReferenceAlias  

Event OnCellLoad()
	int index = 0
	While index < DefenderRefs.Length
		DefenderRefs[index].GetActorRef().SetOutfit(OutfitsGuard.GetAt(OutfitNum.GetValue() as int) as Outfit)
		DefenderRefs[index].GetActorRef().RemoveItem(DefenderRefs[index].GetActorRef().GetEquippedWeapon())
		DefenderRefs[index].GetActorRef().RemoveItem(DefenderRefs[index].GetActorRef().GetEquippedShield())
		DefenderRefs[index].GetActorRef().EquipItem(BowsGuard.GetAt(OutfitNum.GetValue() as int) as Weapon)
		DefenderRefs[index].GetActorRef().AddItem(AmmoGuard.GetAt(OutfitNum.GetValue() as int) as Ammo, 100)
		DefenderRefs[index].GetActorRef().EquipItem(AmmoGuard.GetAt(OutfitNum.GetValue() as int) as Ammo)
		DefenderRefs[index].GetActorRef().EquipItem(SwordsGuard.GetAt(OutfitNum.GetValue() as int) as Weapon)
		DefenderRefs[index].GetActorRef().EquipItem(ShieldsGuard.GetAt(OutfitNum.GetValue() as int) as Armor)
		index += 1
	EndWhile
endEvent

ReferenceAlias[] Property DefenderRefs Auto

FormList Property OutfitsGuard Auto

FormList Property BowsGuard Auto

FormList Property AmmoGuard Auto

FormList Property SwordsGuard Auto

FormList Property ShieldsGuard Auto

GlobalVariable Property OutfitNum Auto
