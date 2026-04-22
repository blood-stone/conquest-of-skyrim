Scriptname CS_CityManagementGuardScript extends ReferenceAlias  

ActorBase Property TroopType Auto
ObjectReference Property SpawnMarker Auto

int Property EquipmentTier Auto hidden

string Property InitialState Auto hidden

ObjectReference Property TempPlacementMarker Auto

Function SpawnTroop()
    GoToState("ForceWait")
    ObjectReference CityManagementActivator = (GetOwningQuest() as CS_CityManagementScript).CityManagementActivator
    ObjectReference FactionOwnerActivator = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    
    TroopType = MilitaryScript.GuardTroopType
    debug.trace("Spawning troop")
    Actor Troop
    if TempPlacementMarker
        Troop = TempPlacementMarker.PlaceAtMe(TroopType, abForcePersist=true) as Actor
        TempPlacementMarker = None
        SetTroopOutfit(Troop)
        AddFactions(Troop)
    
        ForceRefTo(Troop)
    endif
    GoToState("Temporary")
EndFunction

Function AddFactions(Actor Troop)
    ObjectReference CityManagementActivator = (GetOwningQuest() as CS_CityManagementScript).CityManagementActivator
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
    ObjectReference CityManagementActivator = (GetOwningQuest() as CS_CityManagementScript).CityManagementActivator
    ObjectReference FactionOwnerActivator = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    ;MilitaryScript.ArmyNameChanger.ForceRefTo(Troop)
    Outfit TroopOutfit
    LeveledItem TroopItems
    if MilitaryScript.HasCustomGuardOutfit == 0
        debug.trace("Guard does not have custom outfit")
        if EquipmentTier >= 0
            TroopOutfit = MilitaryScript.CS_TroopEquipmentOutfitsBaseHeavy.GetAt(EquipmentTier) as Outfit
            TroopItems = MilitaryScript.CS_TroopEquipmentItemsSoldier.GetAt(EquipmentTier) as LeveledItem
        else
            Troop.Reset(Troop)
        endif
    else
        debug.trace("Guard has custom outfit")
        if Troop.GetLeveledActorBase().GetSex() == 0
            TroopOutfit = MilitaryScript.CustomOutfitsGuardMale
            TroopItems = MilitaryScript.LeveledItemsGuardMale
        else
            TroopOutfit = MilitaryScript.CustomOutfitsGuardFemale
            TroopItems = MilitaryScript.LeveledItemsGuardFemale
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
EndFunction

Function RemoveAllPerks(Actor Troop)
    ObjectReference CityManagementActivator = (GetOwningQuest() as CS_CityManagementScript).CityManagementActivator
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
    ObjectReference CityManagementActivator = (GetOwningQuest() as CS_CityManagementScript).CityManagementActivator
    ObjectReference FactionOwnerActivator = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
    CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
    
    if EquipmentTier >= 0
        Troop.AddPerk(MilitaryScript.CS_TroopEquipmentPerks.GetAt(EquipmentTier) as Perk)
    endif
EndFunction

Event OnDying(Actor akKiller)
    Clear()
    GoToState("Dead")
    ;(GetOwningQuest() as CS_CityManagementScript).AddToDeadCount()
EndEvent

State UnSpawned

    Event OnUpdate()
        SpawnTroop()
    EndEvent

EndState

State InitiateDelete
    
    Event OnUpdate()
        
        GoToState("ForceWait")
        debug.trace("Deleting troop")
        GetActorRef().disable()
        GetActorRef().delete()
        Clear()
        GoToState("Open")
        
    EndEvent
    
EndState

State UpdateOutfit
    
    Event OnUpdate()
        Actor Troop = GetActorRef()
        Troop.Reset(Troop)
        SetTroopOutfit(Troop)
        GoToState(InitialState)
    EndEvent
    
EndState

State Temporary
    
    Event OnLoad()
        
        SetTroopOutfit(GetActorRef())
        
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

Auto State Unassigned

EndState

State Assigned
    
    Event OnUpdate()
        
        SpawnTroop()
        
    EndEvent
    
EndState
        