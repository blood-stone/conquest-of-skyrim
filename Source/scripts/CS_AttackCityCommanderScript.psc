Scriptname CS_AttackCityCommanderScript extends ReferenceAlias  

CS_AttackCitySiegeCommanderScript Property SiegeCommander Auto 

Event OnInIt()
    if SiegeCommander.GetActorRef()
        ForceRefTo(SiegeCommander.GetActorRef())
    endif
EndEvent