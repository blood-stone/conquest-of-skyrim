Scriptname CS_CommonWarFunctions extends Form Hidden

import CS_CommonFunctions

ObjectReference[] Function CallAlliesToWar(ObjectReference WarLeader) global
    CS_FactionManagementDiplomacy DiplomacyScript = WarLeader as CS_FactionManagementDiplomacy
    ObjectReference[] WarAllies
    
    int i = 0
    while i < DiplomacyScript.Alliances.Length
        ObjectReference NewAlly = CallAllyToWar(DiplomacyScript.Alliances[i])
        if NewAlly
            WarAllies = AddToArray(NewAlly, WarAllies)
        endif
        i += 1
    endwhile
    
    return WarAllies
EndFunction

ObjectReference Function CallAllyToWar(ObjectReference Ally) global
    if (Ally as CS_FactionManagementOwnership).Leader == Game.GetPlayer()
       ;Send CallToWar Message
       return Ally
    else
       ;Calculate decision to join war
       return Ally
    endif
EndFunction 

ObjectReference[] Function CallVassalsToWar(ObjectReference WarLeader) global
    CS_FactionManagementDiplomacy DiplomacyScript = WarLeader as CS_FactionManagementDiplomacy
    ObjectReference[] WarVassals
    
    int i = 0
    while i < DiplomacyScript.Vassals.Length
        ObjectReference NewVassalAlly = CallVassalToWar(DiplomacyScript.Vassals[i])
        if NewVassalAlly
            WarVassals = AddToArray(NewVassalAlly, WarVassals)
        endif
        i += 1
    endwhile
    
    return WarVassals
EndFunction

ObjectReference Function CallVassalToWar(ObjectReference Vassal) global
    if (Vassal as CS_FactionManagementOwnership).Leader == Game.GetPlayer()
       ;Send CallToWar Message
       return Vassal
    else
       return Vassal
    endif
EndFunction

ObjectReference[] Function GetAlliedHoldings(string holdingtype, ObjectReference WarLeader, ObjectReference[] WarVassals, ObjectReference[] WarAllies) global
    ObjectReference[] Holdings
    
    if holdingtype == "Cities"
        ObjectReference[] WarLeaderHoldings
        WarLeaderHoldings = (WarLeader as CS_FactionManagementEconomy).Cities
        int i = 0
        while i < WarLeaderHoldings.Length
            Holdings = AddToArray(WarLeaderHoldings[i], Holdings)
            i += 1
        endwhile
        
        i = 0
        while i < WarVassals.Length
            ObjectReference WarVassal = WarVassals[i]
            ObjectReference[] WarVassalHoldings = (WarVassal as CS_FactionManagementEconomy).Cities
            int index = 0
            while index < WarVassalHoldings.Length
                Holdings = AddToArray(WarVassalHoldings[index], Holdings)
                index += 1
            endwhile
            i += 1
        endwhile
        
        i = 0
        while i < WarAllies.Length
            ObjectReference WarAlly = WarAllies[i]
            ObjectReference[] WarAllyHoldings = (WarAlly as CS_FactionManagementEconomy).Cities
            int index = 0
            while index < WarAllyHoldings.Length
                Holdings = AddToArray(WarAllyHoldings[index], Holdings)
                index += 1
            endwhile
            i += 1
        endwhile
    elseif holdingtype == "Villages"
        ObjectReference[] WarLeaderHoldings
        WarLeaderHoldings = (WarLeader as CS_FactionManagementEconomy).Villages
        int i = 0
        while i < WarLeaderHoldings.Length
            Holdings = AddToArray(WarLeaderHoldings[i], Holdings)
            i += 1
        endwhile
        
        i = 0
        while i < WarVassals.Length
            ObjectReference WarVassal = WarVassals[i]
            ObjectReference[] WarVassalHoldings = (WarVassal as CS_FactionManagementEconomy).Villages
            int index = 0
            while index < WarVassalHoldings.Length
                Holdings = AddToArray(WarVassalHoldings[index], Holdings)
                index += 1
            endwhile
            i += 1
        endwhile
        
        i = 0
        while i < WarAllies.Length
            ObjectReference WarAlly = WarAllies[i]
            ObjectReference[] WarAllyHoldings = (WarAlly as CS_FactionManagementEconomy).Villages
            int index = 0
            while index < WarAllyHoldings.Length
                Holdings = AddToArray(WarAllyHoldings[index], Holdings)
                index += 1
            endwhile
            i += 1
        endwhile
    elseif holdingtype == "Settlements"
        ObjectReference[] WarLeaderHoldings
        WarLeaderHoldings = (WarLeader as CS_FactionManagementEconomy).Settlements
        int i = 0
        while i < WarLeaderHoldings.Length
            Holdings = AddToArray(WarLeaderHoldings[i], Holdings)
            i += 1
        endwhile
        
        i = 0
        while i < WarVassals.Length
            ObjectReference WarVassal = WarVassals[i]
            ObjectReference[] WarVassalHoldings = (WarVassal as CS_FactionManagementEconomy).Settlements
            int index = 0
            while index < WarVassalHoldings.Length
                Holdings = AddToArray(WarVassalHoldings[index], Holdings)
                index += 1
            endwhile
            i += 1
        endwhile
        
        i = 0
        while i < WarAllies.Length
            ObjectReference WarAlly = WarAllies[i]
            ObjectReference[] WarAllyHoldings = (WarAlly as CS_FactionManagementEconomy).Settlements
            int index = 0
            while index < WarAllyHoldings.Length
                Holdings = AddToArray(WarAllyHoldings[index], Holdings)
                index += 1
            endwhile
            i += 1
        endwhile
    endif
    
    return Holdings
EndFunction

int Function IsPlayerInWar(ObjectReference PlayerFaction, ObjectReference WarLeader, ObjectReference[] Allies, ObjectReference[] Vassals) global

    if WarLeader == PlayerFaction || Allies.Find(PlayerFaction) >= 0 || Vassals.Find(PlayerFaction) >= 0
        return 1
    else
        return 0
    endif
    
EndFunction