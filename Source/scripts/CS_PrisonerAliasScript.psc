Scriptname CS_PrisonerAliasScript  extends ReferenceAlias

Event OnCellDetach()
    Actor Prisoner = GetActorRef()
    CS_PrisonerQuestScript PrisonerScript = GetOwningQuest() as CS_PrisonerQuestScript
    
    if Prisoner.IsInFaction(PrisonerScript.PrisonerFortFaction)
        Prisoner.MoveToPackageLocation()
    elseif Prisoner.IsInFaction(PrisonerScript.PrisonerASICFaction)
        Prisoner.disable()
    endif
EndEvent

Event OnDetachedFromCell()
    Actor Prisoner = GetActorRef()
    CS_PrisonerQuestScript PrisonerScript = GetOwningQuest() as CS_PrisonerQuestScript
    
    if Prisoner.IsInFaction(PrisonerScript.PrisonerFortFaction)
        Prisoner.MoveToPackageLocation()
    elseif Prisoner.IsInFaction(PrisonerScript.PrisonerASICFaction)
        Prisoner.disable()
    endif
EndEvent