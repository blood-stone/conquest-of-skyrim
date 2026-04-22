Scriptname CS_EconomyMenuFunctions extends Quest  

Function UpdateGlobals(int num)
    int i = 0
    while i < EconGlobals[num].GetSize()
        UpdateCurrentInstanceGlobal(EconGlobals[num].GetAt(i) as GlobalVariable)
        i += 1
    endwhile
endFunction

Function UpdateEconomy()
    debug.notification("")
    EconUpdater.CalculatePlayerPerDay()
EndFunction

Function StartMenu(int Response = 0)
    UpdateGlobals(0)
    Response = EconMenuStart.show()
    If Response < 4
        UpdateGlobals(Response + 1)
    EndIf
    If Response == 0
        TreasuryMenu()
    ElseIf Response == 1
        FoodMenu()
    ElseIf Response == 2
        MetalMenu()
    ElseIf Response == 3
        WoodMenu()
    ElseIf Response == 4
        EconUpdater.EconomyMenu()
    EndIf
EndFunction

Function TreasuryMenu(int Response = 0)
    Response = TreasuryMenuStart.show()
    If Response == 0
        TreasuryMenuWithdraw()
    ElseIf Response == 1
        TreasuryMenuDeposit()
    ElseIf Response == 2
        StartMenu()
    EndIf   
EndFunction

Function TreasuryMenuWithdraw(int Response = 0)
    Response = TreasuryMenuWithdraw.show()
    If Response == 0
        TakeFromTreasury(100)
    ElseIf Response == 1
        TakeFromTreasury(1000)
    ElseIf Response == 2
        TakeFromTreasury(10000)
    ElseIf Response == 3
        TakeFromTreasury(100000)
    ElseIf Response == 4
        TakeFromTreasury(1000000)
    ElseIf Response == 5
        TreasuryMenu()
    EndIf
EndFunction

Function TreasuryMenuDeposit(int Response = 0)
    Response = TreasuryMenuDeposit.show()
    If Response == 0
        TakeFromTreasury(-100)
    ElseIf Response == 1
        TakeFromTreasury(-1000)
    ElseIf Response == 2
        TakeFromTreasury(-10000)
    ElseIf Response == 3
        TakeFromTreasury(-100000)
    ElseIf Response == 4
        TakeFromTreasury(-1000000)
    ElseIf Response == 5
        TreasuryMenu()
    EndIf
EndFunction

Function TakeFromTreasury(int amount)
    Treasury.SetValue(Treasury.GetValue() as int - amount)
    If amount > 0
        Game.GetPlayer().AddItem(Gold001, amount)
        UpdateCurrentInstanceGlobal(Treasury)
        TreasuryMenuWithdraw()
    Else
        Game.GetPlayer().RemoveItem(Gold001, -amount)
        UpdateCurrentInstanceGlobal(Treasury)
        If FactionStartDepositGold.GetValue() ==0
            If Treasury.GetValue() >= 1000
                FactionStartDepositGold.SetValue(1)
                GovQuest.SetStage(3)
            EndIf
        EndIf
        TreasuryMenuDeposit()
    EndIf
EndFunction

Function FoodMenu(int Response = 0)
    Response = EconMenuFood1.show()
    If Response == 0
        UpdateFoodGlobalsImport()
        FoodMenuImportMenuStart()
    ElseIf Response == 1
        UpdateFoodGlobalsExport()
        FoodMenuExportMenuStart()
    ElseIf Response == 2
        StartMenu()
    EndIf   
EndFunction

Function UpdateFoodGlobalsImport()
    UpdateCurrentInstanceGlobal(FoodImportedImp)
    UpdateCurrentInstanceGlobal(FoodImportedSons)
    UpdateCurrentInstanceGlobal(FoodImportedImpCost)
    UpdateCurrentInstanceGlobal(FoodImportedSonsCost)
EndFunction

Function UpdateFoodGlobalsExport()
    UpdateCurrentInstanceGlobal(FoodImportedImp)
    UpdateCurrentInstanceGlobal(FoodImportedSons)
    UpdateCurrentInstanceGlobal(FoodImportedImpCost)
    UpdateCurrentInstanceGlobal(FoodImportedSonsCost)
