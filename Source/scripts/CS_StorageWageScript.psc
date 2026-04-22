Scriptname CS_StorageWageScript extends ObjectReference  

ObjectReference Property City Auto hidden

GlobalVariable Property GameDaysPassed Auto

MiscObject Property Gold001 Auto

float LastUpdate
float Property WagesPaid Auto hidden

Function SetUp(ObjectReference NewCity)
    City = NewCity
    LastUpdate = GameDaysPassed.GetValue()
EndFunction

Function CollectWages()
    CS_CityManagementOwnership Ownership = City as CS_CityManagementOwnership
    CS_FactionManagementEconomy FactionEconomy = Ownership.FactionOwnerActivator as CS_FactionManagementEconomy
    CS_CityManagementEconomy Economy = City as CS_CityManagementEconomy
    Economy.GetTotalWages()
    
    float WageAdjustment = math.floor(GameDaysPassed.GetValue() - LastUpdate)
    if WageAdjustment < 1
        WageAdjustment = 1
    endif
    int TotalWages = math.floor(WageAdjustment*Economy.TotalWages) as int
    LastUpdate = GameDaysPassed.GetValue()
    FactionEconomy.StorageTreasury.RemoveItem(Gold001, TotalWages, true, self as ObjectReference)
    int ReceivedWages = GetItemCount(Gold001)
    RemoveItem(Gold001, ReceivedWages)
    
    if TotalWages > 0
        WagesPaid = (ReceivedWages as float/TotalWages)
    else
        WagesPaid = 0
    endif
    debug.trace("Faction paid " + ReceivedWages + " in Wages for " + Ownership.VanillaCity.GetName() + ". WagesPaid = " + WagesPaid)
EndFunction
    
    