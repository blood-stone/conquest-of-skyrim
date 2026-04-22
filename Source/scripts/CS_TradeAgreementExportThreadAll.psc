Scriptname CS_TradeAgreementExportThreadAll extends ObjectReference  

ObjectReference Property SupplyChest Auto
ObjectReference Property DestinationChest Auto

Form Property ExportItem Auto
int Property ExportAmount Auto

State PrepareExport

    Event OnUpdate()
        if ExportItem && ExportAmount > 0
            debug.trace((self as ObjectReference).GetBaseObject().GetName() + " preparing " + ExportAmount + " " + ExportItem.GetName() + " for export to " + DestinationChest.GetBaseObject().GetName())
            SupplyChest.RemoveItem(ExportItem, ExportAmount, true, self as ObjectReference)
        endif
        GoToState("InTransit")
    EndEvent
    
EndState

State ExportArrival
    
    Event OnUpdate()
        debug.trace(ExportAmount + " " + ExportItem.GetName() + " arriving at " + DestinationChest.GetBaseObject().GetName())
        RemoveItem(ExportItem, ExportAmount, true, DestinationChest)
        GoToState("ExportFilled")
    EndEvent
    
EndState