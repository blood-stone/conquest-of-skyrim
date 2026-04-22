Scriptname CS_AttackerAliasDeath extends ReferenceAlias  

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
  if (akTarget == Game.GetPlayer())
    if (aeCombatState == 1)
      CombatStarted.SetValue(1)
    endIf
  endIf
endEvent

GlobalVariable Property combatStarted  Auto  
