Scriptname CS_ArmyRegimentCommanderScript extends ReferenceAlias  

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
    if MilitaryScript.HasCustomCommanderOutfits[0] == 1
        debug.trace("Commander has custom outfit")
        if Troop.GetActorBase().GetSex() == 0
            TroopOutfit = MilitaryScript.CustomOutfitsCommanderMale.GetAt(0) as Outfit
            TroopItems = MilitaryScript.LeveledItemsCommanderMale.GetAt(0) as LeveledItem
        else
            TroopOutfit = MilitaryScript.CustomOutfitsCommanderFemale.GetAt(0) as Outfit
            TroopItems = MilitaryScript.LeveledItemsCommanderFemale.GetAt(0) as LeveledItem
        endif
    endif
        
    if TroopOutfit
        Troop.SetOutfit(TroopOutfit)
    endif
    
    if TroopItems
        Troop.AddItem(TroopItems)
    endif
    
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

Auto State Unassigned

EndState

State Assigned
    
    Event OnLoad()
        
        GoToState("ForceWait")
        
        SetTroopOutfit(GetActorRef())
        
        GoToState("Assigned")
        
    EndEvent
    
EndState



State ForceWait
    
EndState