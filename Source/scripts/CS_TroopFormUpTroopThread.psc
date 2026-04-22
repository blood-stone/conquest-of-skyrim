Scriptname CS_TroopFormUpTroopThread extends ReferenceAlias  

int Property XOffset Auto
int Property YOffset Auto

Actor Property PlayerRef Auto

WorldSpace Property Tamriel Auto

int Property InteriorTroop Auto

State Filled

EndState

State TeleportToCommander
    
    Event OnUpdate()
        GoToState("TeleportingToCommander")
        Actor Commander = (GetOwningQuest() as CS_TroopFormUpScript).Commander.GetActorRef()
        if GetActorRef()
            if InteriorTroop == 1
                GetActorRef().MoveTo(Commander, XOffset, YOffset)
            elseif InteriorTroop == 0 && PlayerRef.GetWorldSpace() == Tamriel
                GetActorRef().MoveTo(Commander, XOffset, YOffset)
            endif
        endif
        GoToState("Filled")
    EndEvent
    
EndState

State TeleportToPlayer
    
    Event OnUpdate()
        ;GoToState("TeleportingToPlayer")
        if GetActorRef() && !GetActorRef().IsDead() && !GetActorRef().Is3DLoaded()
            if InteriorTroop == 1
                debug.trace("Teleporting Interior Troop to Player")
                GetActorRef().MoveTo(PlayerRef, XOffset, YOffset)
            elseif InteriorTroop == 0 && PlayerRef.GetWorldSpace() == Tamriel
                debug.trace("Teleporting Exterior Troop to Player")
                GetActorRef().MoveTo(PlayerRef, XOffset, YOffset)
            endif
        endif
        GoToState("Filled")
    EndEvent
    
EndState

State EvaluateTroopPackage
    
    Event OnUpdate()
        if GetActorRef()
            GetActorRef().EvaluatePackage()
        endif
        GoToState("Filled")
    EndEvent
    
EndState

State ClearFormation
    
    Event OnUpdate()
        if GetActorRef()
            GetActorRef().EvaluatePackage()
            GetActorRef().ClearKeepOffsetFromActor()
            utility.wait(0.1)
            GetActorRef().ClearKeepOffsetFromActor()
            utility.wait(0.1)
            GetActorRef().ClearKeepOffsetFromActor()
            ;Clear()
        endif
        GoToState("Filled")
    EndEvent
    
EndState
;/
Event OnDetachedFromCell()
    Game.GetPlayer().MoveTo(GetActorRef())
EndEvent/;