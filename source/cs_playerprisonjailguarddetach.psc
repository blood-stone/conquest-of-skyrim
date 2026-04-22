Scriptname CS_PlayerPrisonJailGuardDetach extends ReferenceAlias  

Event OnDetachedFromCell()
    if GetOwningQuest().GetStage() == 10
        (GetOwningQuest() as CS_PlayerPrisonScript).MoveToTrialMarker()
    else
        Game.GetPlayer().MoveTo(GetActorRef())
    endif
    Game.GetPlayer().EvaluatePackage()
EndEvent

Event OnCellDetach()
    if GetOwningQuest().GetStage() == 100
        GetActorRef().delete()
    endif
EndEvent