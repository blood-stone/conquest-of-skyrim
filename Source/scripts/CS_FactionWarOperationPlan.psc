Scriptname CS_FactionWarOperationPlan extends ObjectReference  

import CS_CommonFunctions

ObjectReference[] Property Regiments Auto

int Property AggressorMultiplier Auto

ObjectReference Property WarActivator Auto
ObjectReference Property OperationFaction Auto
ObjectReference Property TargetFaction Auto

Keyword Property OperationKeyword Auto ; StoryEvent Sent from this keyword triggers operation quest

MiscObject[] Property OperationTacticsTemplate Auto

ObjectReference[] Property OperationTactics Auto
ObjectReference Property CurrentTactic Auto

ObjectReference Property BattleSpace Auto
ObjectReference Property CurrentLocation Auto
ObjectReference Property OpsTarget Auto

int Property Recurring Auto

Function SetUpTactics()
    int i = 0
    while i < OperationTacticsTemplate.Length
        ObjectReference Tactic = PlaceAtMe(OperationTacticsTemplate[i])
        (Tactic as CS_FactionWarTacticScript).OpsPlan = self
        OperationTactics = AddToArray(Tactic, OperationTactics)
        i += 1
    endwhile
    
    CurrentTactic = OperationTactics[0]
    CurrentTactic.RegisterForSingleUpdate(0.1)
    RegisterForUpdateGameTime(1)
EndFunction

Function FinishCurrentTactic()
    OperationTactics = RemoveFromArray(CurrentTactic, OperationTactics)
    ObjectReference OldCurrentTactic = CurrentTactic
    
    if OperationTactics && OperationTactics[0]
        CurrentTactic = OperationTactics[0]
    else
        CurrentTactic = None
        UnRegisterForUpdateGameTime()
        if AggressorMultiplier == 1
            (WarActivator as CS_FactionWarAggressorScript).CompleteOpsPlan(self as ObjectReference)
        elseif AggressorMultiplier == -1
            (WarActivator as CS_FactionWarDefenderScript).CompleteOpsPlan(self as ObjectReference)
        endif
        debug.trace("Operation Complete!")
        if Recurring == 1
            SetUpTactics()
        else
            delete()
        endif
    endif
    OldCurrentTactic.delete()
EndFunction

Function DeleteCurrentTactics()
    ObjectReference OldCurrentTactic = CurrentTactic
    CurrentTactic = None
    OldCurrentTactic.delete()
    
    ObjectReference[] CurrentTactics = GetEqualObjectReferenceArray(OperationTactics)
    int i = 0
    while i < OperationTactics.Length
        OperationTactics[i] = None
        CurrentTactics[i].delete()
        i += 1
    endwhile
    
    ObjectReference[] EmptyArray
    OperationTactics = EmptyArray
EndFunction

Function ResetTactics()
    DeleteCurrentTactics()
    SetUpTactics()
EndFunction

State UnderAttack
    
    Event OnUpdateGameTime()
        debug.trace("Operation Update Triggered but under attack... ignoring update")
    EndEvent
    
EndState

Event OnUpdateGameTime()
    debug.trace("Operation Update Triggered")
    CurrentTactic.RegisterForSingleUpdate(0.1)
EndEvent