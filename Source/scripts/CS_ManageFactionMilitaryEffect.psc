Scriptname CS_ManageFactionMilitaryEffect extends activemagiceffect  

CS_FactionMilitaryReportScript Property CS_FactionMilitaryReport Auto

ObjectReference Property CS_FactionPlayer Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    CS_FactionMilitaryReport.Stop()
    CS_FactionMilitaryReport.Start()
    CS_FactionMilitaryReport.Menu(CS_FactionPlayer)
EndEvent