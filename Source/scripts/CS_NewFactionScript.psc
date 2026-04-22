Scriptname CS_NewFactionScript extends Quest  

ReferenceAlias Property Leader Auto
LocationAlias Property Capital Auto

ReferenceAlias[] Property Activators Auto

ObjectReference Property FactionManagementActivator Auto
ObjectReference Property FactionOwner Auto

Function StartFaction(Actor LeaderActor)
    (FactionManagementActivator as CS_FactionManagementEconomy).FormFaction(FactionOwner, LeaderActor)
    Leader.ForceRefTo(LeaderActor)
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
    FactionManagementActivator = akRef1
    FactionOwner = akRef2
    CS_FactionManagementEconomy EconomyScript = FactionManagementActivator as CS_FactionManagementEconomy
    
    int totalholdings = 0
    
    if EconomyScript.Cities
        int i = 0
        while i < EconomyScript.Cities.Length
            Activators[totalholdings].ForceRefTo(EconomyScript.Cities[i])
            totalholdings += 1
            i += 1
        endwhile
    endif
    
    if EconomyScript.Villages
        int i = 0
        while i < EconomyScript.Villages.Length
            Activators[totalholdings].ForceRefTo(EconomyScript.Villages[i])
            totalholdings += 1
            i += 1
        endwhile
    endif
    
    if EconomyScript.Settlements
        int i = 0
        while i < EconomyScript.Settlements.Length
            Activators[totalholdings].ForceRefTo(EconomyScript.Settlements[i])
            totalholdings += 1
            i += 1
        endwhile
    endif
EndEvent