Scriptname CS_ArmyRegimentTroopScript extends ReferenceAlias  

ActorBase Property TroopType Auto hidden
int Property TroopTypeNum Auto hidden

int Property EquipmentTier Auto hidden

string Property InitialState Auto hidden

ReferenceAlias Property MissionAlias Auto hidden

ObjectReference Property TempPlacementMarker Auto hidden

Function SpawnTroop()
    GoToState("ForceWait")
    debug.trace("Spawning troop")
    Actor Troop
    if TempPlacementMarker
        Troop = TempPlacementMarker.PlaceAtMe(TroopType, abForcePersist=true) as Actor
        ObjectReference RefToDelete = TempPlacementMarker
        TempPlacementMarker = None
        RefToDelete.delete()
    elseif (GetOwningQuest() as CS_RegimentScript).ArmyMission && (GetOwningQuest() as CS_RegimentScript).Commander.GetRef()
        Troop = (GetOwningQuest() as CS_RegimentScript).Commander.GetRef().PlaceAtMe(TroopType, abForcePersist=true) as Actor
    elseif (GetOwningQuest() as CS_RegimentScript).ExteriorMarker.GetRef().Is3DLoaded()
        Troop = (GetOwningQuest() as CS_RegimentScript).ExteriorMarker.GetRef().PlaceAtMe(TroopType, abForcePersist=true) as Actor
    else
        GoToState("UnSpawned")
        return
    endif
    SetTroopOutfit(Troop)
    AddFactions(Troop)
    
    ForceRefTo(Troop)
    if MissionAlias
        MissionAlias.ForceRefTo(Troop)
    endif
    GoToState("Spawned")
EndFunction

Function AddToAlias()
    GoToState("AddingToAlias")
    if MissionAlias
        MissionAlias.ForceRefTo(GetActorRef())
    endif
    GoToState("Spawned")
EndFunction

Function AddFactions(Actor Troop)
    ObjectReference CityManagementActivator = (GetOwningQuest() as CS_RegimentScript).CityManagementActivator.GetRef()
    ObjectReference FactionOwnerActivator = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
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
EndFunction

Function SetTroopOutfit(Actor Troop)
    ObjectReference CityManagementActivator = (GetOwningQuest() as CS_RegimentScript).CityManagementActivator.GetRef()
    ObjectReference FactionOwnerActivator = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    ;MilitaryScript.ArmyNameChanger.ForceRefTo(Troop)
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
            Troop.Reset(Troop)
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
    CS_RegimentScript RegimentScript = GetOwningQuest() as CS_RegimentScript
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
    ObjectReference CityManagementActivator = (GetOwningQuest() as CS_RegimentScript).CityManagementActivator.GetRef()
    ObjectReference FactionOwnerActivator = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
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
    ObjectReference CityManagementActivator = (GetOwningQuest() as CS_RegimentScript).CityManagementActivator.GetRef()
    ObjectReference FactionOwnerActivator = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    
    if EquipmentTier >= 0
        Troop.AddPerk(MilitaryScript.CS_TroopEquipmentPerks.GetAt(EquipmentTier) as Perk)
    endif
EndFunction

Event OnDying(Actor akKiller)
    Clear()
    GoToState("Unfilled")
    (GetOwningQuest() as CS_RegimentScript).AddToDeadCount()
EndEvent

State UnSpawned

    Event OnUpdate()
        SpawnTroop()
    EndEvent

EndState

State UpdateOutfit
    
    Event OnUpdate()
        Actor Troop = GetActorRef()
        if !UsesCustomOutfit(Troop)
            Troop.Reset(Troop)
        endif
        SetTroopOutfit(Troop)
        GoToState(InitialState)
    EndEvent
    
EndState

State UnSpawnTroop
    
    Event OnUpdate()
        
        GoToState("ForceWait")
        debug.trace("Deleting troop")
        GetActorRef().disable()
        GetActorRef().delete()
        Clear()
        GoToState("UnSpawned")
        
    EndEvent
    
EndState

State Spawned
    
    Event OnUpdate()
        
        AddToAlias()
        
    EndEvent
    
EndState

State Temporary
    
    ;/Event OnUnload()
        
        GoToState("ForceWait")
        debug.trace("Deleting troop")
        GetActorRef().disable()
        GetActorRef().delete()
        Clear()
        GoToState("UnSpawned")
        
    EndEvent;/
    
    Event OnDetachedFromCell()
        
        GetActorRef().disable()
        GetActorRef().delete()
        Clear()
        GoToState("UnSpawned")
        
    EndEvent/;
    
EndState

State ForceWait
    
EndState

State Unfilled
    
    Event OnUpdate()
        
        if GetActorRef() && !GetActorRef().IsDead()
            debug.trace("Deleting troop")
            GetActorRef().disable()
            GetActorRef().delete()
            Clear()
        endif
        
    EndEvent
    
EndState

Auto State Unassigned

EndState

State Persistent
    
EndState

bool Function UsesCustomOutfit(Actor Troop)
    ObjectReference CityManagementActivator = (GetOwningQuest() as CS_RegimentScript).CityManagementActivator.GetRef()
    ObjectReference FactionOwnerActivator = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    return MilitaryScript.HasCustomOutfits[TroopTypeNum] == 1
EndFunction
