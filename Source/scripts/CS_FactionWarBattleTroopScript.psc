Scriptname CS_FactionWarBattleTroopScript extends ReferenceAlias  

ObjectReference Property TroopRegiment Auto
ObjectReference Property SpawnPoint Auto

int Property EquipmentTier Auto

ActorBase Property TroopType Auto

Function SpawnTroop()
    Actor Troop = SpawnPoint.PlaceAtMe(TroopType) as Actor
    ForceRefTo(Troop)
    ;SetTroopOutfit()
EndFunction

Function SetTroopOutfit()
    Actor Troop = GetActorRef()
    ObjectReference FactionOwnerActivator = (TroopRegiment as CS_FactionWarAIRegimentScript).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    ;MilitaryScript.ArmyNameChanger.ForceRefTo(Troop)
    int TroopTypeNum = MilitaryScript.TroopTypes.Find(TroopType)
    Outfit TroopOutfit
    LeveledItem TroopItems
    if MilitaryScript.HasCustomOutfits[TroopTypeNum] == 0
        debug.trace("Troop does not have custom outfit")
        if EquipmentTier >= 0
            if TroopTypeNum == 0 || TroopTypeNum == 1
                TroopOutfit = MilitaryScript.CS_TroopEquipmentOutfitsBaseHeavy.GetAt(EquipmentTier) as Outfit
                if TroopTypeNum == 0
                    TroopItems = MilitaryScript.CS_TroopEquipmentItemsSoldier.GetAt(EquipmentTier) as LeveledItem
                elseif TroopTypeNum == 1
                    TroopItems = MilitaryScript.CS_TroopEquipmentItemsWarrior.GetAt(EquipmentTier) as LeveledItem
                endif
            elseif TroopTypeNum == 2 || TroopTypeNum == 3
                TroopOutfit = MilitaryScript.CS_TroopEquipmentOutfitsBaseLight.GetAt(EquipmentTier) as Outfit
                if TroopTypeNum == 2
                    TroopItems = MilitaryScript.CS_TroopEquipmentItemsArcher.GetAt(EquipmentTier) as LeveledItem
                elseif TroopTypeNum == 3
                    TroopItems = MilitaryScript.CS_TroopEquipmentItemsCrossbow.GetAt(EquipmentTier) as LeveledItem
                endif
            endif
        else
            if TroopTypeNum == 0 || TroopTypeNum == 1
                TroopOutfit = MilitaryScript.CS_TroopEquipmentOutfitHeavyTier01
            elseif TroopTypeNum == 2 || TroopTypeNum == 3
                TroopOutfit = MilitaryScript.CS_TroopEquipmentOutfitLightTier01
            endif
            
            TroopItems = MilitaryScript.CS_TroopEquipmentInitialWeapons.GetAt(TroopTypeNum) as LeveledItem
            ;Troop.Reset(Troop)
        endif
    else
        debug.trace("Troop has custom outfit")
        if Troop.GetLeveledActorBase().GetSex() == 0
            TroopOutfit = MilitaryScript.CustomOutfitsMale.GetAt(TroopTypeNum) as Outfit
            TroopItems = MilitaryScript.LeveledItemsMale.GetAt(TroopTypeNum) as LeveledItem
        else
            TroopOutfit = MilitaryScript.CustomOutfitsFemale.GetAt(TroopTypeNum) as Outfit
            TroopItems = MilitaryScript.LeveledItemsFemale.GetAt(TroopTypeNum) as LeveledItem
        endif
    endif
        
    if TroopOutfit
        Troop.SetOutfit(TroopOutfit)
    endif
    
    if TroopItems
        Troop.AddItem(TroopItems)
    endif
    
    RemoveAllPerks(Troop)
    AddPerks(Troop)
    AddCustomEquipment(Troop)
EndFunction

Function AddCustomEquipment(Actor Troop)
    CS_ArmyRegimentEquipment RegimentScript = TroopRegiment as CS_ArmyRegimentEquipment
    if RegimentScript
        if RegimentScript.CustomEquipment
            int i = 0
            while i < RegimentScript.CustomEquipment.Length
                Troop.EquipItem(RegimentScript.CustomEquipment[i])
                i += 1
            endwhile
        endif
        
        if RegimentScript.CustomItems
            int i = 0
            while i < RegimentScript.CustomItems.Length
                Troop.AddItem(RegimentScript.CustomItems[i], RegimentScript.CustomItemsAmount[i])
                i += 1
            endwhile
        endif
    endif
EndFunction

Function RemoveAllPerks(Actor Troop)
    ObjectReference FactionOwnerActivator = (TroopRegiment as CS_FactionWarAIRegimentScript).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    int i = 0
    while i < MilitaryScript.CS_TroopEquipmentPerks.GetSize()
        Perk EquipmentPerk = MilitaryScript.CS_TroopEquipmentPerks.GetAt(i) as Perk
        if Troop.HasPerk(EquipmentPerk)
            Troop.RemovePerk(EquipmentPerk)
        endif
        i += 1
    endwhile
EndFunction

Function AddPerks(Actor Troop)
    ObjectReference FactionOwnerActivator = (TroopRegiment as CS_FactionWarAIRegimentScript).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    
    if EquipmentTier >= 0
        Troop.AddPerk(MilitaryScript.CS_TroopEquipmentPerks.GetAt(EquipmentTier) as Perk)
    endif
EndFunction

State SpawnTroop
    
    Event OnUpdate()
        GoToState("Spawning")
        SpawnTroop()
        GoToState("Spawned")
    EndEvent
    
EndState

State DeleteTroop
    
    Event OnUpdate()
        
        GoToState("Deleting")
        GetActorRef().disable()
        GetActorRef().delete()
        GoToState("Empty")
        
    EndEvent
    
EndState