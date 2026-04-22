Scriptname CS_TradeAgreementThreadManager extends ObjectReference  

CS_TradeAgreementExportThread01 Property Thread01 Auto
CS_TradeAgreementExportThread02 Property Thread02 Auto
CS_TradeAgreementExportThread03 Property Thread03 Auto
CS_TradeAgreementExportThread04 Property Thread04 Auto
CS_TradeAgreementExportThread05 Property Thread05 Auto
CS_TradeAgreementExportThread06 Property Thread06 Auto
CS_TradeAgreementExportThread07 Property Thread07 Auto
CS_TradeAgreementExportThread08 Property Thread08 Auto
CS_TradeAgreementExportThread09 Property Thread09 Auto
CS_TradeAgreementExportThread10 Property Thread10 Auto

Function SetUp()
    Thread01 = (self as ObjectReference) as CS_TradeAgreementExportThread01
    Thread02 = (self as ObjectReference) as CS_TradeAgreementExportThread02
    Thread03 = (self as ObjectReference) as CS_TradeAgreementExportThread03
    Thread04 = (self as ObjectReference) as CS_TradeAgreementExportThread04
    Thread05 = (self as ObjectReference) as CS_TradeAgreementExportThread05
    Thread06 = (self as ObjectReference) as CS_TradeAgreementExportThread06
    Thread07 = (self as ObjectReference) as CS_TradeAgreementExportThread07
    Thread08 = (self as ObjectReference) as CS_TradeAgreementExportThread08
    Thread09 = (self as ObjectReference) as CS_TradeAgreementExportThread09
    Thread10 = (self as ObjectReference) as CS_TradeAgreementExportThread10
EndFunction

