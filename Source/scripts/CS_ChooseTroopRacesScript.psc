Scriptname CS_ChooseTroopRacesScript extends Quest  conditional

Message Property MenuStart Auto
Message Property RaceAdd1 Auto
Message Property RaceAdd2 Auto
Message Property RaceRemove1 Auto
Message Property RaceRemove2 Auto
Message Property GenderAdd Auto
Message Property GenderRemove Auto

ReferenceAlias[] Property AllowedRaces Auto
ReferenceAlias[] Property AllowedGenders Auto

LocationAlias Property FactionName Auto

FormList Property AllowedRacesGlobals Auto
FormList Property AllowedGendersGlobals Auto
FormList Property AllRaces Auto
FormList Property AllowedRacesList Auto

ObjectReference[] Property AllowedRacesObjects Auto
ObjectReference[] Property AllowedGendersObjects Auto
ObjectReference Property NoneObject Auto

int Property NumRaces Auto Conditional hidden
int Property NumGenders Auto Conditional hidden

bool Property ChangeDetected Auto hidden
bool Property Troops Auto hidden
bool Property Settlers Auto hidden

ObjectReference Property CS_FactionPlayer Auto

ObjectReference FactionManagementActivator
CS_FactionManagementEconomy EconomyScript

Function AdjustAliases()
    FactionName.ForceLocationTo((FactionManagementActivator as CS_FactionManagementDiplomacy).FactionName)
    NumRaces = 0
    NumGenders = 0
    int i = 0
    while i < AllowedRaces.Length
        (AllowedRacesGlobals.GetAt(i) as GlobalVariable).SetValue(0)
        AllowedRaces[i].ForceRefTo(NoneObject)
        i += 1
    endwhile
    i = 0
    while i < AllowedGenders.Length
        (AllowedGendersGlobals.GetAt(0) as GlobalVariable).SetValue(0)
        AllowedGenders[i].ForceRefTo(NoneObject)
        i += 1
    endwhile
    
    if Troops && !Settlers
    
        i = 0
        while i < AllowedRacesGlobals.GetSize()
            if EconomyScript.AllowedRaces[i] == 1
                (AllowedRacesGlobals.GetAt(i) as GlobalVariable).SetValue(1)
                AllowedRaces[NumRaces].ForceRefTo(AllowedRacesObjects[i])
                NumRaces += 1
            endif
            i += 1
        endwhile
        
        if EconomyScript.MalesAllowed == 1
            (AllowedGendersGlobals.GetAt(0) as GlobalVariable).SetValue(1)
            AllowedGenders[NumGenders].ForceRefTo(AllowedGendersObjects[0])
            NumGenders += 1
        endif
        
        if EconomyScript.FemalesAllowed == 1
            (AllowedGendersGlobals.GetAt(1) as GlobalVariable).SetValue(1)
            AllowedGenders[NumGenders].ForceRefTo(AllowedGendersObjects[1])
            NumGenders += 1
        endif
        
    elseif Settlers
    
        i = 0
        while i < AllowedRacesGlobals.GetSize()
            if EconomyScript.AllowedRacesSettlers[i] == 1
                (AllowedRacesGlobals.GetAt(i) as GlobalVariable).SetValue(1)
                AllowedRaces[NumRaces].ForceRefTo(AllowedRacesObjects[i])
                NumRaces += 1
            endif
            i += 1
        endwhile
        
        if EconomyScript.MalesAllowedSettlers == 1
            (AllowedGendersGlobals.GetAt(0) as GlobalVariable).SetValue(1)
            AllowedGenders[NumGenders].ForceRefTo(AllowedGendersObjects[0])
            NumGenders += 1
        endif
        
        if EconomyScript.FemalesAllowedSettlers == 1
            (AllowedGendersGlobals.GetAt(1) as GlobalVariable).SetValue(1)
            AllowedGenders[NumGenders].ForceRefTo(AllowedGendersObjects[1])
            NumGenders += 1
        endif
        
    endif
EndFunction

