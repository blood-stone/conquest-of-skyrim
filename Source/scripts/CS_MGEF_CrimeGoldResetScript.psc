Scriptname CS_MGEF_CrimeGoldResetScript extends activemagiceffect  

Faction Property CrimeFaction Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    CrimeFaction.SetCrimeGold(0)
    CrimeFaction.SetCrimeGoldViolent(0)
    CrimeFaction.SetPlayerEnemy(false)
    debug.notification("You own this hold... bounty reset to 0")
    Utility.Wait(1)
    if akTarget.IsInCombat() && akTarget.GetCombatTarget().IsInFaction(CrimeFaction)
        akTarget.GetCombatTarget().StopCombat()
        Game.GetPlayer().StopCombat()
    endif
EndEvent