Scriptname CS_KillActorScript extends ReferenceAlias  

CS_EconomyHoldUpdaterNewScript[] Property EconomyHoldUpdaters Auto

FormList Property CS_AllCrimeFactions Auto
FormList Property CS_Nobility Auto

Event OnInIt();/
    if GetActorRef()
        int i = 0
        while i < CS_AllCrimeFactions.GetSize()
            debug.trace("Checking crime faction " + i)
            if GetActorRef().IsInFaction(CS_AllCrimeFactions.GetAt(i) as Faction)
                EconomyHoldUpdaters[i].Population = EconomyHoldUpdaters[i].Population - 1
                
                if CS_Nobility.HasForm(GetActorRef())
                    EconomyHoldUpdaters[i].PopulationNobility = EconomyHoldUpdaters[i].PopulationNobility - 1
                else
                    EconomyHoldUpdaters[i].PopulationCommoner = EconomyHoldUpdaters[i].PopulationCommoner - 1
                endif
                
                if GetActorRef().IsGuard()
                    EconomyHoldUpdaters[i].Guards = EconomyHoldUpdaters[i].Guards - 1
                endif/;
                GetOwningQuest().Stop();/
                return
            endif
            i += 1
        endwhile
    endif/;
EndEvent