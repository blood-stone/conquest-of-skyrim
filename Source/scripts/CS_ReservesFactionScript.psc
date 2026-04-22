Scriptname CS_ReservesFactionScript extends ObjectReference  

import CS_CommonFunctions

CS_BuildingScriptImportThreadManager ImportThreadManager
CS_BuildingScriptExportThreadManager ExportThreadManager

FormList Property ReservesItems Auto

float Property FactionOwnerCut Auto

Function SetUp()
    
    ImportThreadManager = (self as ObjectReference) as CS_BuildingScriptImportThreadManager
    ImportThreadManager.SetUp()
    
    ExportThreadManager = (self as ObjectReference) as CS_BuildingScriptExportThreadManager
    ExportThreadManager.SetUp()
    AddInventoryEventFilter(ReservesItems)
EndFunction