Function StartMenu(bool SetSettlers = true, bool SetTroops = false)
    Start()
    Settlers = SetSettlers
    Troops = SetTroops
    FactionManagementActivator = CS_FactionPlayer
    EconomyScript = FactionManagementActivator as CS_FactionManagementEconomy
    
    AdjustAliases()
    
    int Response
    while Response != 4
        Response = MenuStart.show()
        if Response == 0
            RaceAddMenu()
        elseif Response == 1
            RaceRemoveMenu()
        elseif Response == 2
            GenderAddMenu()
        elseif Response == 3
            GenderRemoveMenu()
        elseif Response == 4
            If ChangeDetected == true
                debug.trace("Updating Troop Races, this may take awhile...")
                debug.notification("Updating Troop Races, this may take awhile...")
                if SetSettlers
                    EconomyScript.UpdateRacesSettlers()
                endif
                
                if SetTroops
                    EconomyScript.UpdateRaces()
                endif
                ;RaceUpdater.ResetTroops()
                ChangeDetected = false
            EndIf
        endif
    endwhile
    
    Stop()
endFunction

Function RaceAddMenu()
    
    int Response
    int pagenum = 1
    
    while Response != 6
        if pagenum == 1
            Response = RaceAdd1.show()
            if Response < 5
                ChangeDetected = true
                (AllowedRacesGlobals.GetAt(Response) as GlobalVariable).SetValue(1)
                if Settlers
                    EconomyScript.AllowedRacesSettlers[Response] = 1
                endif
                
                if Troops
                    EconomyScript.AllowedRaces[Response] = 1
                endif
                AdjustAliases()
            elseif Response == 5
                pagenum = 2
            endif
        elseif pagenum == 2
            Response = RaceAdd2.show()
            if Response == 0
                pagenum = 1
            elseif Response > 0 && Response < 6
                ChangeDetected = true
                (AllowedRacesGlobals.GetAt(Response + 4) as GlobalVariable).SetValue(1)
                if Settlers
                    EconomyScript.AllowedRacesSettlers[Response + 4] = 1
                endif
                
                if Troops
                    EconomyScript.AllowedRaces[Response + 4] = 1
                endif
                AdjustAliases()
            endif
        endif
    endwhile
endFunction

Function RaceRemoveMenu()
    
    int Response
    int pagenum = 1
    
    while Response != 6
        if pagenum == 1
            Response = RaceRemove1.show()
            if Response < 5
                ChangeDetected = true
                (AllowedRacesGlobals.GetAt(Response) as GlobalVariable).SetValue(0)
                if Settlers
                    EconomyScript.AllowedRacesSettlers[Response] = 0
                endif
                
                if Troops
                    EconomyScript.AllowedRaces[Response] = 0
                endif
                AdjustAliases()
            elseif Response == 5
                pagenum = 2
            endif
        elseif pagenum == 2
            Response = RaceRemove2.show()
            if Response == 0
                pagenum = 1
            elseif Response > 0 && Response < 6
                ChangeDetected = true
                (AllowedRacesGlobals.GetAt(Response + 4) as GlobalVariable).SetValue(0)
                if Settlers
                    EconomyScript.AllowedRacesSettlers[Response + 4] = 0
                endif
                
                if Troops
                    EconomyScript.AllowedRaces[Response + 4] = 0
                endif
                AdjustAliases()
            endif
        endif
    endwhile
endFunction

Function GenderAddMenu()
    
    int Response
    while Response != 2
        Response = GenderAdd.show()
        if Response == 0
            ChangeDetected = true
            (AllowedGendersGlobals.GetAt(0) as GlobalVariable).SetValue(1)
            if Settlers
                EconomyScript.MalesAllowedSettlers = 1
            endif
            
            if Troops
                EconomyScript.MalesAllowed = 1
            endif
            AdjustAliases()
        elseif Response == 1
            ChangeDetected = true
            (AllowedGendersGlobals.GetAt(1) as GlobalVariable).SetValue(1)
            if Settlers
                EconomyScript.FemalesAllowedSettlers = 1
            endif
            
            if Troops
                EconomyScript.FemalesAllowed = 1
            endif
            AdjustAliases()
        endif
    endwhile
endFunction

Function GenderRemoveMenu()
    
    int Response
    while Response != 2
        Response = GenderRemove.show()
        if Response == 0
            ChangeDetected = true
            (AllowedGendersGlobals.GetAt(0) as GlobalVariable).SetValue(0)
            if Settlers
                EconomyScript.MalesAllowedSettlers = 0
            endif
            
            if Troops
                EconomyScript.MalesAllowed = 0
            endif
            AdjustAliases()
        elseif Response == 1
            ChangeDetected = true
            (AllowedGendersGlobals.GetAt(1) as GlobalVariable).SetValue(0)
            if Settlers
                EconomyScript.FemalesAllowedSettlers = 0
            endif
            
            if Troops
                EconomyScript.FemalesAllowed = 0
            endif
            AdjustAliases()
        endif
    endwhile
endFunction