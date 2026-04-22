Scriptname CS_TulliusUlfricSurrenderScript extends Quest  

CS_PrisonScript Property PrisonScript Auto
CS_TransferOwnershipScript Property TransferOwnership Auto

Faction Property CrimeFactionEastmarch Auto
Faction Property CrimeFactionHaafingar Auto
Faction Property JarlCitizenFaction Auto

int Property citynum=-1 Auto

Function SendToPrison(Actor Prisoner)
    PrisonScript.SendToPrison(Prisoner, citynum, spawnguard = true)
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    citynum = aiValue1
    SetStage(0)
EndEvent