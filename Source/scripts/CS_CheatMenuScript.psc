Scriptname CS_CheatMenuScript extends Quest  

CS_TransferOwnershipScript Property TransferOwnership Auto
CS_TMScript Property TMPlayer Auto
CS_TMScript Property TMImps Auto
CS_TMScript Property TMSons Auto

FormList Property AllHoldings Auto
FormList Property AllHoldingsFort Auto

Quest Property AttackCity Auto
Quest Property AttackCamp Auto
Quest Property AttackFort Auto
Quest Property DefendCityImp Auto
Quest Property DefendCampImp Auto
Quest Property DefendFortImp Auto
Quest Property DefendCitySons Auto
Quest Property DefendCampSons Auto
Quest Property DefendFortSons Auto

Message Property StartMessage Auto
Message Property HoldingsMessage Auto
Message Property HoldingsCities1Message Auto
Message Property HoldingsCities2Message Auto
Message Property HoldingsForts1Message Auto
Message Property HoldingsForts2Message Auto
Message Property BattlesMessage Auto

Function MenuStart(int Response=0)
    Response = StartMessage.show()
    if Response == 0
        MenuHoldings()
    elseif Response == 1
        MenuBattles()
    endif
EndFunction

Function MenuHoldings(int Response=0)
    Response = HoldingsMessage.show()
    if Response == 0
        MenuHoldingsCities1()
    elseif Response == 1
        MenuHoldingsForts1()
    elseif Response == 2
        MenuStart()
    endif
EndFunction

Function MenuHoldingsCities1(int Response=0)
    Response = HoldingsCities1Message.show()
    if Response < 5
        debug.notification("Transferring Holding, please wait...")
        int factionnum = (AllHoldings.GetAt(Response) as GlobalVariable).GetValueInt()
        TransferOwnership.TransferOwnershipCity(Response, 69)
        debug.notification("Holding transferred!")
        if factionnum == 11
            TMImps.LoseLandSuperiority(Response)
        elseif factionnum == 12
            TMSons.LoseLandSuperiority(Response)
        endif
    elseif Response == 5
        MenuHoldingsCities2()
    elseif Response == 6
        MenuHoldings()
    endif
EndFunction

Function MenuHoldingsCities2(int Response=0)
    Response = HoldingsCities2Message.show()
    if Response == 0
        MenuHoldingsCities2()
    elseif Response > 0 && Response < 5
        debug.notification("Transferring Holding, please wait...")
        int factionnum = (AllHoldings.GetAt(Response + 4) as GlobalVariable).GetValueInt()
        TransferOwnership.TransferOwnershipCity(Response + 4, 69)
        debug.notification("Holding transferred!")
        if factionnum == 11
            TMImps.LoseLandSuperiority(Response + 4)
        elseif factionnum == 12
            TMSons.LoseLandSuperiority(Response + 4)
        endif
    elseif Response == 5
        MenuHoldings()
    endif
EndFunction

Function MenuHoldingsForts1(int Response=0)
    Response = HoldingsForts1Message.show()
    if Response < 5
        debug.notification("Transferring Holding, please wait...")
        int factionnum = (AllHoldingsFort.GetAt(Response) as GlobalVariable).GetValueInt()
        TransferOwnership.TransferOwnershipFort(Response, 1)
        if factionnum == 11
            TMImps.DisplayInvasionObjectives(Response)
        elseif factionnum == 12
            TMSons.DisplayInvasionObjectives(Response)
        endif
        debug.notification("Holding transferred!")
    elseif Response == 5
        MenuHoldingsForts2()
    elseif Response == 6
        MenuHoldings()
    endif
EndFunction

Function MenuHoldingsForts2(int Response=0)
    Response = HoldingsForts2Message.show()
    if Response == 0
        MenuHoldingsForts2()
    elseif Response > 0 && Response < 5
        debug.notification("Transferring Holding, please wait...")
        int factionnum = (AllHoldingsFort.GetAt(Response + 4) as GlobalVariable).GetValueInt()
        TransferOwnership.TransferOwnershipFort(Response + 4, 1)
        if factionnum == 11
            TMImps.DisplayInvasionObjectives(Response + 4)
        elseif factionnum == 12
            TMSons.DisplayInvasionObjectives(Response + 4)
        endif
        debug.notification("Holding transferred!")
    elseif Response == 5
        MenuHoldings()
    endif
EndFunction

Function MenuBattles(int Response=0)
    Response = BattlesMessage.show()
    if Response == 0
        WinBattles()
    elseif Response == 1
        LoseBattles()
    elseif Response == 2
        MenuStart()
    endif
EndFunction

Function WinBattles()
    if AttackCity.IsRunning()
        AttackCity.SetStage(25)
    endif

    if AttackFort.IsRunning()
        AttackFort.SetStage(20)
    endif

    if AttackCamp.IsRunning()
        AttackCamp.SetStage(20)
    endif

    if DefendCityImp.IsRunning()
        (DefendCityImp as CS_DefendCityScript).WinQuest()
    endif

    if DefendCitySons.IsRunning()
        (DefendCitySons as CS_DefendCityScript).WinQuest()
    endif

    if DefendFortImp.IsRunning()
        (DefendFortImp as CS_DefendFortScript).WinQuest()
    endif

    if DefendFortSons.IsRunning()
        (DefendFortSons as CS_DefendFortScript).WinQuest()
    endif

    if DefendCampImp.IsRunning()
        (DefendCampImp as CS_DefendCampScript).WinQuest()
    endif

    if DefendCampSons.IsRunning()
        (DefendCampSons as CS_DefendCampScript).WinQuest()
    endif
EndFunction

Function LoseBattles()
    if AttackCity.IsRunning()
        AttackCity.SetStage(26)
    endif

    if AttackFort.IsRunning()
        (AttackFort as CS_AttackFortCampScript).FailQuest()
    endif

    if AttackCamp.IsRunning()
        (AttackCamp as CS_AttackFortCampScript).FailQuest()
    endif

    if DefendCityImp.IsRunning()
        (DefendCityImp as CS_DefendCityScript).FailQuest()
    endif

    if DefendCitySons.IsRunning()
        (DefendCitySons as CS_DefendCityScript).FailQuest()
    endif

    if DefendFortImp.IsRunning()
        (DefendFortImp as CS_DefendFortScript).FailQuest()
    endif

    if DefendFortSons.IsRunning()
        (DefendFortSons as CS_DefendFortScript).FailQuest()
    endif

    if DefendCampImp.IsRunning()
        (DefendCampImp as CS_DefendCampScript).FailQuest()
    endif

    if DefendCampSons.IsRunning()
        (DefendCampSons as CS_DefendCampScript).FailQuest()
    endif
EndFunction
