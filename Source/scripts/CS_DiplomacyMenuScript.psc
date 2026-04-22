Scriptname CS_DiplomacyMenuScript extends Quest  

Message Property CS_DiplomacyMenuStart Auto
Message Property CS_DiplomacyMenuFaction Auto

ReferenceAlias[] Property Factions Auto
ReferenceAlias Property ChosenFaction Auto

ObjectReference[] Property FactionNameRefs Auto
ObjectReference Property NoneObject Auto

GlobalVariable Property CS_DiplomacyRelationNum Auto

CS_PublicOpinionScript Property PublicOpinionScript Auto

Function SetUp()
    int i = 0
    while i < Factions.Length
        if FactionNameRefs[i]
            Factions[i].ForceRefTo(FactionNameRefs[i])
        else
            Factions[i].ForceRefTo(NoneObject)
        endif
        i += 1
    endwhile
EndFunction

Function MenuStart(int Response = 0)
    SetUp()
    Response = CS_DiplomacyMenuStart.show()
    if Response < 2
        MenuFaction(Response)
    endif
    Stop()
EndFunction
    
Function MenuFaction(int factionnum, int Response = 0)
    ChosenFaction.ForceRefTo(Factions[factionnum].GetRef())
    int actualfactionnum = factionnum + 11
    CS_DiplomacyRelationNum.SetValue(PublicOpinionScript.GetFactionOpinionOfActor(Game.GetPlayer(), actualfactionnum))
    UpdateCurrentInstanceGlobal(CS_DiplomacyRelationNum)
    Response = CS_DiplomacyMenuFaction.show()
EndFunction