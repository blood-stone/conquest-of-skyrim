Scriptname CS_ChooseStewardScript extends Quest  

ReferenceAlias Property Jarl  Auto  
ReferenceAlias Property Steward  Auto  
ReferenceAlias Property Housecarl Auto

LocationAlias Property City  Auto  

ReferenceAlias[] Property GovSteward  Auto
ReferenceAlias[] Property GovHousecarl Auto

FormList Property AllLocations Auto

Function AssignNewSteward(int citynum)
    if Steward.GetActorRef() && !GovSteward[citynum].GetActorRef()
        GovSteward[citynum].ForceRefTo(Steward.GetActorRef())
        ChoseStewardMessage.show()
    endif

    if Housecarl.GetActorRef() && !GovHousecarl[citynum].GetActorRef()
        GovHousecarl[citynum].ForceRefTo(Housecarl.GetActorRef())
        ChoseHousecarlMessage.show()
    endif

    stop()
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
    AssignNewSteward(aiValue1)
EndEvent

Message Property ChoseStewardMessage  Auto  
Message Property ChoseHousecarlMessage  Auto  
