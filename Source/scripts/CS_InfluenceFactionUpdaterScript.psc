Scriptname CS_InfluenceFactionUpdaterScript extends Quest  

Location Property FactionLoc Auto

int Property factionnum Auto

int Property InfluenceLeader Auto
int Property InfluenceArmy Auto

int[] Property LeaderInfluenceJarls Auto
int Property LeaderInfluenceArmy Auto

FormList Property CS_AllHoldings Auto

Function SetInitialInfluence()
    int i = 0
    while i < 9
        if (CS_AllHoldings.GetAt(i) as GlobalVariable).GetValue() == factionnum
            LeaderInfluenceJarls[i] = 50
        endif
        i += 1
    endwhile
    
    LeaderInfluenceArmy = 50
EndFunction

Function AdjustLeaderInfluence(string group, int amount, int citynum = -1)
    if group == "Jarl"
        LeaderInfluenceJarls[citynum] = LeaderInfluenceJarls[citynum] + amount
    elseif group == "Army"
        LeaderInfluenceArmy += amount
    endif
EndFunction