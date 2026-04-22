Scriptname CS_DefendCampStartScript extends Quest  

int Property enemyfactionnum Auto

ReferenceAlias Property CampMarker Auto

LocationAlias Property Hold Auto

Keyword Property StoryDefendCamp Auto

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    enemyfactionnum = aiValue1
EndEvent

Function StartDefenseQuest()
    StoryDefendCamp.SendStoryEvent(akLoc = Hold.GetLocation(), akRef1 = CampMarker.GetRef(), aiValue1 = enemyfactionnum, aiValue2 = 1)
EndFunction