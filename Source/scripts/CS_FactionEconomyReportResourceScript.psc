Scriptname CS_FactionEconomyReportResourceScript extends ReferenceAlias

int Property ResourceAmount Auto hidden
int Property ArrayPosition Auto hidden

Function SetRevenueMenu()
    ObjectReference StorageType = (GetOwningQuest() as CS_FactionEconomyReportScript).StorageType
    CS_StorageFactionScript StorageScript = (StorageType as CS_StorageFactionScript)
    
    Form StorageItem = StorageScript.TodayRevenueStorageItems[ArrayPosition]
    ObjectReference StorageItemRef = StorageType.PlaceAtMe(StorageItem)
    ForceRefTo(StorageItemRef)
    ResourceAmount =  StorageScript.GetItemRevenue(StorageItem)
EndFunction

Function SetExpenseMenu()
    ObjectReference StorageType = (GetOwningQuest() as CS_FactionEconomyReportScript).StorageType
    CS_StorageFactionScript StorageScript = (StorageType as CS_StorageFactionScript)
    
    Form StorageItem = StorageScript.TodayExpenseStorageItems[ArrayPosition]
    ObjectReference StorageItemRef = StorageType.PlaceAtMe(StorageItem)
    ForceRefTo(StorageItemRef)
    ResourceAmount = -1*StorageScript.GetItemExpenses(StorageItem)
EndFunction

Function ClearResource()
    GetRef().Delete()
    Clear()
EndFunction

State Revenue
    
    Event OnUpdate()
        
        GoToState("Updating")
        SetRevenueMenu()
        GoToState("Updated")
        
    EndEvent
    
EndState

State Expense
    
    Event OnUpdate()
        
        GoToState("Updating")
        SetExpenseMenu()
        GoToState("Updated")
        
    EndEvent
    
EndState

State ClearResource
    
    Event OnUpdate()
        
        GoToState("Clearing")
        if GetRef()
            ClearResource()
        endif
        GoToState("Cleared")
        
    EndEvent
    
EndState
