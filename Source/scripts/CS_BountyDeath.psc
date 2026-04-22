Scriptname CS_BountyDeath extends ReferenceAlias

Event OnDying(Actor akKiller)
    If Game.GetPlayer().IsInLocation(self.GetActorRef().GetCurrentLocation()) == 1
        GetOwningQuest().SetStage(100)
    EndIf
EndEvent

Event OnCellAttach()
    (GetOwningQuest() as CS_BountyScript).BountyTarget = GetRef()
    (GetOwningQuest() as CS_BountyScript).MoveCommanderToBounty()
EndEvent

Event OnCellDetach()
    If GetActorRef().IsDead() && GetOwningQuest().GetStage() < 100
        GetOwningQuest().SetStage(100)
    EndIf
EndEvent
