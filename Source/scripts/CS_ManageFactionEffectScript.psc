Scriptname CS_ManageFactionEffectScript extends activemagiceffect  

CS_FactionEconomyReportScript Property CS_FactionEconomyReport Auto

ReferenceAlias Property FactionManagementActivator Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    CS_FactionEconomyReport.Stop()
    CS_FactionEconomyReport.Start()
    CS_FactionEconomyReport.Menu(FactionManagementActivator.GetRef())
EndEvent