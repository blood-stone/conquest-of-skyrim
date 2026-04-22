Scriptname CS_XBOXNameScript extends Quest  

ReferenceAlias[] Property NameCharacters Auto

ObjectReference Property NoneObject Auto

FormList Property CS_XBOXNameLetters_01_Lower Auto
FormList Property CS_XBOXNameLetters_02_Lower Auto
FormList Property CS_XBOXNameLetters_03_Lower Auto
FormList Property CS_XBOXNameLetters_04_Lower Auto

Message Property CS_XBOXNameKeyboardStart Auto
FormList Property CS_XboxKeyboardLetters_Lower Auto

Function ClearAllLetters()
    int i = 0
    while i < NameCharacters.Length
        NameCharacters[i].ForceRefTo(NoneObject)
        i += 1
    endwhile
EndFunction

Function CS_XboxKeyboardStart(int Response = 0)
    ClearAllLetters()
    bool InMenu = true
    int characternum = 0
    int menunum = -1
    
    while InMenu
        if menunum == -1
            menunum = CS_XBOXNameKeyboardStart.show()
        else
            Response = (CS_XboxKeyboardLetters_Lower.GetAt(menunum) as Message).show()
        
            if menunum == 0
                if Response < 7
                    NameCharacters[characternum].ForceRefTo(CS_XBOXNameLetters_01_Lower.GetAt(Response) as ObjectReference)
                    characternum += 1
                elseif Response == 9
                    menunum = -1
                endif
            elseif menunum == 1
                if Response < 7
                    NameCharacters[characternum].ForceRefTo(CS_XBOXNameLetters_02_Lower.GetAt(Response) as ObjectReference)
                    characternum += 1
                elseif Response == 9
                    menunum = -1
                endif
            elseif menunum == 2
                if Response < 7
                    NameCharacters[characternum].ForceRefTo(CS_XBOXNameLetters_03_Lower.GetAt(Response) as ObjectReference)
                    characternum += 1
                elseif Response == 9
                    menunum = -1
                endif
            elseif menunum == 3
                if Response < 5
                    NameCharacters[characternum].ForceRefTo(CS_XBOXNameLetters_04_Lower.GetAt(Response) as ObjectReference)
                    characternum += 1
                elseif Response == 7
                    menunum = -1
                endif
            endif
        endif
        
        if menunum == 6
            InMenu = false
        endif
    endwhile
        
EndFunction