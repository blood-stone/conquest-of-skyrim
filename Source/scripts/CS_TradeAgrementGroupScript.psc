Scriptname CS_TradeAgrementGroupScript extends ObjectReference  

Form Property ItemText Auto hidden
LeveledItem Property ItemLeveledItem Auto hidden
FormList Property ItemList Auto hidden

FormList Property CS_TradeItemGroupTexts Auto
FormList Property CS_TradeItemGroupLItems Auto ;For Imports
FormList Property CS_TradeItemGroupLists Auto ;For Exports

int Property Amount Auto hidden
int Property ItemCost Auto hidden

Function SetUp(Form NewItem, int NewAmount)
    ItemText = NewItem
    int GroupIndex = CS_TradeItemGroupTexts.Find(ItemText)
    
    ItemLeveledItem = CS_TradeItemGroupLItems.GetAt(GroupIndex) as LeveledItem
    ItemList = CS_TradeItemGroupLists.GetAt(GroupIndex) as FormList
    
    Amount = NewAmount
    ItemCost = ItemText.GetGoldValue()
EndFunction
