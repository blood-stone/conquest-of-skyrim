Scriptname CS_TradeAgreementItemScript extends ObjectReference  

Form Property Item Auto hidden
LeveledItem Property ItemLeveledItem Auto hidden
FormList Property ItemList Auto hidden
int Property Amount Auto hidden

FormList Property CS_TradeItemGroupTexts Auto
FormList Property CS_TradeItemGroupLItems Auto ;For Imports
FormList Property CS_TradeItemGroupLists Auto ;For Exports

int Property ItemCost Auto hidden

bool Property GroupedItem Auto hidden

Function SetUp(Form NewItem, int NewAmount)
    Item = NewItem
    
    int GroupIndex = CS_TradeItemGroupTexts.Find(Item)
    if GroupIndex >= 0
        GroupedItem = true
        ItemLeveledItem = CS_TradeItemGroupLItems.GetAt(GroupIndex) as LeveledItem
        ItemList = CS_TradeItemGroupLists.GetAt(GroupIndex) as FormList
    endif
    
    Amount = NewAmount
    ItemCost = Item.GetGoldValue()
EndFunction