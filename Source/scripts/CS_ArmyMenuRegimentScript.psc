Scriptname CS_ArmyMenuRegimentScript extends Quest  

LocationAlias Property City Auto
LocationAlias Property RegimentLocation Auto

ReferenceAlias Property Commander Auto

ObjectReference Property NoneObject Auto

Message Property CS_ArmyMenuMessageRegiment Auto

CS_RegimentScript RegimentScript

Function SetUp(Quest RegimentQuest)
    RegimentScript = RegimentQuest as CS_RegimentScript
    
    City.ForceLocationTo(RegimentScript.BaseLocation.GetLocation())
    
    if RegimentScript.Commander.GetActorRef()
        Commander.ForceRefTo(RegimentScript.Commander.GetActorRef())
    else
        Commander.ForceRefTo(NoneObject)
    endif
EndFunction

Function MenuStart(Quest RegimentQuest, int Response = 0)
    SetUp(RegimentQuest)
    
    int TroopCount = RegimentScript.TroopCount
    
    Response = CS_ArmyMenuMessageRegiment.show(TroopCount)
EndFunction