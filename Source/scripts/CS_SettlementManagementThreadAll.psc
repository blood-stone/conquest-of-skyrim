Scriptname CS_SettlementManagementThreadAll extends ReferenceAlias

int Property ResourceNum Auto

int Property ResourceAmount Auto hidden
int Property ArrayPosition Auto hidden

ObjectReference Property CityStorage Auto hidden

CS_ConstructionCostScript Property ConstructionCostScript Auto hidden

int Property MaterialAmount Auto hidden
int Property PlayerMaterialAmount Auto hidden

Function SetRevenueMenu()
    ObjectReference StorageType = (GetOwningQuest() as CS_SettlementManagementScript).StorageType
    CS_StorageCityScript StorageScript = (StorageType as CS_StorageCityScript)
    
    Form StorageItem = StorageScript.TodayRevenueStorageItems[ArrayPosition]
    ObjectReference StorageItemRef = StorageType.PlaceAtMe(StorageItem)
    ForceRefTo(StorageItemRef)
    ResourceAmount =  StorageScript.GetItemRevenue(StorageItem)
EndFunction

Function SetExpenseMenu()
    ObjectReference StorageType = (GetOwningQuest() as CS_SettlementManagementScript).StorageType
    CS_StorageCityScript StorageScript = (StorageType as CS_StorageCityScript)
    
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

State ConstructionCost
    
    Event OnUpdate()
        
        GoToState("Updating")
        FormList Materials = ConstructionCostScript.Materials
        Form Material = Materials.GetAt(ResourceNum)
        ObjectReference MaterialRef = CityStorage.PlaceAtMe(Materials.GetAt(ResourceNum))
        MaterialAmount = ConstructionCostScript.Amounts[ResourceNum] 
        ForceRefTo(MaterialRef)
        PlayerMaterialAmount = Game.GetPlayer().GetItemCount(Material) + CityStorage.GetItemCount(Material)
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