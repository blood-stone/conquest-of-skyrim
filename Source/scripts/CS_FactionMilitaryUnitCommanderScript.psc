Scriptname CS_FactionMilitaryUnitCommanderScript extends ReferenceAlias

bool Property CustomOutfit Auto hidden

CS_FactionMilitaryUnitControl Property CS_FactionMilitaryUnitCommanders Auto

Event OnActivate(ObjectReference akActivator)
    
    CS_FactionMilitaryUnitCommanders.SetUnit(self)
    
EndEvent

Event OnCellAttach()
    
    (GetOwningQuest() as CS_ArmyUnitAliasScript).UpdateTroops()
    
    if CustomOutfit
        int unitnum = CS_FactionMilitaryUnitCommanders.Commanders.Find(self)
        Outfit CommanderOutfit = CS_FactionMilitaryUnitCommanders.CommanderOutfits.GetAt(unitnum) as Outfit
        GetActorRef().SetOutfit(CommanderOutfit)
    endif
    
EndEvent