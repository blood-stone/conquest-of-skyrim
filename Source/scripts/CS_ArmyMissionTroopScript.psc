Scriptname CS_ArmyMissionTroopScript extends ReferenceAlias

ObjectReference Property TroopRegiment Auto
ObjectReference Property PlacementMarker Auto
ObjectReference Property DestinationMarker Auto

ActorBase Property TroopType Auto

string Property OriginalState Auto

int Property TroopNum Auto
int Property EquipmentTier Auto
;/
Function SpawnTroop()
    GoToState("ForceWait")
    ObjectReference FactionOwnerActivator = (TroopRegiment as CS_ArmyRegimentOrders).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    debug.trace("Spawning troop")
    Actor Troop
    if PlacementMarker
        Troop = PlacementMarker.PlaceAtMe(TroopType, abForcePersist=true) as Actor
    elseif (TroopRegiment as CS_ArmyRegimentOrders).Commander.GetRef()
        Troop = (TroopRegiment as CS_ArmyRegimentOrders).Commander.GetRef().PlaceAtMe(TroopType, abForcePersist=true) as Actor
    else
        GoToState("UnSpawned")
        return
    endif
    Actor[] Troops = (TroopRegiment as CS_ArmyRegimentTroops).Troops
    Troops[TroopNum] = Troop
    (TroopRegiment as CS_ArmyRegimentTroops).Troops = Troops
    SetTroopOutfit(Troop)
    AddFactions(Troop)
    
    ForceRefTo(Troop)
    GoToState("Spawned")
EndFunction

Function AddFactions(Actor Troop)
    ObjectReference FactionOwnerActivator = (TroopRegiment as CS_ArmyRegimentOrders).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    
    Troop.AddToFaction(MilitaryScript.ArmyFaction)
    if MilitaryScript.OwnerArmyFaction
        Troop.AddToFaction(MilitaryScript.OwnerArmyFaction)
    endif
    if MilitaryScript.OwnerOwnerArmyFaction
        Troop.AddToFaction(MilitaryScript.OwnerOwnerArmyFaction)
    endif
    
    if MilitaryScript.PlayerFaction == 1
        Troop.AddToFaction(MilitaryScript.CWPlayerAlly)
    endif
    MilitaryScript.ArmyNameChanger.ForceRefTo(Troop)
EndFunction

Function SetTroopOutfit(Actor Troop)
    ObjectReference FactionOwnerActivator = (TroopRegiment as CS_ArmyRegimentOrders).FactionOwnerActivator
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
        
    if TroopOutfit && MilitaryScript.HasCustomOutfits[TroopTypeNum] == 0
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
EndFunction

Function RemoveAllPerks(Actor Troop)
    ObjectReference FactionOwnerActivator = (TroopRegiment as CS_ArmyRegimentOrders).FactionOwnerActivator
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
    ObjectReference FactionOwnerActivator = (TroopRegiment as CS_ArmyRegimentOrders).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    
    if EquipmentTier >= 0
        Troop.AddPerk(MilitaryScript.CS_TroopEquipmentPerks.GetAt(EquipmentTier) as Perk)
    endif
EndFunction

Event OnDying(Actor akKiller)
    if GetActorRef().IsDead()
        GoToState("Dead")
        (TroopRegiment as CS_ArmyRegimentTroops).KillTroop(TroopNum)
        Clear()
    endif
EndEvent

State UpdateOutfit
    
    Event OnUpdate()
        
        SetTroopOutfit(GetActorRef())
        
    EndEvent
    
EndState

State Spawn
    
    Event OnUpdate()
        
        SpawnTroop()
        
    EndEvent
    
EndState

State Dead
    
    Function SpawnTroop()
        ;Do not spawn
        return
    EndFunction
    
    Event OnDying(Actor akKiller)
        ;Avoids double killing
        return
    EndEvent
    
EndState

State MoveToDestination
    
    Event OnUpdate()
        if GetActorRef()
            GetActorRef().MoveTo(DestinationMarker)
        endif
        GoToState(OriginalState)
    EndEvent
    
EndState

State DeleteTroop
    
    Event OnUpdate()
        
        GoToState("Deleting")
        if GetActorRef()
            Actor[] Troops = (TroopRegiment as CS_ArmyRegimentTroops).Troops
            Troops[TroopNum] = None
            (TroopRegiment as CS_ArmyRegimentTroops).Troops = Troops
            GetActorRef().disable()
            GetActorRef().delete()
            Clear()
        endif
        GoToState("Dead")
        
    EndEvent
    
EndState

State ClearTroop
    
    Event OnUpdate()
        
        GoToState("Clearing")
        if TroopType
            TroopType = None
            EquipmentTier = -1
            Clear()
        endif
        GoToState("Cleared")
        
    EndEvent
    
EndState/;
