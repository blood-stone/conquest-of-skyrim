Scriptname CS_CityEventCitizenScript extends ReferenceAlias  

State WatchPlayerGiveSpeech
    
    Event OnUpdate()
        GetActorRef().EvaluatePackage()
        GetActorRef().SetLookAt(Game.GetPlayer(), true)
    EndEvent
    
EndState

State StopWatchPlayerGiveSpeech
    
    Event OnUpdate()
        GetActorRef().EvaluatePackage()
        GetActorRef().ClearLookAt()
    EndEvent
    
EndState