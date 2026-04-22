Scriptname CS_HoldingFunctions extends Form Hidden 

CS_BuildingManagementScript[] Function RemoveFromBuildingArray(CS_BuildingManagementScript Subtraction, CS_BuildingManagementScript[] OldArray) global
    int SubtractionIndex = OldArray.Find(Subtraction)

    int NewArrayLength = OldArray.Length - 1

    CS_BuildingManagementScript[] NewArray = GetNewBuildingArray(NewArrayLength)
    
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
    
CS_BuildingManagementScript[] Function AddToBuildingArray(CS_BuildingManagementScript Addition, CS_BuildingManagementScript[] OldArray) global
    if !OldArray
        CS_BuildingManagementScript[] NewArray = new CS_BuildingManagementScript[1]
        NewArray[0] = Addition
        return NewArray
    endif
    int NewArrayLength = OldArray.Length + 1

    CS_BuildingManagementScript[] NewArray = GetNewBuildingArray(NewArrayLength)
    
    int i = 0
    while i < OldArray.Length
        NewArray[i] = OldArray[i]
        i += 1
    endwhile
    
    NewArray[i] = Addition
    
    return NewArray
EndFunction

CS_BuildingManagementScript[] Function GetNewBuildingArray(int ArraySize) global
    CS_BuildingManagementScript[] NewArray

    if ArraySize == 1
        NewArray = new CS_BuildingManagementScript[1]
    elseif ArraySize == 2
        NewArray = new CS_BuildingManagementScript[2]
    elseif ArraySize == 3
        NewArray = new CS_BuildingManagementScript[3]
    elseif ArraySize == 4
        NewArray = new CS_BuildingManagementScript[4]
    elseif ArraySize == 5
        NewArray = new CS_BuildingManagementScript[5]
    elseif ArraySize == 6
        NewArray = new CS_BuildingManagementScript[6]
    elseif ArraySize == 7
        NewArray = new CS_BuildingManagementScript[7]
    elseif ArraySize == 8
        NewArray = new CS_BuildingManagementScript[8]
    elseif ArraySize == 9
        NewArray = new CS_BuildingManagementScript[9]
    elseif ArraySize == 10
        NewArray = new CS_BuildingManagementScript[10]
    elseif ArraySize == 11
        NewArray = new CS_BuildingManagementScript[11]
    elseif ArraySize == 12
        NewArray = new CS_BuildingManagementScript[12]
    elseif ArraySize == 13
        NewArray = new CS_BuildingManagementScript[13]
    elseif ArraySize == 14
        NewArray = new CS_BuildingManagementScript[14]
    elseif ArraySize == 15
        NewArray = new CS_BuildingManagementScript[15]
    elseif ArraySize == 16
        NewArray = new CS_BuildingManagementScript[16]
    elseif ArraySize == 17
        NewArray = new CS_BuildingManagementScript[17]
    elseif ArraySize == 18
        NewArray = new CS_BuildingManagementScript[18]
    elseif ArraySize == 19
        NewArray = new CS_BuildingManagementScript[19]
    elseif ArraySize == 20
        NewArray = new CS_BuildingManagementScript[20]
    elseif ArraySize == 21
        NewArray = new CS_BuildingManagementScript[21]
    elseif ArraySize == 22
        NewArray = new CS_BuildingManagementScript[22]
    elseif ArraySize == 23
        NewArray = new CS_BuildingManagementScript[23]
    elseif ArraySize == 24
        NewArray = new CS_BuildingManagementScript[24]
    elseif ArraySize == 25
        NewArray = new CS_BuildingManagementScript[25]
    elseif ArraySize == 26
        NewArray = new CS_BuildingManagementScript[26]
    elseif ArraySize == 27
        NewArray = new CS_BuildingManagementScript[27]
    elseif ArraySize == 28
        NewArray = new CS_BuildingManagementScript[28]
    elseif ArraySize == 29
        NewArray = new CS_BuildingManagementScript[29]
    elseif ArraySize == 30
        NewArray = new CS_BuildingManagementScript[30]
    elseif ArraySize == 31
        NewArray = new CS_BuildingManagementScript[31]
    elseif ArraySize == 32
        NewArray = new CS_BuildingManagementScript[32]
    elseif ArraySize == 33
        NewArray = new CS_BuildingManagementScript[33]
    elseif ArraySize == 34
        NewArray = new CS_BuildingManagementScript[34]
    elseif ArraySize == 35
        NewArray = new CS_BuildingManagementScript[35]
    elseif ArraySize == 36
        NewArray = new CS_BuildingManagementScript[36]
    elseif ArraySize == 37
        NewArray = new CS_BuildingManagementScript[37]
    elseif ArraySize == 38
        NewArray = new CS_BuildingManagementScript[38]
    elseif ArraySize == 39
        NewArray = new CS_BuildingManagementScript[39]
    elseif ArraySize == 40
        NewArray = new CS_BuildingManagementScript[40]
    endif
    
    return NewArray
EndFunction