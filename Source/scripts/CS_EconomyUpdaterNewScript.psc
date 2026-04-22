Scriptname CS_EconomyUpdaterNewScript extends Quest  

Quest Property CS_EconomyReportNew Auto
Quest Property CS_EconomyReportNewCity Auto
Quest Property CS_CityManagementReport Auto

GlobalVariable Property CS_EconReportUpdatingEconomy Auto
GlobalVariable Property GameDaysPassed Auto

float Property NextUpdate Auto

LocationAlias Property TextCity Auto

Location Property CS_TroopsAndMovementsDataImperial Auto
Location Property CS_TroopsAndMovementsDataSons Auto

FormList Property CS_AllHoldings Auto
FormList Property CS_GlobalDemands Auto
FormList Property CS_FactionActivatorsMajor Auto

bool[] Property NeedsUpdate Auto

;CS_TMScript[] Property TMScripts Auto

ObjectReference[] Property CityManagements Auto
ObjectReference[] Property HoldManagements Auto
ObjectReference[] Property FactionManagements Auto

int Property FoodCost Auto
int Property MetalCost Auto
int Property WoodCost Auto

int Property UpdatePhase Auto
int Property UpdateNum Auto ; DELETE WHEN DONE!!!!!!!!

Function SetUp()
    GoToState("SettingUp")
    debug.trace("Starting economy setup")
    int i = 0;/
    while i < FactionManagements.Length
        (FactionManagements[0] as CS_FactionManagementMilitary).SetUp()
        i += 1
    endwhile/;
    
    i = 0
    while i < FactionManagements.Length
        FactionManagements[i].RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
    
    i = 0
    int loopnum = 0
    while i < FactionManagements.Length && loopnum < 100
        if (FactionManagements[i] as CS_FactionManagementMajorSetUp).GetState() == "NotSetUp"
            utility.wait(1)
            i = 0
            loopnum += 1
        else
            i += 1
        endif
    endwhile;/
    
    i = 0
    while i < HoldManagements.Length
        (HoldManagements[i] as CS_FactionManagementEconomy).GoToState("NotSetUp")
        (HoldManagements[i] as CS_FactionManagementMilitary).SetUp()
        HoldManagements[i].RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
    
    i = 0
    loopnum = 0
    while i < HoldManagements.Length && loopnum < 100
        if (HoldManagements[i] as CS_FactionManagementEconomy).GetState() == "NotSetUp"
            utility.wait(0.5)
            i = 0
            loopnum += 1
        else
            i += 1
        endif
    endwhile/;
    
    ;UpdateEconomy(true)
    ;(FactionManagements[0] as CS_FactionManagementDiplomacy).StartWar(FactionManagements[1])
    
    debug.notification("Economy Set Up Complete!")
    debug.trace("Economy Set Up Complete!")
    
    RegisterForSingleUpdateGameTime(1)
    GoToState("SetUp")
EndFunction

Function UpdateEconomy(bool forcedaily=false)
    debug.trace("Economy Update Started...")
    CS_EconReportUpdatingEconomy.SetValue(1)
    UpdateNum += 1
    
    if GameDaysPassed.GetValue() >= NextUpdate || forcedaily
        NextUpdate = math.floor(GameDaysPassed.GetValue()) + 1
        debug.notification("Economy adding changes...")
        UpdatePhase = 7
    else
        UpdatePhase = 6
    endif
    
    RegisterForHoldUpdate()
    
    CS_EconReportUpdatingEconomy.SetValue(0)
    debug.notification("Economy Updated")
    debug.trace("Economy Updated")
EndFunction

Function RegisterForHoldUpdate()
    
    int i = 0
    while i < CS_FactionActivatorsMajor.GetSize()
        ObjectReference MajorFaction = CS_FactionActivatorsMajor.GetAt(i) as ObjectReference
        if UpdatePhase == 6
            (MajorFaction as CS_FactionManagementDiplomacy).GoToState("Hourly")
            (MajorFaction as CS_FactionManagementEconomy).GoToState("Hourly")
        elseif UpdatePhase == 7
            (MajorFaction as CS_FactionManagementDiplomacy).GoToState("Daily")
            (MajorFaction as CS_FactionManagementEconomy).GoToState("Daily")
        endif
        
        MajorFaction.RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
    
    i = 0
    int loopnum = 0
    while i < CS_FactionActivatorsMajor.GetSize() && loopnum < 50
        ObjectReference MajorFaction = CS_FactionActivatorsMajor.GetAt(i) as ObjectReference
        if (MajorFaction as CS_FactionManagementDiplomacy).GetState() != "Updated"
            utility.wait(0.1)
            i = 0
            loopnum += 1
        else
            i += 1
        endif
    endwhile
    
    ObjectReference PlayerFaction = CS_FactionActivatorsMajor.GetAt(0) as ObjectReference
    loopnum = 0
    while (PlayerFaction as CS_FactionManagementEconomy).GetState() != "Updated" && loopnum < 50
        utility.wait(0.1)
        loopnum += 1
    endwhile
    ;utility.wait(3)
EndFunction

Event OnUpdateGameTime()
    UpdateEconomy()
    ;CS_CityManagementReport.Start()
    RegisterForSingleUpdateGameTime(1)
EndEvent