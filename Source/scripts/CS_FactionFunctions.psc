Scriptname CS_FactionFunctions extends Form Hidden


CS_City[] Function RemoveFromCityArray(CS_City Subtraction, CS_City[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    CS_City[] NewArray = GetNewCityArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
CS_City[] Function AddToCityArray(CS_City Addition, CS_City[] OldArray) global
    if !OldArray
        CS_City[] NewArray = new CS_City[1]
        NewArray[0] = Addition
        return NewArray
    endif
    int NewArrayLength = OldArray.Length + 1

    CS_City[] NewArray = GetNewCityArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

CS_City[] Function GetNewCityArray(int ArraySize) global
    CS_City[] NewArray

    if ArraySize == 1
        NewArray = new CS_City[1]
    elseif ArraySize == 2
        NewArray = new CS_City[2]
    elseif ArraySize == 3
        NewArray = new CS_City[3]
    elseif ArraySize == 4
        NewArray = new CS_City[4]
    elseif ArraySize == 5
        NewArray = new CS_City[5]
    elseif ArraySize == 6
        NewArray = new CS_City[6]
    elseif ArraySize == 7
        NewArray = new CS_City[7]
    elseif ArraySize == 8
        NewArray = new CS_City[8]
    elseif ArraySize == 9
        NewArray = new CS_City[9]
    elseif ArraySize == 10
        NewArray = new CS_City[10]
    elseif ArraySize == 11
        NewArray = new CS_City[11]
    elseif ArraySize == 12
        NewArray = new CS_City[12]
    elseif ArraySize == 13
        NewArray = new CS_City[13]
    elseif ArraySize == 14
        NewArray = new CS_City[14]
    elseif ArraySize == 15
        NewArray = new CS_City[15]
    elseif ArraySize == 16
        NewArray = new CS_City[16]
    elseif ArraySize == 17
        NewArray = new CS_City[17]
    elseif ArraySize == 18
        NewArray = new CS_City[18]
    elseif ArraySize == 19
        NewArray = new CS_City[19]
    elseif ArraySize == 20
        NewArray = new CS_City[20]
    elseif ArraySize == 21
        NewArray = new CS_City[21]
    elseif ArraySize == 22
        NewArray = new CS_City[22]
    elseif ArraySize == 23
        NewArray = new CS_City[23]
    elseif ArraySize == 24
        NewArray = new CS_City[24]
    elseif ArraySize == 25
        NewArray = new CS_City[25]
    elseif ArraySize == 26
        NewArray = new CS_City[26]
    elseif ArraySize == 27
        NewArray = new CS_City[27]
    elseif ArraySize == 28
        NewArray = new CS_City[28]
    elseif ArraySize == 29
        NewArray = new CS_City[29]
    elseif ArraySize == 30
        NewArray = new CS_City[30]
    elseif ArraySize == 31
        NewArray = new CS_City[31]
    elseif ArraySize == 32
        NewArray = new CS_City[32]
    elseif ArraySize == 33
        NewArray = new CS_City[33]
    elseif ArraySize == 34
        NewArray = new CS_City[34]
    elseif ArraySize == 35
        NewArray = new CS_City[35]
    elseif ArraySize == 36
        NewArray = new CS_City[36]
    elseif ArraySize == 37
        NewArray = new CS_City[37]
    elseif ArraySize == 38
        NewArray = new CS_City[38]
    elseif ArraySize == 39
        NewArray = new CS_City[39]
    elseif ArraySize == 40
        NewArray = new CS_City[40]
    endif
    
    return NewArray
EndFunction

CS_Settlement[] Function RemoveFromSettlementArray(CS_Settlement Subtraction, CS_Settlement[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    CS_Settlement[] NewArray = GetNewSettlementArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
CS_Settlement[] Function AddToSettlementArray(CS_Settlement Addition, CS_Settlement[] OldArray) global
    if !OldArray
        CS_Settlement[] NewArray = new CS_Settlement[1]
        NewArray[0] = Addition
        return NewArray
    endif
    int NewArrayLength = OldArray.Length + 1

    CS_Settlement[] NewArray = GetNewSettlementArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

CS_Settlement[] Function GetNewSettlementArray(int ArraySize) global
    CS_Settlement[] NewArray

    if ArraySize == 1
        NewArray = new CS_Settlement[1]
    elseif ArraySize == 2
        NewArray = new CS_Settlement[2]
    elseif ArraySize == 3
        NewArray = new CS_Settlement[3]
    elseif ArraySize == 4
        NewArray = new CS_Settlement[4]
    elseif ArraySize == 5
        NewArray = new CS_Settlement[5]
    elseif ArraySize == 6
        NewArray = new CS_Settlement[6]
    elseif ArraySize == 7
        NewArray = new CS_Settlement[7]
    elseif ArraySize == 8
        NewArray = new CS_Settlement[8]
    elseif ArraySize == 9
        NewArray = new CS_Settlement[9]
    elseif ArraySize == 10
        NewArray = new CS_Settlement[10]
    elseif ArraySize == 11
        NewArray = new CS_Settlement[11]
    elseif ArraySize == 12
        NewArray = new CS_Settlement[12]
    elseif ArraySize == 13
        NewArray = new CS_Settlement[13]
    elseif ArraySize == 14
        NewArray = new CS_Settlement[14]
    elseif ArraySize == 15
        NewArray = new CS_Settlement[15]
    elseif ArraySize == 16
        NewArray = new CS_Settlement[16]
    elseif ArraySize == 17
        NewArray = new CS_Settlement[17]
    elseif ArraySize == 18
        NewArray = new CS_Settlement[18]
    elseif ArraySize == 19
        NewArray = new CS_Settlement[19]
    elseif ArraySize == 20
        NewArray = new CS_Settlement[20]
    elseif ArraySize == 21
        NewArray = new CS_Settlement[21]
    elseif ArraySize == 22
        NewArray = new CS_Settlement[22]
    elseif ArraySize == 23
        NewArray = new CS_Settlement[23]
    elseif ArraySize == 24
        NewArray = new CS_Settlement[24]
    elseif ArraySize == 25
        NewArray = new CS_Settlement[25]
    elseif ArraySize == 26
        NewArray = new CS_Settlement[26]
    elseif ArraySize == 27
        NewArray = new CS_Settlement[27]
    elseif ArraySize == 28
        NewArray = new CS_Settlement[28]
    elseif ArraySize == 29
        NewArray = new CS_Settlement[29]
    elseif ArraySize == 30
        NewArray = new CS_Settlement[30]
    elseif ArraySize == 31
        NewArray = new CS_Settlement[31]
    elseif ArraySize == 32
        NewArray = new CS_Settlement[32]
    elseif ArraySize == 33
        NewArray = new CS_Settlement[33]
    elseif ArraySize == 34
        NewArray = new CS_Settlement[34]
    elseif ArraySize == 35
        NewArray = new CS_Settlement[35]
    elseif ArraySize == 36
        NewArray = new CS_Settlement[36]
    elseif ArraySize == 37
        NewArray = new CS_Settlement[37]
    elseif ArraySize == 38
        NewArray = new CS_Settlement[38]
    elseif ArraySize == 39
        NewArray = new CS_Settlement[39]
    elseif ArraySize == 40
        NewArray = new CS_Settlement[40]
    endif
    
    return NewArray
EndFunction

CS_Village[] Function RemoveFromVillageArray(CS_Village Subtraction, CS_Village[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    CS_Village[] NewArray = GetNewVillageArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
CS_Village[] Function AddToVillageArray(CS_Village Addition, CS_Village[] OldArray) global
    if !OldArray
        CS_Village[] NewArray = new CS_Village[1]
        NewArray[0] = Addition
        return NewArray
    endif
    int NewArrayLength = OldArray.Length + 1

    CS_Village[] NewArray = GetNewVillageArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

CS_Village[] Function GetNewVillageArray(int ArraySize) global
    CS_Village[] NewArray

    if ArraySize == 1
        NewArray = new CS_Village[1]
    elseif ArraySize == 2
        NewArray = new CS_Village[2]
    elseif ArraySize == 3
        NewArray = new CS_Village[3]
    elseif ArraySize == 4
        NewArray = new CS_Village[4]
    elseif ArraySize == 5
        NewArray = new CS_Village[5]
    elseif ArraySize == 6
        NewArray = new CS_Village[6]
    elseif ArraySize == 7
        NewArray = new CS_Village[7]
    elseif ArraySize == 8
        NewArray = new CS_Village[8]
    elseif ArraySize == 9
        NewArray = new CS_Village[9]
    elseif ArraySize == 10
        NewArray = new CS_Village[10]
    elseif ArraySize == 11
        NewArray = new CS_Village[11]
    elseif ArraySize == 12
        NewArray = new CS_Village[12]
    elseif ArraySize == 13
        NewArray = new CS_Village[13]
    elseif ArraySize == 14
        NewArray = new CS_Village[14]
    elseif ArraySize == 15
        NewArray = new CS_Village[15]
    elseif ArraySize == 16
        NewArray = new CS_Village[16]
    elseif ArraySize == 17
        NewArray = new CS_Village[17]
    elseif ArraySize == 18
        NewArray = new CS_Village[18]
    elseif ArraySize == 19
        NewArray = new CS_Village[19]
    elseif ArraySize == 20
        NewArray = new CS_Village[20]
    elseif ArraySize == 21
        NewArray = new CS_Village[21]
    elseif ArraySize == 22
        NewArray = new CS_Village[22]
    elseif ArraySize == 23
        NewArray = new CS_Village[23]
    elseif ArraySize == 24
        NewArray = new CS_Village[24]
    elseif ArraySize == 25
        NewArray = new CS_Village[25]
    elseif ArraySize == 26
        NewArray = new CS_Village[26]
    elseif ArraySize == 27
        NewArray = new CS_Village[27]
    elseif ArraySize == 28
        NewArray = new CS_Village[28]
    elseif ArraySize == 29
        NewArray = new CS_Village[29]
    elseif ArraySize == 30
        NewArray = new CS_Village[30]
    elseif ArraySize == 31
        NewArray = new CS_Village[31]
    elseif ArraySize == 32
        NewArray = new CS_Village[32]
    elseif ArraySize == 33
        NewArray = new CS_Village[33]
    elseif ArraySize == 34
        NewArray = new CS_Village[34]
    elseif ArraySize == 35
        NewArray = new CS_Village[35]
    elseif ArraySize == 36
        NewArray = new CS_Village[36]
    elseif ArraySize == 37
        NewArray = new CS_Village[37]
    elseif ArraySize == 38
        NewArray = new CS_Village[38]
    elseif ArraySize == 39
        NewArray = new CS_Village[39]
    elseif ArraySize == 40
        NewArray = new CS_Village[40]
    endif
    
    return NewArray
EndFunction

CS_Faction[] Function RemoveFromFactionArray(CS_Faction Subtraction, CS_Faction[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    CS_Faction[] NewArray = GetNewFactionArray(NewArrayLength)
    
    int i = 0
    int new_i = 0
    while i < OldArray.Length
        if i != SubtractionIndex
            NewArray[new_i] = OldArray[i]
            new_i += 1
        endif
        i += 1
    endwhile
    
    return NewArray
EndFunction
    
CS_Faction[] Function AddToFactionArray(CS_Faction Addition, CS_Faction[] OldArray) global
    if !OldArray
        CS_Faction[] NewArray = new CS_Faction[1]
        NewArray[0] = Addition
        return NewArray
    endif
    int NewArrayLength = OldArray.Length + 1

    CS_Faction[] NewArray = GetNewFactionArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

CS_Faction[] Function GetNewFactionArray(int ArraySize) global
    CS_Faction[] NewArray

    if ArraySize == 1
        NewArray = new CS_Faction[1]
    elseif ArraySize == 2
        NewArray = new CS_Faction[2]
    elseif ArraySize == 3
        NewArray = new CS_Faction[3]
    elseif ArraySize == 4
        NewArray = new CS_Faction[4]
    elseif ArraySize == 5
        NewArray = new CS_Faction[5]
    elseif ArraySize == 6
        NewArray = new CS_Faction[6]
    elseif ArraySize == 7
        NewArray = new CS_Faction[7]
    elseif ArraySize == 8
        NewArray = new CS_Faction[8]
    elseif ArraySize == 9
        NewArray = new CS_Faction[9]
    elseif ArraySize == 10
        NewArray = new CS_Faction[10]
    elseif ArraySize == 11
        NewArray = new CS_Faction[11]
    elseif ArraySize == 12
        NewArray = new CS_Faction[12]
    elseif ArraySize == 13
        NewArray = new CS_Faction[13]
    elseif ArraySize == 14
        NewArray = new CS_Faction[14]
    elseif ArraySize == 15
        NewArray = new CS_Faction[15]
    elseif ArraySize == 16
        NewArray = new CS_Faction[16]
    elseif ArraySize == 17
        NewArray = new CS_Faction[17]
    elseif ArraySize == 18
        NewArray = new CS_Faction[18]
    elseif ArraySize == 19
        NewArray = new CS_Faction[19]
    elseif ArraySize == 20
        NewArray = new CS_Faction[20]
    elseif ArraySize == 21
        NewArray = new CS_Faction[21]
    elseif ArraySize == 22
        NewArray = new CS_Faction[22]
    elseif ArraySize == 23
        NewArray = new CS_Faction[23]
    elseif ArraySize == 24
        NewArray = new CS_Faction[24]
    elseif ArraySize == 25
        NewArray = new CS_Faction[25]
    elseif ArraySize == 26
        NewArray = new CS_Faction[26]
    elseif ArraySize == 27
        NewArray = new CS_Faction[27]
    elseif ArraySize == 28
        NewArray = new CS_Faction[28]
    elseif ArraySize == 29
        NewArray = new CS_Faction[29]
    elseif ArraySize == 30
        NewArray = new CS_Faction[30]
    elseif ArraySize == 31
        NewArray = new CS_Faction[31]
    elseif ArraySize == 32
        NewArray = new CS_Faction[32]
    elseif ArraySize == 33
        NewArray = new CS_Faction[33]
    elseif ArraySize == 34
        NewArray = new CS_Faction[34]
    elseif ArraySize == 35
        NewArray = new CS_Faction[35]
    elseif ArraySize == 36
        NewArray = new CS_Faction[36]
    elseif ArraySize == 37
        NewArray = new CS_Faction[37]
    elseif ArraySize == 38
        NewArray = new CS_Faction[38]
    elseif ArraySize == 39
        NewArray = new CS_Faction[39]
    elseif ArraySize == 40
        NewArray = new CS_Faction[40]
    endif
    
    return NewArray
EndFunction