int Function AssignToThread(Form ExportItem, int ExportAmount, ObjectReference DestinationChest, ObjectReference SupplyChest, int MaxAmount=100)
    GoToState("ThreadBeingAssigned")
    
    int ExportItemNum = (SupplyChest as CS_ReservesScript).ReservesItems.Find(ExportItem)
    int MaxAvailable = 10;(SupplyChest as CS_ReservesScript).TotalOffsets[ExportItemNum]
    int AmountToExport = ExportAmount
    
    if MaxAvailable < 0
        MaxAvailable = 0
        return 0
    elseif MaxAvailable < ExportAmount
        AmountToExport = MaxAvailable
    endif
        
    debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " trying to export " + ExportAmount + " " + ExportItem + " to " + DestinationChest.GetBaseObject().GetName())
    
    if Thread01.ExportItem == ExportItem && Thread01.DestinationChest == DestinationChest
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " more " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread01")
        Thread01.ExportAmount = Thread01.ExportAmount + ExportAmount
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif Thread02.ExportItem == ExportItem && Thread02.DestinationChest == DestinationChest
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " more " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread02")
        Thread02.ExportAmount = Thread02.ExportAmount + ExportAmount
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif Thread03.ExportItem == ExportItem && Thread03.DestinationChest == DestinationChest
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " more " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread03")
        Thread03.ExportAmount = Thread03.ExportAmount + ExportAmount
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif Thread04.ExportItem == ExportItem && Thread04.DestinationChest == DestinationChest
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " more " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread04")
        Thread04.ExportAmount = Thread04.ExportAmount + ExportAmount
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif Thread05.ExportItem == ExportItem && Thread05.DestinationChest == DestinationChest
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " more " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread05")
        Thread05.ExportAmount = Thread05.ExportAmount + ExportAmount
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif Thread06.ExportItem == ExportItem && Thread06.DestinationChest == DestinationChest
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " more " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread06")
        Thread06.ExportAmount = Thread06.ExportAmount + ExportAmount
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif Thread07.ExportItem == ExportItem && Thread07.DestinationChest == DestinationChest
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " more " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread07")
        Thread07.ExportAmount = Thread07.ExportAmount + ExportAmount
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif Thread08.ExportItem == ExportItem && Thread08.DestinationChest == DestinationChest
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " more " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread08")
        Thread08.ExportAmount = Thread08.ExportAmount + ExportAmount
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif Thread09.ExportItem == ExportItem && Thread09.DestinationChest == DestinationChest
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " more " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread09")
        Thread09.ExportAmount = Thread09.ExportAmount + ExportAmount
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif Thread10.ExportItem == ExportItem && Thread10.DestinationChest == DestinationChest
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " more " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread10")
        Thread10.ExportAmount = Thread10.ExportAmount + ExportAmount
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    endif
    
    if !Thread01.ExportItem
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread01")
        Thread01.ExportItem = ExportItem
        Thread01.ExportAmount = ExportAmount
        Thread01.DestinationChest = DestinationChest
        Thread01.SupplyChest = SupplyChest
        Thread01.GoToState("ExportFilled")
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif !Thread02.ExportItem
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread02")
        Thread02.ExportItem = ExportItem
        Thread02.ExportAmount = ExportAmount
        Thread02.DestinationChest = DestinationChest
        Thread02.SupplyChest = SupplyChest
        Thread02.GoToState("ExportFilled")
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif !Thread03.ExportItem
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread03")
        Thread03.ExportItem = ExportItem
        Thread03.ExportAmount = ExportAmount
        Thread03.DestinationChest = DestinationChest
        Thread03.SupplyChest = SupplyChest
        Thread03.GoToState("ExportFilled")
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif !Thread04.ExportItem
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread04")
        Thread04.ExportItem = ExportItem
        Thread04.ExportAmount = ExportAmount
        Thread04.DestinationChest = DestinationChest
        Thread04.SupplyChest = SupplyChest
        Thread04.GoToState("ExportFilled")
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif !Thread05.ExportItem
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread05")
        Thread05.ExportItem = ExportItem
        Thread05.ExportAmount = ExportAmount
        Thread05.DestinationChest = DestinationChest
        Thread05.SupplyChest = SupplyChest
        Thread05.GoToState("ExportFilled")
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif !Thread06.ExportItem
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread06")
        Thread06.ExportItem = ExportItem
        Thread06.ExportAmount = ExportAmount
        Thread06.DestinationChest = DestinationChest
        Thread06.SupplyChest = SupplyChest
        Thread06.GoToState("ExportFilled")
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif !Thread07.ExportItem
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread07")
        Thread07.ExportItem = ExportItem
        Thread07.ExportAmount = ExportAmount
        Thread07.DestinationChest = DestinationChest
        Thread07.SupplyChest = SupplyChest
        Thread07.GoToState("ExportFilled")
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif !Thread08.ExportItem
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread08")
        Thread08.ExportItem = ExportItem
        Thread08.ExportAmount = ExportAmount
        Thread08.DestinationChest = DestinationChest
        Thread08.SupplyChest = SupplyChest
        Thread08.GoToState("ExportFilled")
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif !Thread09.ExportItem
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread09")
        Thread09.ExportItem = ExportItem
        Thread09.ExportAmount = ExportAmount
        Thread09.DestinationChest = DestinationChest
        Thread09.SupplyChest = SupplyChest
        Thread09.GoToState("ExportFilled")
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    elseif !Thread10.ExportItem
        debug.trace((((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator).GetBaseObject().GetName() + " assigning sending " + ExportAmount + " " + ExportItem.GetName() + " to " + DestinationChest.GetBaseObject().GetName() + " to thread10")
        Thread10.ExportItem = ExportItem
        Thread10.ExportAmount = ExportAmount
        Thread10.DestinationChest = DestinationChest
        Thread10.SupplyChest = SupplyChest
        Thread10.GoToState("ExportFilled")
        (DestinationChest as CS_BuildingScriptImportThreadManager).AssignToThread(ExportItem, ExportAmount, ((self as ObjectReference) as CS_TradeAgreementScript).ExportFactionActivator)
        GoToState("Empty")
        return AmountToExport
    endif
    GoToState("Empty")
    
    return 0
EndFunction

Function PrepareExports()
    if Thread01.GetState() == "ExportFilled"
        Thread01.GoToState("PrepareExport")
    endif
    
    if Thread02.GetState() == "ExportFilled"
        Thread02.GoToState("PrepareExport")
    endif
    
    if Thread03.GetState() == "ExportFilled"
        Thread03.GoToState("PrepareExport")
    endif
    
    if Thread04.GetState() == "ExportFilled"
        Thread04.GoToState("PrepareExport")
    endif
    
    if Thread05.GetState() == "ExportFilled"
        Thread05.GoToState("PrepareExport")
    endif
    
    if Thread06.GetState() == "ExportFilled"
        Thread06.GoToState("PrepareExport")
    endif
    
    if Thread07.GetState() == "ExportFilled"
        Thread07.GoToState("PrepareExport")
    endif
    
    if Thread08.GetState() == "ExportFilled"
        Thread08.GoToState("PrepareExport")
    endif
    
    if Thread09.GetState() == "ExportFilled"
        Thread09.GoToState("PrepareExport")
    endif
    
    if Thread10.GetState() == "ExportFilled"
        Thread10.GoToState("PrepareExport")
    endif
    
    RegisterForSingleUpdate(0.1)
EndFunction

Function ExportsArrival()
    if Thread01.GetState() == "InTransit"
        Thread01.GoToState("ExportArrival")
    endif
    
    if Thread02.GetState() == "InTransit"
        Thread02.GoToState("ExportArrival")
    endif
    
    if Thread03.GetState() == "InTransit"
        Thread03.GoToState("ExportArrival")
    endif
    
    if Thread04.GetState() == "InTransit"
        Thread04.GoToState("ExportArrival")
    endif
    
    if Thread05.GetState() == "InTransit"
        Thread05.GoToState("ExportArrival")
    endif
    
    if Thread06.GetState() == "InTransit"
        Thread06.GoToState("ExportArrival")
    endif
    
    if Thread07.GetState() == "InTransit"
        Thread07.GoToState("ExportArrival")
    endif
    
    if Thread08.GetState() == "InTransit"
        Thread08.GoToState("ExportArrival")
    endif
    
    if Thread09.GetState() == "InTransit"
        Thread09.GoToState("ExportArrival")
    endif
    
    if Thread10.GetState() == "InTransit"
        Thread10.GoToState("ExportArrival")
    endif
    
    RegisterForSingleUpdate(0.1)
EndFunction

Function CloseThreads()
    Thread01.GoToState("Empty")
    Thread02.GoToState("Empty")
    Thread03.GoToState("Empty")
    Thread04.GoToState("Empty")
    Thread05.GoToState("Empty")
    Thread06.GoToState("Empty")
    Thread07.GoToState("Empty")
    Thread08.GoToState("Empty")
    Thread09.GoToState("Empty")
    Thread10.GoToState("Empty")
EndFunction

Auto State NotSetUp
    
EndState

State ThreadBeingAssigned
    
    int Function AssignToThread(Form ExportItem, int ExportAmount, ObjectReference DestinationChest, ObjectReference SupplyChest, int MaxAmount=100)
        while GetState() == "ThreadBeingAssigned" || GetState() == "NotSetUp"
            utility.wait(0.1)
        endwhile
        return AssignToThread(ExportItem, ExportAmount, DestinationChest, SupplyChest, MaxAmount)
    EndFunction
    
EndState