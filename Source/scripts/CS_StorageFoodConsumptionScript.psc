Scriptname CS_StorageFoodConsumptionScript extends ObjectReference  

ObjectReference Property City Auto hidden

GlobalVariable Property GameDaysPassed Auto

int Property FoodDeficiency Auto hidden

float LastUpdate

Function SetUp(ObjectReference NewCity)
    City = NewCity
    LastUpdate = GameDaysPassed.GetValue()
EndFunction

Function CollectFood()
    CS_CityManagementOwnership Ownership = City as CS_CityManagementOwnership
    CS_CityManagementPopulation Population = City as CS_CityManagementPopulation
    CS_FactionManagementEconomy FactionEconomy = Ownership.FactionOwnerActivator as CS_FactionManagementEconomy
    CS_StorageFactionScript FoodStorage = FactionEconomy.StorageFood as CS_StorageFactionScript
    
    float FoodAdjustment = math.floor(GameDaysPassed.GetValue() - LastUpdate)
    if FoodAdjustment < 1
        FoodAdjustment = 1
    endif
    int TotalFood = math.floor(FoodAdjustment*Population.TotalPopulation) as int
    LastUpdate = GameDaysPassed.GetValue()
    int RemainingAmount = FoodStorage.Consume(self as ObjectReference, TotalFood)
    if RemainingAmount > 0
        ;CheckReserves
    endif
    
    FoodDeficiency = RemainingAmount
    debug.trace("Faction gave " + (TotalFood - RemainingAmount) + " Food for " + Ownership.VanillaCity.GetName() + ". Deficiency = " + FoodDeficiency)
EndFunction