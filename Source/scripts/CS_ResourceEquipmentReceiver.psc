Scriptname CS_ResourceEquipmentReceiver extends Actor  

ObjectReference Property TroopRegiment Auto hidden

FormList Property CS_CraftingResourcesOutputsEquipmentTroop Auto
FormList Property EquipmentList Auto
FormList Property ItemsList Auto

Actor[] Property RegimentActors Auto hidden; the array for the troop's regiment actors, used for getting index for equipment tier
int[] Property RegimentEquipmentArray Auto hidden ; the array that contains the equipment tiers for this troops' regiment
CS_CityManagementPopulation Property GuardPopulation Auto hidden; the script that has the array for the guard actors, used for getting index for equipment tier
CS_StorageEquipmentGuardsScript Property GuardEquipmentScript Auto hidden ;the script that has an array that contains the equipment tiers for the guards

int Property EquipmentTier Auto hidden
int Property TroopTypeNum Auto ;-1 = is Guard

CS_FactionManagementMilitary Property MilitaryScript Auto

Function UpdateTroop(CS_ArmyUnitAliasScript UnitScript)
    if CheckDemographics()
        SetTroopOutfit(UnitScript)
        SetPerks()
        AddCustomEquipment(UnitScript)
    else
        reset(self as ObjectReference)
    endif
EndFunction

Function SetTroopOutfit(CS_ArmyUnitAliasScript UnitScript)
    Outfit TroopOutfit
    LeveledItem TroopItems
    EquipmentTier = UnitScript.EquipmentTier
    if MilitaryScript.HasCustomOutfits[TroopTypeNum] == 0
        debug.trace("Troop does not have custom outfit")
        TroopOutfit = EquipmentList.GetAt(EquipmentTier) as Outfit
        TroopItems = ItemsList.GetAt(EquipmentTier) as LeveledItem
    else
        debug.trace("Troop has custom outfit")
        if GetLeveledActorBase().GetSex() == 0
            TroopOutfit = MilitaryScript.CustomOutfitsMale.GetAt(TroopTypeNum) as Outfit
            TroopItems = MilitaryScript.LeveledItemsMale.GetAt(TroopTypeNum) as LeveledItem
        else
            TroopOutfit = MilitaryScript.CustomOutfitsFemale.GetAt(TroopTypeNum) as Outfit
            TroopItems = MilitaryScript.LeveledItemsFemale.GetAt(TroopTypeNum) as LeveledItem
        endif
    endif
    
    RemoveAllItems()
    if TroopOutfit
        SetOutfit(TroopOutfit)
    endif
    
    if TroopItems
        AddItem(TroopItems)
    endif
    
    RemoveAllPerks()
    ;AddPerks()
    AddCustomEquipment(UnitScript)
EndFunction

Function SetGuardOutfit()
    int TroopIndex = GuardPopulation.GuardActors.Find(self as Actor)
    EquipmentTier = GuardEquipmentScript.GuardEquipmentTier
    debug.trace("Troop " + TroopIndex + " EquipmentTier Found to be " + EquipmentTier)
    Outfit TroopOutfit
    LeveledItem TroopItems
    if MilitaryScript.HasCustomGuardOutfit == 0
        debug.trace("Guard does not have custom outfit")
        TroopOutfit = EquipmentList.GetAt(EquipmentTier) as Outfit
        TroopItems = ItemsList.GetAt(EquipmentTier) as LeveledItem
    else
        debug.trace("Troop has custom outfit")
        if GetLeveledActorBase().GetSex() == 0
            TroopOutfit = MilitaryScript.CustomOutfitsGuardMale
            TroopItems = MilitaryScript.LeveledItemsGuardMale
        else
            TroopOutfit = MilitaryScript.CustomOutfitsGuardFemale
            TroopItems = MilitaryScript.LeveledItemsGuardFemale
        endif
    endif
    RemoveAllItems()
    if TroopOutfit
        SetOutfit(TroopOutfit)
    endif
    
    if TroopItems
        AddItem(TroopItems)
    endif
    
    RemoveAllPerks()
    ;AddPerks()
    ;AddCustomEquipment()
EndFunction

Function SetPerks()
    RemoveAllPerks()
    ;AddPerks()
EndFunction

Function AddCustomEquipment(CS_ArmyUnitAliasScript UnitScript)
    if UnitScript.CustomEquipment
        int i = 0
        while i < UnitScript.CustomEquipment.Length
            EquipItem(UnitScript.CustomEquipment[i])
            i += 1
        endwhile
    endif
    
    if UnitScript.CustomItems
        int i = 0
        while i < UnitScript.CustomItems.Length
            AddItem(UnitScript.CustomItems[i], UnitScript.CustomItemsAmount[i])
            i += 1
        endwhile
    endif
EndFunction

Function RemoveAllPerks()
    int i = 0
    while i < MilitaryScript.CS_TroopEquipmentPerks.GetSize()
        Perk EquipmentPerk = MilitaryScript.CS_TroopEquipmentPerks.GetAt(i) as Perk
        if HasPerk(EquipmentPerk)
            RemovePerk(EquipmentPerk)
        endif
        i += 1
    endwhile
EndFunction

Function AddPerks()
    AddPerk(MilitaryScript.CS_TroopEquipmentPerks.GetAt(EquipmentTier) as Perk)
EndFunction
;/
Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    debug.trace("Received " + akBaseItem.GetName())
    EquipmentTier = CS_CraftingResourcesOutputsEquipmentTroop.Find(akBaseItem) + 1
    if TroopTypeNum == -1
        SetGuardOutfit()
    else
        SetTroopOutfit()
    endif
EndEvent/;

bool Function CheckDemographics()
    debug.trace("Checking demographics...")
    ObjectReference FactionOwner = MilitaryScript as ObjectReference
    CS_FactionManagementEconomy EconomyScript = FactionOwner as CS_FactionManagementEconomy
    if TroopTypeNum >= 0
        FormList RaceList = EconomyScript.CS_RaceListTroops
        if !RaceList.HasForm(GetRace())
            return false
        elseif GetLeveledActorBase().GetSex() == 0 && !EconomyScript.MalesAllowed
            return false
        elseif GetLeveledActorBase().GetSex() == 1 && !EconomyScript.FemalesAllowed
            return false
        endif
    elseif TroopTypeNum == -1
        FormList RaceList = EconomyScript.CS_RaceListSettlers
        if !RaceList.HasForm(GetRace())
            return false
        elseif GetLeveledActorBase().GetSex() == 0 && !EconomyScript.MalesAllowedSettlers
            return false
        elseif GetLeveledActorBase().GetSex() == 1 && !EconomyScript.FemalesAllowedSettlers
            return false
        endif
    endif
    
    debug.trace("Demographics good!")
    return true
EndFunction

Event OnCellAttach()
    if !CheckDemographics()
        debug.trace("Demographics NOT good... resetting!")
        reset(self as ObjectReference)
    endif
EndEvent

State EquipTroop

    Event OnUpdate()
        GoToState("EquippingTroop")
        if TroopTypeNum == -1
            SetGuardOutfit()
        endif
        GoToState("Ready")
    EndEvent
    
EndState
    