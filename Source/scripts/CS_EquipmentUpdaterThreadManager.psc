Scriptname CS_EquipmentUpdaterThreadManager extends ObjectReference  

CS_EquipmentUpdaterThread01 Thread01
CS_EquipmentUpdaterThread02 Thread02
CS_EquipmentUpdaterThread03 Thread03
CS_EquipmentUpdaterThread04 Thread04
CS_EquipmentUpdaterThread05 Thread05
CS_EquipmentUpdaterThread06 Thread06
CS_EquipmentUpdaterThread07 Thread07
CS_EquipmentUpdaterThread08 Thread08
CS_EquipmentUpdaterThread09 Thread09
CS_EquipmentUpdaterThread10 Thread10
CS_EquipmentUpdaterThread11 Thread11
CS_EquipmentUpdaterThread12 Thread12
CS_EquipmentUpdaterThread13 Thread13
CS_EquipmentUpdaterThread14 Thread14
CS_EquipmentUpdaterThread15 Thread15
CS_EquipmentUpdaterThread16 Thread16
CS_EquipmentUpdaterThread17 Thread17
CS_EquipmentUpdaterThread18 Thread18
CS_EquipmentUpdaterThread19 Thread19
CS_EquipmentUpdaterThread20 Thread20

Function SetUpThreads()
    Thread01 = (self as ObjectReference) as CS_EquipmentUpdaterThread01
    Thread01.GoToState("Open")
    
    Thread02 = (self as ObjectReference) as CS_EquipmentUpdaterThread02
    Thread02.GoToState("Open")
    
    Thread03 = (self as ObjectReference) as CS_EquipmentUpdaterThread03
    Thread03.GoToState("Open")
    
    Thread04 = (self as ObjectReference) as CS_EquipmentUpdaterThread04
    Thread04.GoToState("Open")
    
    Thread05 = (self as ObjectReference) as CS_EquipmentUpdaterThread05
    Thread05.GoToState("Open")
    
    Thread06 = (self as ObjectReference) as CS_EquipmentUpdaterThread06
    Thread06.GoToState("Open")
    
    Thread07 = (self as ObjectReference) as CS_EquipmentUpdaterThread07
    Thread07.GoToState("Open")
    
    Thread08 = (self as ObjectReference) as CS_EquipmentUpdaterThread08
    Thread08.GoToState("Open")
    
    Thread09 = (self as ObjectReference) as CS_EquipmentUpdaterThread09
    Thread09.GoToState("Open")
    
    Thread10 = (self as ObjectReference) as CS_EquipmentUpdaterThread10
    Thread10.GoToState("Open")
    
    Thread11 = (self as ObjectReference) as CS_EquipmentUpdaterThread11
    Thread11.GoToState("Open")
    
    Thread12 = (self as ObjectReference) as CS_EquipmentUpdaterThread12
    Thread12.GoToState("Open")
    
    Thread13 = (self as ObjectReference) as CS_EquipmentUpdaterThread13
    Thread13.GoToState("Open")
    
    Thread14 = (self as ObjectReference) as CS_EquipmentUpdaterThread14
    Thread14.GoToState("Open")
    
    Thread15 = (self as ObjectReference) as CS_EquipmentUpdaterThread15
    Thread15.GoToState("Open")
    
    Thread16 = (self as ObjectReference) as CS_EquipmentUpdaterThread16
    Thread16.GoToState("Open")
    
    Thread17 = (self as ObjectReference) as CS_EquipmentUpdaterThread17
    Thread17.GoToState("Open")
    
    Thread18 = (self as ObjectReference) as CS_EquipmentUpdaterThread18
    Thread18.GoToState("Open")
    
    Thread19 = (self as ObjectReference) as CS_EquipmentUpdaterThread19
    Thread19.GoToState("Open")
    
    Thread20 = (self as ObjectReference) as CS_EquipmentUpdaterThread20
    Thread20.GoToState("Open")
    
EndFunction

