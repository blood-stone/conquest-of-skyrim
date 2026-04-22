Scriptname CS_InfluenceChangesScript extends Quest  

CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto

Function AdjustInfluence(int citynum, string group, int change)
    CS_InfluenceHoldUpdaterScript InfluenceHold = CS_EconomyUpdaterNew.InfluenceHoldUpdaters[citynum]
    string city = "None"
    string changetext
    int initialinfluence
    int newinfluence
    string newinfluencetext = "None"
    
    if citynum == 0
        city = "The Reach"
    elseif citynum == 1
        city = "The Rift"
    elseif citynum == 2
        city = "Haafingar"
    elseif citynum == 3
        city = "Whiterun"
    elseif citynum == 4
        city = "Eastmarch"
    elseif citynum == 5
        city = "The Pale"
    elseif citynum == 6
        city = "Falkreath"
    elseif citynum == 7
        city = "Hjaalmarch"
    elseif citynum == 8
        city = "Winterhold"
    endif
    
    if change >= 10
        changetext = "greatly increased"
    elseif change >= 5
        changetext = "increased"
    elseif change > 0
        changetext = "slightly increased"
    elseif change == 0
        changetext = "not changed"
    elseif change >= -5
        changetext = "slightly decreased"
    elseif change >= -10
        changetext = "decreased"
    elseif change < -10
        changetext = "greatly decreased"
    endif
    
    if group == "Nobility"
        initialinfluence = InfluenceHold.InfluenceNobility
        InfluenceHold.InfluenceNobility += change
        newinfluence = InfluenceHold.InfluenceNobility
    elseif group == "Commoners"
        initialinfluence = InfluenceHold.InfluenceCommoner
        InfluenceHold.InfluenceCommoner += change
        newinfluence = InfluenceHold.InfluenceCommoner
    elseif group == "Guards"
        initialinfluence = InfluenceHold.InfluenceGuards
        InfluenceHold.InfluenceGuards += change
        newinfluence = InfluenceHold.InfluenceGuards
    elseif group == "Jarl"
        initialinfluence = InfluenceHold.InfluenceJarl
        InfluenceHold.InfluenceJarl += change
        newinfluence = InfluenceHold.InfluenceJarl
    endif
    
    InfluenceHold.UpdateInfluence()
    
    if change != 0
        debug.notification("Influence with the " + group + " of " + city + " has " + changetext + "!")
    endif
    
    if initialinfluence >= 20 && newinfluence < 20
        newinfluencetext = "an Outsider"
    elseif initialinfluence >= 40 && newinfluence < 40 && newinfluence >= 20
        newinfluencetext = "an Acquantance"
    elseif initialinfluence >= 60 && newinfluence < 60 && newinfluence >= 40
        newinfluencetext = "a Respected Figure"
    elseif initialinfluence >= 80 && newinfluence < 80 && newinfluence >= 60
        newinfluencetext = "an Influential Power"
    elseif initialinfluence < 20 && newinfluence >= 20
        newinfluencetext = "an Acquantance"
    elseif initialinfluence < 40 && newinfluence >= 40 && newinfluence < 60
        newinfluencetext = "a Respected Figure"
    elseif initialinfluence < 60 && newinfluence >= 60 && newinfluence < 80
        newinfluencetext = "an Influential Power"
    elseif initialinfluence < 80 && newinfluence >= 80 && newinfluence < 100
        newinfluencetext = "the Champion"
    endif
    
    if newinfluencetext != "None" && city != "None"
        debug.notification("You are now seen as " + newinfluencetext + " of the " + group + " in " + city + "!")
    endif
EndFunction

Function SetInfluence(int citynum, string group, int newinfluence, bool onlyiflower = false)
    CS_InfluenceHoldUpdaterScript InfluenceHold = CS_EconomyUpdaterNew.InfluenceHoldUpdaters[citynum]
    string city = "None"
    ;string changetext
    int initialinfluence
    string newinfluencetext = "None"
    
    if citynum == 0
        city = "The Reach"
    elseif citynum == 1
        city = "The Rift"
    elseif citynum == 2
        city = "Haafingar"
    elseif citynum == 3
        city = "Whiterun"
    elseif citynum == 4
        city = "Eastmarch"
    elseif citynum == 5
        city = "The Pale"
    elseif citynum == 6
        city = "Falkreath"
    elseif citynum == 7
        city = "Hjaalmarch"
    elseif citynum == 8
        city = "Winterhold"
    endif
    
    if group == "Nobility"
        initialinfluence = InfluenceHold.InfluenceNobility
        if initialinfluence < newinfluence
            InfluenceHold.InfluenceNobility = newinfluence
        endif
    elseif group == "Commoners"
        initialinfluence = InfluenceHold.InfluenceCommoner
        if initialinfluence < newinfluence
            InfluenceHold.InfluenceCommoner = newinfluence
        endif
    elseif group == "Guards"
        initialinfluence = InfluenceHold.InfluenceGuards
        if initialinfluence < newinfluence
            InfluenceHold.InfluenceGuards = newinfluence
        endif
    elseif group == "Jarl"
        initialinfluence = InfluenceHold.InfluenceJarl
        if initialinfluence < newinfluence
            InfluenceHold.InfluenceJarl = newinfluence
        endif
    endif
    ;/
    int change = newinfluence - initialinfluence
    
    if change >= 10
        changetext = "greatly increased"
    elseif change >= 5
        changetext = "increased"
    elseif change > 0
        changetext = "slightly increased"
    elseif change == 0
        changetext = "not changed"
    elseif change >= -5
        changetext = "slightly decreased"
    elseif change >= -10
        changetext = "decreased"
    elseif change < -10
        changetext = "greatly decreased"
    endif
    /;
    InfluenceHold.UpdateInfluence()
    ;/
    if change != 0
        debug.notification("Influence with the " + group + " of " + city + " has " + changetext + "!")
    endif
    /;
    if initialinfluence >= 20 && newinfluence < 20
        newinfluencetext = "an Outsider"
    elseif initialinfluence >= 40 && newinfluence < 40 && newinfluence >= 20
        newinfluencetext = "an Acquantance"
    elseif initialinfluence >= 60 && newinfluence < 60 && newinfluence >= 40
        newinfluencetext = "a Respected Figure"
    elseif initialinfluence >= 80 && newinfluence < 80 && newinfluence >= 60
        newinfluencetext = "an Influential Power"
    elseif initialinfluence < 20 && newinfluence >= 20 && newinfluence < 40
        newinfluencetext = "an Acquantance"
    elseif initialinfluence < 40 && newinfluence >= 40 && newinfluence < 60
        newinfluencetext = "a Respected Figure"
    elseif initialinfluence < 60 && newinfluence >= 60 && newinfluence < 80
        newinfluencetext = "an Influential Power"
    elseif initialinfluence < 80 && newinfluence >= 80 && newinfluence < 100
        newinfluencetext = "the Champion"
    endif
    
    if newinfluencetext != "None" && city != "None"
        debug.notification("You are now seen as " + newinfluencetext + " of the " + group + " in " + city + "!")
    endif
EndFunction