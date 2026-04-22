Scriptname CS_EquipmentUpdaterThreadAll extends ObjectReference  

LeveledItem Property LeveledTroopArmor Auto
LeveledItem Property LeveledTroopItems Auto
Armor[] Property TroopArmor Auto
Form[] Property TroopItems Auto

Function SetLeveledItems()
    if !LeveledTroopArmor || !LeveledTroopItems
        return
    endif
    LeveledTroopArmor.Revert()
    LeveledTroopItems.Revert()
    
    if TroopArmor
        int i = 0
        while i < TroopArmor.Length
            LeveledTroopArmor.AddForm(TroopArmor[i], 1, 1)
            i += 1
        endwhile
    endif
    
    if TroopItems
        int i = 0
        while i < TroopItems.Length
            if (TroopItems[i] as Ammo)
                LeveledTroopItems.AddForm(TroopItems[i], 1, 200)
            else
                LeveledTroopItems.AddForm(TroopItems[i], 1, 1)
            endif
            i += 1
        endwhile
    endif
EndFunction

Function ClearProperties()
    LeveledTroopArmor = None
    LeveledTroopItems = None
    TroopArmor = new Armor[1]
    TroopItems = new Form[1]
EndFunction

State Assigned

    Event OnUpdate()
        
        GoToState("Updating")
        SetLeveledItems()
        ClearProperties()
        GoToState("Open")
        
    EndEvent
    
EndState