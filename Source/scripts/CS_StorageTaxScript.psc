Scriptname CS_StorageTaxScript extends ObjectReference  

ObjectReference Property City Auto hidden

GlobalVariable Property GameDaysPassed Auto

MiscObject Property Gold001 Auto

float NextTaxAmount
float LastUpdate

Function SetUp(ObjectReference NewCity)
    City = NewCity
    LastUpdate = GameDaysPassed.GetValue()
EndFunction

Function CollectTaxes()
    CS_CityManagementPopulation Population = City as CS_CityManagementPopulation
    CS_CityManagementEconomy Economy = City as CS_CityManagementEconomy
    
    int DailyTaxes = Population.TotalPopulation*Economy.HousingTax + Economy.TotalIncomeTax
    
    float TaxAdjustment = math.floor(GameDaysPassed.GetValue() - LastUpdate)
    if TaxAdjustment < 1
        TaxAdjustment = 1
    endif
    LastUpdate = GameDaysPassed.GetValue()
    float AdjustedTaxes = TaxAdjustment*DailyTaxes
    NextTaxAmount += AdjustedTaxes
    if NextTaxAmount >= 1
        int amounttoadd = math.floor(NextTaxAmount) as int
        AddItem(Gold001, amounttoadd)
        NextTaxAmount -= amounttoadd
    endif
EndFunction

Function DeliverTaxes()
    CS_CityManagementOwnership Ownership = City as CS_CityManagementOwnership
    ObjectReference FactionOwnerActivator = Ownership.FactionOwnerActivator
    CS_FactionManagementEconomy FactionEconomy = FactionOwnerActivator as CS_FactionManagementEconomy
    int StoredTaxAmount = GetItemCount(Gold001)
    
    if StoredTaxAmount > 0
        RemoveItem(Gold001, StoredTaxAmount, true, FactionEconomy.StorageTreasury)
    endif
EndFunction

State DailyUpdate
    
    Event OnUpdate()
        DeliverTaxes()
        CollectTaxes()
    EndEvent
    
EndState
    