Function UpdateTroopEquipment(LeveledItem LeveledTroopArmor, LeveledItem LeveledTroopItems, Armor[] TroopArmor, Form[] TroopItems)
    ;/if !LeveledTroopArmor || !LeveledTroopItems || !TroopArmor || !TroopItems
        debug.notification("Update Troop Equipment Failed")
        return
    endif/;
    
    if Thread01.GetState() == "Open"
        Thread01.GoToState("Assigning")
        Thread01.LeveledTroopArmor = LeveledTroopArmor
        Thread01.LeveledTroopItems = LeveledTroopItems
        Thread01.TroopArmor = TroopArmor
        Thread01.TroopItems = TroopItems
        Thread01.GoToState("Assigned")
        Thread01.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread02.GetState() == "Open"
        Thread02.GoToState("Assigning")
        Thread02.LeveledTroopArmor = LeveledTroopArmor
        Thread02.LeveledTroopItems = LeveledTroopItems
        Thread02.TroopArmor = TroopArmor
        Thread02.TroopItems = TroopItems
        Thread02.GoToState("Assigned")
        Thread02.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread03.GetState() == "Open"
        Thread03.GoToState("Assigning")
        Thread03.LeveledTroopArmor = LeveledTroopArmor
        Thread03.LeveledTroopItems = LeveledTroopItems
        Thread03.TroopArmor = TroopArmor
        Thread03.TroopItems = TroopItems
        Thread03.GoToState("Assigned")
        Thread03.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread04.GetState() == "Open"
        Thread04.GoToState("Assigning")
        Thread04.LeveledTroopArmor = LeveledTroopArmor
        Thread04.LeveledTroopItems = LeveledTroopItems
        Thread04.TroopArmor = TroopArmor
        Thread04.TroopItems = TroopItems
        Thread04.GoToState("Assigned")
        Thread04.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread05.GetState() == "Open"
        Thread05.GoToState("Assigning")
        Thread05.LeveledTroopArmor = LeveledTroopArmor
        Thread05.LeveledTroopItems = LeveledTroopItems
        Thread05.TroopArmor = TroopArmor
        Thread05.TroopItems = TroopItems
        Thread05.GoToState("Assigned")
        Thread05.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread06.GetState() == "Open"
        Thread06.GoToState("Assigning")
        Thread06.LeveledTroopArmor = LeveledTroopArmor
        Thread06.LeveledTroopItems = LeveledTroopItems
        Thread06.TroopArmor = TroopArmor
        Thread06.TroopItems = TroopItems
        Thread06.GoToState("Assigned")
        Thread06.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread07.GetState() == "Open"
        Thread07.GoToState("Assigning")
        Thread07.LeveledTroopArmor = LeveledTroopArmor
        Thread07.LeveledTroopItems = LeveledTroopItems
        Thread07.TroopArmor = TroopArmor
        Thread07.TroopItems = TroopItems
        Thread07.GoToState("Assigned")
        Thread07.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread08.GetState() == "Open"
        Thread08.GoToState("Assigning")
        Thread08.LeveledTroopArmor = LeveledTroopArmor
        Thread08.LeveledTroopItems = LeveledTroopItems
        Thread08.TroopArmor = TroopArmor
        Thread08.TroopItems = TroopItems
        Thread08.GoToState("Assigned")
        Thread08.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread09.GetState() == "Open"
        Thread09.GoToState("Assigning")
        Thread09.LeveledTroopArmor = LeveledTroopArmor
        Thread09.LeveledTroopItems = LeveledTroopItems
        Thread09.TroopArmor = TroopArmor
        Thread09.TroopItems = TroopItems
        Thread09.GoToState("Assigned")
        Thread09.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread10.GetState() == "Open"
        Thread10.GoToState("Assigning")
        Thread10.LeveledTroopArmor = LeveledTroopArmor
        Thread10.LeveledTroopItems = LeveledTroopItems
        Thread10.TroopArmor = TroopArmor
        Thread10.TroopItems = TroopItems
        Thread10.GoToState("Assigned")
        Thread10.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread11.GetState() == "Open"
        Thread11.GoToState("Assigning")
        Thread11.LeveledTroopArmor = LeveledTroopArmor
        Thread11.LeveledTroopItems = LeveledTroopItems
        Thread11.TroopArmor = TroopArmor
        Thread11.TroopItems = TroopItems
        Thread11.GoToState("Assigned")
        Thread11.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread12.GetState() == "Open"
        Thread12.GoToState("Assigning")
        Thread12.LeveledTroopArmor = LeveledTroopArmor
        Thread12.LeveledTroopItems = LeveledTroopItems
        Thread12.TroopArmor = TroopArmor
        Thread12.TroopItems = TroopItems
        Thread12.GoToState("Assigned")
        Thread12.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread13.GetState() == "Open"
        Thread13.GoToState("Assigning")
        Thread13.LeveledTroopArmor = LeveledTroopArmor
        Thread13.LeveledTroopItems = LeveledTroopItems
        Thread13.TroopArmor = TroopArmor
        Thread13.TroopItems = TroopItems
        Thread13.GoToState("Assigned")
        Thread13.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread14.GetState() == "Open"
        Thread14.GoToState("Assigning")
        Thread14.LeveledTroopArmor = LeveledTroopArmor
        Thread14.LeveledTroopItems = LeveledTroopItems
        Thread14.TroopArmor = TroopArmor
        Thread14.TroopItems = TroopItems
        Thread14.GoToState("Assigned")
        Thread14.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread15.GetState() == "Open"
        Thread15.GoToState("Assigning")
        Thread15.LeveledTroopArmor = LeveledTroopArmor
        Thread15.LeveledTroopItems = LeveledTroopItems
        Thread15.TroopArmor = TroopArmor
        Thread15.TroopItems = TroopItems
        Thread15.GoToState("Assigned")
        Thread15.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread16.GetState() == "Open"
        Thread16.GoToState("Assigning")
        Thread16.LeveledTroopArmor = LeveledTroopArmor
        Thread16.LeveledTroopItems = LeveledTroopItems
        Thread16.TroopArmor = TroopArmor
        Thread16.TroopItems = TroopItems
        Thread16.GoToState("Assigned")
        Thread16.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread17.GetState() == "Open"
        Thread17.GoToState("Assigning")
        Thread17.LeveledTroopArmor = LeveledTroopArmor
        Thread17.LeveledTroopItems = LeveledTroopItems
        Thread17.TroopArmor = TroopArmor
        Thread17.TroopItems = TroopItems
        Thread17.GoToState("Assigned")
        Thread17.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread18.GetState() == "Open"
        Thread18.GoToState("Assigning")
        Thread18.LeveledTroopArmor = LeveledTroopArmor
        Thread18.LeveledTroopItems = LeveledTroopItems
        Thread18.TroopArmor = TroopArmor
        Thread18.TroopItems = TroopItems
        Thread18.GoToState("Assigned")
        Thread18.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread19.GetState() == "Open"
        Thread19.GoToState("Assigning")
        Thread19.LeveledTroopArmor = LeveledTroopArmor
        Thread19.LeveledTroopItems = LeveledTroopItems
        Thread19.TroopArmor = TroopArmor
        Thread19.TroopItems = TroopItems
        Thread19.GoToState("Assigned")
        Thread19.RegisterForSingleUpdate(0.1)
        return
    endif
    
    if Thread20.GetState() == "Open"
        Thread20.GoToState("Assigning")
        Thread20.LeveledTroopArmor = LeveledTroopArmor
        Thread20.LeveledTroopItems = LeveledTroopItems
        Thread20.TroopArmor = TroopArmor
        Thread20.TroopItems = TroopItems
        Thread20.GoToState("Assigned")
        Thread20.RegisterForSingleUpdate(0.1)
        return
    endif
EndFunction