Scriptname CS_TroopFormUpCommanderThread extends ReferenceAlias  

Actor Property PlayerRef Auto

State TeleportToPlayer
    
    Event OnUpdate()
        if !GetActorRef().Is3DLoaded()
            GetActorRef().MoveTo(PlayerRef, 60, 0)
        endif
    EndEvent
    
EndState

State EvaluateTroopPackage
    
    Event OnUpdate()
        GetActorRef().EvaluatePackage()
    EndEvent
    
EndState

State ClearFormation
    
    Event OnUpdate()
        GetActorRef().ClearKeepOffsetFromActor()
        GetActorRef().EvaluatePackage()
    EndEvent
    
EndState

Event OnUnload()
    
    (GetOwningQuest() as CS_TroopFormUpScript).MoveArmyToPlayer()
    
EndEvent