EndFunction

Function FoodMenuImportMenuStart(int Resp = 0)
    Resp = FoodExporters.show()
    if Resp == 0
        if FoodExportedImp.GetValue() > 0
            debug.notification("Can not import Food from the Imperials while exporting Food to them")
            FoodMenuImportMenuStart()
        else
            FoodMenuImport(Resp + 1)
        endif
    elseif Resp == 1
        if FoodExportedSons.GetValue() > 0
            debug.notification("Can not import Food to the Stormcloaks while exporting Food to them")
            FoodMenuImportMenuStart()
        else
            FoodMenuImport(Resp + 1)
        endif
    elseif Resp == 2
        FoodMenu()
    endif
EndFunction

Function FoodMenuImport(int factionnum, int Response = 0)
    If factionnum == 1
        Response = FoodImportImp.show()
    ElseIf factionnum == 2
        Response = FoodImportSons.show()
    EndIf
    if Response < 3
        ImportFood(factionnum, math.pow(10, Response) as int)
        FoodMenuImport(factionnum)
    elseif Response == 3
        CancelFoodImports(factionnum)
        FoodMenuImport(factionnum)
    elseif Response == 4
        FoodMenuImportMenuStart()
    endif
EndFunction

Function FoodMenuExportMenuStart(int Resp = 0)
    Resp = FoodImporters.show()
    if Resp == 0
        if FoodImportedImp.GetValue() > 0
            debug.notification("Can not export Food to the Imperials while importing Food from them")
            FoodMenuExportMenuStart()
        else
            FoodMenuExport(Resp + 1)
        endif
    elseif Resp == 1
        if FoodImportedSons.GetValue() > 0
            debug.notification("Can not export Food to the Stormcloaks while importing Food from them")
            FoodMenuExportMenuStart()
        else
            FoodMenuExport(Resp + 1)
        endif
    elseif Resp == 2
        FoodMenu()
    endif
EndFunction

Function FoodMenuExport(int factionnum, int Response = 0)
    If factionnum == 1
        Response = FoodExportImp.show()
    ElseIf factionnum == 2
        Response = FoodExportSons.show()
    EndIf
    if Response < 3
        ExportFood(factionnum, math.pow(10, Response) as int)
        FoodMenuExport(factionnum)
    elseif Response == 3
        CancelFoodExports(factionnum)
        FoodMenuExport(factionnum)
    elseif Response == 4
        FoodMenuExportMenuStart()
    endif
EndFunction

