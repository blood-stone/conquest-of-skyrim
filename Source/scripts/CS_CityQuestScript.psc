Scriptname CS_CityQuestScript extends Quest  

int Property citynum Auto

LocationAlias Property City Auto

FormList Property CS_AllLocations Auto

ObjectReference Property Increased Auto
ObjectReference Property Decreased Auto

Keyword Property CS_StoryCityQuestsShowMessages Auto

CS_InfluenceHoldUpdaterScript Property InfluenceHold Auto
CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto

Function SetUp()
    citynum = CS_AllLocations.Find(City.GetLocation())
    InfluenceHold = CS_EconomyUpdaterNew.InfluenceHoldUpdaters[citynum]
EndFunction

Function ChangeGroupInfluence(string Group, int change)
    CS_InfluenceChangesScript InfluenceChanges = ((self as Quest) as CS_InfluenceChangesScript)
    
    InfluenceChanges.AdjustInfluence(citynum, Group, change)
EndFunction

Function AdjustCityValues(int influencechange, int cityopinionchange)
    InfluenceHold.InfluenceNobilityFromQuests += influencechange
    InfluenceHold.InfluenceCommonerFromQuests += influencechange
    
    ObjectReference InfluenceIOrD
    ObjectReference CityOpinionIOrD
    
    if influencechange > 0
        InfluenceIorD = Increased
    elseif influencechange < 0
        InfluenceIorD = Decreased
    endif
    
    if cityopinionchange > 0
        CityOpinionIorD = Increased
    elseif cityopinionchange < 0
        CityOpinionIorD = Decreased
    endif
    
    CS_StoryCityQuestsShowMessages.SendStoryEvent(City.GetLocation(), InfluenceIorD, CityOpinionIorD)
EndFunction