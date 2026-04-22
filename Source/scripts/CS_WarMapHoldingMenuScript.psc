Scriptname CS_WarMapHoldingMenuScript extends Quest  

Message Property CS_WarMapHoldingMenuStart Auto

ReferenceAlias Property Holding Auto
ReferenceAlias Property HoldingFaction Auto

LocationAlias Property HoldingLoc Auto
LocationAlias Property HoldingFactionLoc Auto

Function MenuStart()
    ObjectReference FactionOwner = (Holding.GetRef() as CS_FactionWarLocationScript).ControllingFaction
    HoldingFaction.ForceRefTo(FactionOwner)
    
    HoldingLoc.ForceLocationTo((Holding.GetRef() as CS_FactionWarLocationScript).VanillaLocation)
    HoldingFactionLoc.ForceLocationTo((HoldingFaction.GetRef() as CS_FactionManagementDiplomacy).FactionName)
    
    ObjectReference[] DefendingRegiments = (Holding.GetRef() as CS_FactionWarLocationScript).DefendingRegiments
    int DefendingTroops
    int i = 0
    while i < DefendingRegiments.Length
        DefendingTroops += (DefendingRegiments[i] as CS_FactionWarAIRegimentScript).TroopCount
        i += 1
    endwhile
    
    CS_WarMapHoldingMenuStart.show(DefendingRegiments.Length, DefendingTroops)
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
    MenuStart()
EndEvent