Function ImportFood(int factionnum, int amount)
    If GovQuest.GetStage() == 3
        GovQuest.SetStage(4)
    EndIf
    FoodPerDay.Mod(amount)
    TreasuryPerDay.Mod(-amount*100)
    FoodImported.Mod(amount)
    if factionnum == 1
        FoodImportedImp.Mod(amount)
        FoodImportedImpCost.SetValue(FoodImportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(FoodImportedImp)
        UpdateCurrentInstanceGlobal(FoodImportedImpCost)
    elseif factionnum == 2
        FoodImportedSons.Mod(amount)
        FoodImportedSonsCost.SetValue(FoodImportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(FoodImportedSons)
        UpdateCurrentInstanceGlobal(FoodImportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(FoodPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(FoodImported)
EndFunction

Function CancelFoodImports(int factionnum)
    if factionnum == 1
        FoodPerDay.Mod(-FoodImportedImp.GetValue())
        TreasuryPerDay.Mod(FoodImportedImp.GetValue()*100)
        FoodImported.Mod(-FoodImportedImp.GetValue())
        FoodImportedImp.SetValue(0)
        FoodImportedImpCost.SetValue(FoodImportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(FoodImportedImp)
        UpdateCurrentInstanceGlobal(FoodImportedImpCost)
    elseif factionnum == 2
        FoodPerDay.Mod(-FoodImportedSons.GetValue())
        TreasuryPerDay.Mod(FoodImportedSons.GetValue()*100)
        FoodImported.Mod(-FoodImportedSons.GetValue())
        FoodImportedSons.SetValue(0)
        FoodImportedSonsCost.SetValue(FoodImportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(FoodImportedSons)
        UpdateCurrentInstanceGlobal(FoodImportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(FoodPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(FoodImported)
EndFunction

Function ExportFood(int factionnum, int amount)
    FoodPerDay.Mod(-amount)
    TreasuryPerDay.Mod(amount*100)
    FoodExported.Mod(amount)
    if factionnum == 1
        FoodExportedImp.Mod(amount)
        FoodExportedImpCost.SetValue(FoodExportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(FoodExportedImp)
        UpdateCurrentInstanceGlobal(FoodExportedImpCost)
    elseif factionnum == 2
        FoodExportedSons.Mod(amount)
        FoodExportedSonsCost.SetValue(FoodExportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(FoodExportedSons)
        UpdateCurrentInstanceGlobal(FoodExportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(FoodPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(FoodExported)
EndFunction

Function CancelFoodExports(int factionnum)
    if factionnum == 1
        FoodPerDay.Mod(FoodExportedImp.GetValue())
        TreasuryPerDay.Mod(-FoodExportedImp.GetValue()*100)
        FoodExported.Mod(-FoodExportedImp.GetValue())
        FoodExportedImp.SetValue(0)
        FoodExportedImpCost.SetValue(FoodExportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(FoodExportedImp)
        UpdateCurrentInstanceGlobal(FoodExportedImpCost)
    elseif factionnum == 2
        FoodPerDay.Mod(FoodExportedSons.GetValue())
        TreasuryPerDay.Mod(-FoodExportedSons.GetValue()*100)
        FoodExported.Mod(-FoodExportedSons.GetValue())
        FoodExportedSons.SetValue(0)
        FoodExportedSonsCost.SetValue(FoodExportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(FoodExportedSons)
        UpdateCurrentInstanceGlobal(FoodExportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(FoodPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(FoodExported)
EndFunction


Function MetalMenu(int Response = 0)
    Response = EconMenuMetal1.show()
    If Response == 0
        UpdateMetalGlobalsImport()
        MetalMenuImportMenuStart()
    ElseIf Response == 1
        UpdateMetalGlobalsExport()
        MetalMenuExportMenuStart()
    ElseIf Response == 2
        StartMenu()
    EndIf   
EndFunction

Function UpdateMetalGlobalsImport()
    UpdateCurrentInstanceGlobal(MetalImportedImp)
    UpdateCurrentInstanceGlobal(MetalImportedSons)
    UpdateCurrentInstanceGlobal(MetalImportedImpCost)
    UpdateCurrentInstanceGlobal(MetalImportedSonsCost)
EndFunction

Function UpdateMetalGlobalsExport()
    UpdateCurrentInstanceGlobal(MetalImportedImp)
    UpdateCurrentInstanceGlobal(MetalImportedSons)
    UpdateCurrentInstanceGlobal(MetalImportedImpCost)
    UpdateCurrentInstanceGlobal(MetalImportedSonsCost)
EndFunction

Function MetalMenuImportMenuStart(int Resp = 0)
    Resp = MetalExporters.show()
    if Resp == 0
        if MetalExportedImp.GetValue() > 0
            debug.notification("Can not import Metal from the Imperials while exporting Metal to them")
            MetalMenuImportMenuStart()
        else
            MetalMenuImport(Resp + 1)
        endif
    elseif Resp == 1
        if MetalExportedSons.GetValue() > 0
            debug.notification("Can not import Metal to the Stormcloaks while exporting Metal to them")
            MetalMenuImportMenuStart()
        else
            MetalMenuImport(Resp + 1)
        endif
    elseif Resp == 2
        MetalMenu()
    endif
EndFunction

Function MetalMenuImport(int factionnum, int Response = 0)
    If factionnum == 1
        Response = MetalImportImp.show()
    ElseIf factionnum == 2
        Response = MetalImportSons.show()
    EndIf
    if Response < 3
        ImportMetal(factionnum, math.pow(10, Response) as int)
        MetalMenuImport(factionnum)
    elseif Response == 3
        CancelMetalImports(factionnum)
        MetalMenuImport(factionnum)
    elseif Response == 4
        MetalMenuImportMenuStart()
    endif
EndFunction

Function MetalMenuExportMenuStart(int Resp = 0)
    Resp = MetalImporters.show()
    if Resp == 0
        if MetalImportedImp.GetValue() > 0
            debug.notification("Can not export Metal to the Imperials while importing Metal from them")
            MetalMenuExportMenuStart()
        else
            MetalMenuExport(Resp + 1)
        endif
    elseif Resp == 1
        if MetalImportedSons.GetValue() > 0
            debug.notification("Can not export Metal to the Stormcloaks while importing Metal from them")
            MetalMenuExportMenuStart()
        else
            MetalMenuExport(Resp + 1)
        endif
    elseif Resp == 2
        MetalMenu()
    endif
EndFunction

Function MetalMenuExport(int factionnum, int Response = 0)
    If factionnum == 1
        Response = MetalExportImp.show()
    ElseIf factionnum == 2
        Response = MetalExportSons.show()
    EndIf
    if Response < 3
        ExportMetal(factionnum, math.pow(10, Response) as int)
        MetalMenuExport(factionnum)
    elseif Response == 3
        CancelMetalExports(factionnum)
        MetalMenuExport(factionnum)
    elseif Response == 4
        MetalMenuExportMenuStart()
    endif
EndFunction

Function ImportMetal(int factionnum, int amount)
    MetalPerDay.Mod(amount)
    TreasuryPerDay.Mod(-amount*100)
    MetalImported.Mod(amount)
    if factionnum == 1
        MetalImportedImp.Mod(amount)
        MetalImportedImpCost.SetValue(MetalImportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(MetalImportedImp)
        UpdateCurrentInstanceGlobal(MetalImportedImpCost)
    elseif factionnum == 2
        MetalImportedSons.Mod(amount)
        MetalImportedSonsCost.SetValue(MetalImportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(MetalImportedSons)
        UpdateCurrentInstanceGlobal(MetalImportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(MetalPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(MetalImported)
EndFunction

Function CancelMetalImports(int factionnum)
    if factionnum == 1
        MetalPerDay.Mod(-MetalImportedImp.GetValue())
        TreasuryPerDay.Mod(MetalImportedImp.GetValue()*100)
        MetalImported.Mod(-MetalImportedImp.GetValue())
        MetalImportedImp.SetValue(0)
        MetalImportedImpCost.SetValue(MetalImportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(MetalImportedImp)
        UpdateCurrentInstanceGlobal(MetalImportedImpCost)
    elseif factionnum == 2
        MetalPerDay.Mod(-MetalImportedSons.GetValue())
        TreasuryPerDay.Mod(MetalImportedSons.GetValue()*100)
        MetalImported.Mod(-MetalImportedSons.GetValue())
        MetalImportedSons.SetValue(0)
        MetalImportedSonsCost.SetValue(MetalImportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(MetalImportedSons)
        UpdateCurrentInstanceGlobal(MetalImportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(MetalPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(MetalImported)
EndFunction

Function ExportMetal(int factionnum, int amount)
    MetalPerDay.Mod(-amount)
    TreasuryPerDay.Mod(amount*100)
    MetalExported.Mod(amount)
    if factionnum == 1
        MetalExportedImp.Mod(amount)
        MetalExportedImpCost.SetValue(MetalExportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(MetalExportedImp)
        UpdateCurrentInstanceGlobal(MetalExportedImpCost)
    elseif factionnum == 2
        MetalExportedSons.Mod(amount)
        MetalExportedSonsCost.SetValue(MetalExportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(MetalExportedSons)
        UpdateCurrentInstanceGlobal(MetalExportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(MetalPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(MetalExported)
EndFunction

Function CancelMetalExports(int factionnum)
    if factionnum == 1
        MetalPerDay.Mod(MetalExportedImp.GetValue())
        TreasuryPerDay.Mod(-MetalExportedImp.GetValue()*100)
        MetalExported.Mod(-MetalExportedImp.GetValue())
        MetalExportedImp.SetValue(0)
        MetalExportedImpCost.SetValue(MetalExportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(MetalExportedImp)
        UpdateCurrentInstanceGlobal(MetalExportedImpCost)
    elseif factionnum == 2
        MetalPerDay.Mod(MetalExportedSons.GetValue())
        TreasuryPerDay.Mod(-MetalExportedSons.GetValue()*100)
        MetalExported.Mod(-MetalExportedSons.GetValue())
        MetalExportedSons.SetValue(0)
        MetalExportedSonsCost.SetValue(MetalExportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(MetalExportedSons)
        UpdateCurrentInstanceGlobal(MetalExportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(MetalPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(MetalExported)
EndFunction

Function WoodMenu(int Response = 0)
    Response = EconMenuWood1.show()
    If Response == 0
        UpdateWoodGlobalsImport()
        WoodMenuImportMenuStart()
    ElseIf Response == 1
        UpdateWoodGlobalsExport()
        WoodMenuExportMenuStart()
    ElseIf Response == 2
        StartMenu()
    EndIf   
EndFunction

Function UpdateWoodGlobalsImport()
    UpdateCurrentInstanceGlobal(WoodImportedImp)
    UpdateCurrentInstanceGlobal(WoodImportedSons)
    UpdateCurrentInstanceGlobal(WoodImportedImpCost)
    UpdateCurrentInstanceGlobal(WoodImportedSonsCost)
EndFunction

Function UpdateWoodGlobalsExport()
    UpdateCurrentInstanceGlobal(WoodImportedImp)
    UpdateCurrentInstanceGlobal(WoodImportedSons)
    UpdateCurrentInstanceGlobal(WoodImportedImpCost)
    UpdateCurrentInstanceGlobal(WoodImportedSonsCost)
EndFunction

Function WoodMenuImportMenuStart(int Resp = 0)
    Resp = WoodExporters.show()
    if Resp == 0
        if WoodExportedImp.GetValue() > 0
            debug.notification("Can not import Wood from the Imperials while exporting Wood to them")
            WoodMenuImportMenuStart()
        else
            WoodMenuImport(Resp + 1)
        endif
    elseif Resp == 1
        if WoodExportedSons.GetValue() > 0
            debug.notification("Can not import Wood to the Stormcloaks while exporting Wood to them")
            WoodMenuImportMenuStart()
        else
            WoodMenuImport(Resp + 1)
        endif
    elseif Resp == 2
        WoodMenu()
    endif
EndFunction

Function WoodMenuImport(int factionnum, int Response = 0)
    If factionnum == 1
        Response = WoodImportImp.show()
    ElseIf factionnum == 2
        Response = WoodImportSons.show()
    EndIf
    if Response < 3
        ImportWood(factionnum, math.pow(10, Response) as int)
        WoodMenuImport(factionnum)
    elseif Response == 3
        CancelWoodImports(factionnum)
        WoodMenuImport(factionnum)
    elseif Response == 4
        WoodMenuImportMenuStart()
    endif
EndFunction

Function WoodMenuExportMenuStart(int Resp = 0)
    Resp = WoodImporters.show()
    if Resp == 0
        if WoodImportedImp.GetValue() > 0
            debug.notification("Can not export Wood to the Imperials while importing Wood from them")
            WoodMenuExportMenuStart()
        else
            WoodMenuExport(Resp + 1)
        endif
    elseif Resp == 1
        if WoodImportedSons.GetValue() > 0
            debug.notification("Can not export Wood to the Stormcloaks while importing Wood from them")
            WoodMenuExportMenuStart()
        else
            WoodMenuExport(Resp + 1)
        endif
    elseif Resp == 2
        WoodMenu()
    endif
EndFunction

Function WoodMenuExport(int factionnum, int Response = 0)
    If factionnum == 1
        Response = WoodExportImp.show()
    ElseIf factionnum == 2
        Response = WoodExportSons.show()
    EndIf
    if Response < 3
        ExportWood(factionnum, math.pow(10, Response) as int)
        WoodMenuExport(factionnum)
    elseif Response == 3
        CancelWoodExports(factionnum)
        WoodMenuExport(factionnum)
    elseif Response == 4
        WoodMenuExportMenuStart()
    endif
EndFunction

Function ImportWood(int factionnum, int amount)
    WoodPerDay.Mod(amount)
    TreasuryPerDay.Mod(-amount*100)
    WoodImported.Mod(amount)
    if factionnum == 1
        WoodImportedImp.Mod(amount)
        WoodImportedImpCost.SetValue(WoodImportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(WoodImportedImp)
        UpdateCurrentInstanceGlobal(WoodImportedImpCost)
    elseif factionnum == 2
        WoodImportedSons.Mod(amount)
        WoodImportedSonsCost.SetValue(WoodImportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(WoodImportedSons)
        UpdateCurrentInstanceGlobal(WoodImportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(WoodPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(WoodImported)
EndFunction

Function CancelWoodImports(int factionnum)
    if factionnum == 1
        WoodPerDay.Mod(-WoodImportedImp.GetValue())
        TreasuryPerDay.Mod(WoodImportedImp.GetValue()*100)
        WoodImported.Mod(-WoodImportedImp.GetValue())
        WoodImportedImp.SetValue(0)
        WoodImportedImpCost.SetValue(WoodImportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(WoodImportedImp)
        UpdateCurrentInstanceGlobal(WoodImportedImpCost)
    elseif factionnum == 2
        WoodPerDay.Mod(-WoodImportedSons.GetValue())
        TreasuryPerDay.Mod(WoodImportedSons.GetValue()*100)
        WoodImported.Mod(-WoodImportedSons.GetValue())
        WoodImportedSons.SetValue(0)
        WoodImportedSonsCost.SetValue(WoodImportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(WoodImportedSons)
        UpdateCurrentInstanceGlobal(WoodImportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(WoodPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(WoodImported)
EndFunction

Function ExportWood(int factionnum, int amount)
    WoodPerDay.Mod(-amount)
    TreasuryPerDay.Mod(amount*100)
    WoodExported.Mod(amount)
    if factionnum == 1
        WoodExportedImp.Mod(amount)
        WoodExportedImpCost.SetValue(WoodExportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(WoodExportedImp)
        UpdateCurrentInstanceGlobal(WoodExportedImpCost)
    elseif factionnum == 2
        WoodExportedSons.Mod(amount)
        WoodExportedSonsCost.SetValue(WoodExportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(WoodExportedSons)
        UpdateCurrentInstanceGlobal(WoodExportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(WoodPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(WoodExported)
EndFunction

Function CancelWoodExports(int factionnum)
    if factionnum == 1
        WoodPerDay.Mod(WoodExportedImp.GetValue())
        TreasuryPerDay.Mod(-WoodExportedImp.GetValue()*100)
        WoodExported.Mod(-WoodExportedImp.GetValue())
        WoodExportedImp.SetValue(0)
        WoodExportedImpCost.SetValue(WoodExportedImp.GetValue()*100)
        UpdateCurrentInstanceGlobal(WoodExportedImp)
        UpdateCurrentInstanceGlobal(WoodExportedImpCost)
    elseif factionnum == 2
        WoodPerDay.Mod(WoodExportedSons.GetValue())
        TreasuryPerDay.Mod(-WoodExportedSons.GetValue()*100)
        WoodExported.Mod(-WoodExportedSons.GetValue())
        WoodExportedSons.SetValue(0)
        WoodExportedSonsCost.SetValue(WoodExportedSons.GetValue()*100)
        UpdateCurrentInstanceGlobal(WoodExportedSons)
        UpdateCurrentInstanceGlobal(WoodExportedSonsCost)
    endif
    UpdateCurrentInstanceGlobal(WoodPerDay)
    UpdateCurrentInstanceGlobal(TreasuryPerDay)
    UpdateCurrentInstanceGlobal(WoodExported)
EndFunction

Message Property EconMenuStart  Auto  

Message Property EconMenuFood1  Auto  

Message Property EconMenuTreasury1  Auto  

FormList Property EconGlobalsStart  Auto  

FormList Property EconGlobalsFood  Auto  

FormList Property EconGlobalsWood  Auto  

FormList Property EconGlobalsMetal  Auto  

Message Property EconMenuWood1  Auto  

Message Property EconMenuMetal1  Auto  

FormList[] Property EconGlobals  Auto  

CS_EconomyVariableFunctions Property EconUpdater Auto

Message Property TreasuryMenuStart  Auto  

Message Property TreasuryMenuWithdraw  Auto  

Message Property TreasuryMenuDeposit  Auto  

MiscObject Property Gold001  Auto  

GlobalVariable Property Treasury  Auto  

Message Property FoodMenuImport  Auto  

GlobalVariable Property TreasuryPerDay  Auto  

GlobalVariable Property FoodPerDay  Auto  

GlobalVariable Property FoodImported  Auto  

GlobalVariable Property FoodExported  Auto  

Message Property FoodMenuExport  Auto  

GlobalVariable Property MetalPerDay  Auto  

GlobalVariable Property MetalExported  Auto  

GlobalVariable Property MetalImported  Auto  

Message Property MetalMenuImport  Auto  

Message Property MetalMenuExport  Auto  

Message Property WoodMenuExport  Auto  

Message Property WoodMenuImport  Auto  

GlobalVariable Property WoodPerDay  Auto  

GlobalVariable Property WoodImported  Auto  

GlobalVariable Property WoodExported  Auto  

GlobalVariable Property FactionStartDepositGold  Auto  

GlobalVariable Property FactionStartImportFood  Auto  

Quest Property GovQuest  Auto  

Message Property FoodExportersCities  Auto  

FormList Property FoodExportGlobals  Auto  

FormList Property FoodImportGlobals  Auto  

FormList Property AllLocations  Auto  

LocationAlias Property ImportCity  Auto  

GlobalVariable Property FoodImportAvailable Auto

Message Property FoodExportersMinorCities  Auto  

Message Property FoodExportersVillages  Auto  

Message Property FoodImportersCities  Auto  

Message Property FoodImportersMinorCities  Auto  

Message Property FoodImportersVillages  Auto  

GlobalVariable Property FoodImportCity  Auto  

GlobalVariable Property FoodExportNeed  Auto  

GlobalVariable Property FoodExportCity  Auto  

Message Property FoodExporters  Auto  
Message Property FoodImporters  Auto  
Message Property FoodExportImp  Auto  
Message Property FoodImportImp  Auto  
Message Property FoodExportSons  Auto  
Message Property FoodImportSons  Auto  

GlobalVariable Property FoodExportedImp Auto
GlobalVariable Property FoodExportedSons Auto
GlobalVariable Property FoodExportedImpCost Auto
GlobalVariable Property FoodExportedSonsCost Auto
GlobalVariable Property FoodImportedImp Auto
GlobalVariable Property FoodImportedSons Auto
GlobalVariable Property FoodImportedImpCost Auto
GlobalVariable Property FoodImportedSonsCost Auto

Message Property MetalExporters  Auto  
Message Property MetalImporters  Auto  
Message Property MetalExportImp  Auto  
Message Property MetalImportImp  Auto  
Message Property MetalExportSons  Auto  
Message Property MetalImportSons  Auto  

GlobalVariable Property MetalExportedImp Auto
GlobalVariable Property MetalExportedSons Auto
GlobalVariable Property MetalExportedImpCost Auto
GlobalVariable Property MetalExportedSonsCost Auto
GlobalVariable Property MetalImportedImp Auto
GlobalVariable Property MetalImportedSons Auto
GlobalVariable Property MetalImportedImpCost Auto
GlobalVariable Property MetalImportedSonsCost Auto

Message Property WoodExporters  Auto  
Message Property WoodImporters  Auto  
Message Property WoodExportImp  Auto  
Message Property WoodImportImp  Auto  
Message Property WoodExportSons  Auto  
Message Property WoodImportSons  Auto  

GlobalVariable Property WoodExportedImp Auto
GlobalVariable Property WoodExportedSons Auto
GlobalVariable Property WoodExportedImpCost Auto
GlobalVariable Property WoodExportedSonsCost Auto
GlobalVariable Property WoodImportedImp Auto
GlobalVariable Property WoodImportedSons Auto
GlobalVariable Property WoodImportedImpCost Auto
GlobalVariable Property WoodImportedSonsCost Auto

Keyword Property CWOwner Auto

Quest Property WarQuestImp Auto
Quest Property WarQuestSons Auto
FormList Property AllVanillaLocations  Auto  
