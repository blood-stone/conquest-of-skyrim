Scriptname CS_PlayerArmyForgiveScript extends Actor

Faction Property CS_PlayerArmyFaction Auto
Faction Property CS_PlayerArmyCommanders Auto
Faction Property CS_PrisonerFaction Auto

;Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
;    if aeCombatState == 1 || aeCombatState == 2
;        if akTarget.IsInFaction(CS_PlayerArmyFaction) || akTarget.IsInFaction(CS_PlayerArmyCommanders) || akTarget.IsInFaction(CS_PrisonerFaction) || akTarget == Game.GetPlayer()
;            StopCombat()
;        endif
;    endif
;EndEvent