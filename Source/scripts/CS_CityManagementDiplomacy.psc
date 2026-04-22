Scriptname CS_CityManagementDiplomacy extends ObjectReference  

import CS_CommonFunctions

ObjectReference[] Property CityTradeAgreements Auto
ObjectReference[] Property FactionTradeAgreements Auto

Function AddFactionTradeAgreement(ObjectReference FactionManagementActivator)
    FactionTradeAgreements = AddToArray(FactionManagementActivator, FactionTradeAgreements)
EndFunction

Function RemoveFactionTradeAgreement(ObjectReference FactionManagementActivator)
    FactionTradeAgreements = RemoveFromArray(FactionManagementActivator, FactionTradeAgreements)
EndFunction

Function AddCityTradeAgreement(ObjectReference CityManagementActivator)
    CityTradeAgreements = AddToArray(CityManagementActivator, CityTradeAgreements)
EndFunction

Function RemoveCityTradeAgreement(ObjectReference CityManagementActivator)
    CityTradeAgreements = RemoveFromArray(CityManagementActivator, CityTradeAgreements)
EndFunction