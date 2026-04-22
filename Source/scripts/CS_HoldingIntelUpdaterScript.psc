Scriptname CS_HoldingIntelUpdaterScript extends Quest  

bool Property AllowUpdate=false Auto

Location Property City Auto
int property citynum Auto

Keyword Property CS_SpyNetworkProgress Auto
Keyword Property CS_SpyNetworkFunding Auto
Keyword Property CS_SpyNetworkMission Auto
Keyword Property CS_Loyalty Auto
Keyword Property CS_LoyaltyJarl Auto
Keyword Property CS_SpyNetworkLoyalty Auto
Keyword Property CS_SpyNetworkLoyaltyJarl Auto


Function IncreaseSpyNetworkStrength()
    int StrengthIncrease = (City.GetKeywordData(CS_SpyNetworkFunding) as int)/1000 as int
    int NewSpyNetworkStrength = City.GetKeywordData(CS_SpyNetworkProgress) as int + StrengthIncrease
    City.SetKeywordData(CS_SpyNetworkProgress, NewSpyNetworkStrength)
    if City.GetKeywordData(CS_SpyNetworkProgress) > (City.GetKeywordData(CS_SpyNetworkFunding) as int)/100
        City.SetKeywordData(CS_SpyNetworkProgress, (City.GetKeywordData(CS_SpyNetworkFunding) as int)/100)  
    endif
EndFunction

Function AdjustPlayerLoyalty(bool increase)
    int LoyaltyChange
    if increase
        LoyaltyChange = (City.GetKeywordData(CS_SpyNetworkProgress) as int)/10 as int
    Else
        LoyaltyChange = -(City.GetKeywordData(CS_SpyNetworkProgress) as int)/10 as int
    EndIf
    
    int NewSpyNetworkLoyalty = City.GetKeywordData(CS_Loyalty) as int + LoyaltyChange
    City.SetKeywordData(CS_Loyalty, NewSpyNetworkLoyalty)
    if City.GetKeywordData(CS_Loyalty) > 100
        City.SetKeywordData(CS_Loyalty, 100)
    elseif City.GetKeywordData(CS_Loyalty) < 0
        City.SetKeywordData(CS_Loyalty, 0)
    endif
EndFunction

Function AdjustJarlLoyalty(bool increase)
    int LoyaltyChange
    if increase
        LoyaltyChange = (City.GetKeywordData(CS_SpyNetworkProgress) as int)/10 as int
    Else
        LoyaltyChange = -(City.GetKeywordData(CS_SpyNetworkProgress) as int)/10 as int
    EndIf
    
    int NewSpyNetworkLoyalty = City.GetKeywordData(CS_LoyaltyJarl) as int + LoyaltyChange
    City.SetKeywordData(CS_LoyaltyJarl, NewSpyNetworkLoyalty)
    if City.GetKeywordData(CS_LoyaltyJarl) > 100
        City.SetKeywordData(CS_LoyaltyJarl, 100)
    elseif City.GetKeywordData(CS_LoyaltyJarl) < 0
        City.SetKeywordData(CS_LoyaltyJarl, 0)
    endif
EndFunction

Function UpdateIntelReport()

    int IntelCityJarlLoyalty = City.GetKeywordData(CS_LoyaltyJarl) as int
    int IntelCityPlayerLoyalty = City.GetKeywordData(CS_Loyalty) as int

    int IntelAccuracyModifierMax = (City.GetKeywordData(CS_SpyNetworkProgress) as int) - 50
    if IntelAccuracyModifierMax > 0
        IntelAccuracyModifierMax = 0
    endif

    IntelAccuracyModifierMax = math.abs(IntelAccuracyModifierMax) as int

    int IntelAccuracyModifier = utility.randomint(-IntelAccuracyModifierMax, IntelAccuracyModifierMax)

    IntelCityJarlLoyalty += IntelAccuracyModifier
    IntelCityPlayerLoyalty += IntelAccuracyModifier

    City.SetKeywordData(CS_SpyNetworkLoyalty, IntelCityPlayerLoyalty)
    City.SetKeywordData(CS_SpyNetworkLoyaltyJarl, IntelCityJarlLoyalty)
EndFunction

Event OnUpdate()
    if AllowUpdate == true
        debug.trace("Update of City " + citynum + " intel ALLOWED")
        if City.GetKeywordData(CS_SpyNetworkMission) == 1
            IncreaseSpyNetworkStrength()
        ElseIf City.GetKeywordData(CS_SpyNetworkMission) == 2
            AdjustPlayerLoyalty(true)
        ElseIf City.GetKeywordData(CS_SpyNetworkMission) == 3
            AdjustJarlLoyalty(true)
        ElseIf City.GetKeywordData(CS_SpyNetworkMission) == 4
            AdjustPlayerLoyalty(False)
        ElseIf City.GetKeywordData(CS_SpyNetworkMission) == 5
            AdjustJarlLoyalty(False)
        endif
        UpdateIntelReport()
        AllowUpdate = false
    else
        debug.trace("Update of City " + citynum + " intel NOT allowed")
    endif
EndEvent
