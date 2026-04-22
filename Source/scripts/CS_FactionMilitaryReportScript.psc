Scriptname CS_FactionMilitaryReportScript extends Quest conditional 

ObjectReference Property FactionOwner Auto hidden

ReferenceAlias[] Property UnitThreads Auto
ReferenceAlias Property UnitCommander Auto
ReferenceAlias Property UnitTask Auto
ReferenceAlias Property UnitTaskTarget Auto

LocationAlias Property FactionName Auto
LocationAlias Property UnitLocation Auto
LocationAlias Property UnitHomeSettlement Auto
LocationAlias Property UnitTaskTargetLoc Auto
LocationAlias Property UnitTaskMoving Auto

Location Property CS_FactionMilitaryReportMovingToText Auto
Location Property CS_NoneLocation Auto

ObjectReference Property CS_NoneObject Auto

Message Property CS_FactionMilitaryReportStart Auto
Message Property CS_FactionMilitaryReportUnit Auto
Message Property CS_FactionMilitaryReportUnitInactive Auto
Message Property CS_FactionMilitaryReportUnitTroopConfig Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigRecruitStart Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigRecruitNormal Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigRecruitMage Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigRecruitDwarven Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigRecruitCreatures Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigRemoveStart Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigRemoveNormal Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigRemoveMage Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigRemoveDwarven Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigRemoveCreatures Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigTemplate Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigTemplateNormal Auto
Message Property CS_FactionMilitaryReportUnitTroopConfigTemplateMage Auto
Message Property CS_FactionMilitaryReportUnitOrders Auto
Message Property CS_FactionMilitaryReportUnitOrdersNoCommander Auto
Message Property CS_FactionMilitaryReportUnitEquipment Auto
Message Property CS_FactionMilitaryReportUnitEquipmentTier Auto
Message Property CS_FactionMilitaryReportEquipment Auto
Message Property CS_FactionMilitaryReportEquipmentNormal Auto
Message Property CS_FactionMilitaryReportEquipmentMage Auto
Message Property CS_FactionMilitaryReportEquipmentTroop Auto

FormList Property CS_FactionMilitaryReportUnits Auto
FormList Property CS_TroopTemplatesNormal Auto
FormList Property CS_TroopTemplatesMage Auto

ActorBase Property CS_CustomEquipmentTroopActor Auto

CS_FactionMilitaryUnitControl Property CS_FactionMilitaryUnitCommanders Auto

int[] Property TroopCounts Auto hidden
int Property TroopsSet Auto conditional hidden
int Property TroopCount1 Auto conditional hidden
int Property TroopCount2 Auto conditional hidden
int Property TroopCount3 Auto conditional hidden
int Property TroopCount4 Auto conditional hidden
int Property TroopCount5 Auto conditional hidden
int Property TroopCount6 Auto conditional hidden
int Property TroopCount7 Auto conditional hidden
int Property TroopCount8 Auto conditional hidden
int Property HasNextPage Auto conditional hidden
int Property ShowTier0 Auto conditional hidden
int Property ShowTier1 Auto conditional hidden
int Property ShowTier2 Auto conditional hidden
int Property ShowTier3 Auto conditional hidden
int Property ShowTier4 Auto conditional hidden
int Property ShowTier5 Auto conditional hidden
int Property ShowTier6 Auto conditional hidden
int Property ShowTier7 Auto conditional hidden
int Property ShowTier8 Auto conditional hidden
int Property OrdersNum Auto conditional hidden
int Property CustomOutfitEnabled Auto conditional hidden
int Property GenderedEquipment Auto conditional hidden
int LastIndex

bool Property ModifiedTroop Auto hidden
bool Property ModifiedCommander Auto hidden
bool Property ModifiedUnit Auto hidden

CS_FactionManagementDiplomacy Diplomacy
CS_FactionManagementMilitary Military

CS_ArmyUnitAliasScript UnitScript

CS_ArmyRegimentOrders Orders
CS_ArmyRegimentTroops Troops
CS_ArmyRegimentEquipment Equipment
CS_CityManagementPopulation Population

; Menu Functions ------------------------------------------------------------

Function Menu(ObjectReference FactionToUse)
    SetUp(FactionToUse)
    
    int Response
    while Response != 3
        Response = CS_FactionMilitaryReportStart.show()
        
        if Response == 0
            MenuUnits()
        elseif Response == 1
            ;OperationsMenu
        elseif Response == 2
            MenuEquipment()
        endif
    endwhile
    
    Stop()
EndFunction

Function MenuUnits()
    
    int ArrayStartNum = 0
    int ArrayEndNum = CS_FactionMilitaryUnitCommanders.TotalUnits
    Message MenuToShow
    
    bool InMenu = true
    int pagenum = 1
    
    while InMenu
        int MenuNum
        int ArrayStart = 5*(pagenum - 1)
        
        if 5*pagenum >= ArrayEndNum
            HasNextPage = 0
        else
            HasNextPage = 1
        endif
        
        MenuNum = ArrayEndNum - ArrayStart
        if MenuNum > 5
            MenuNum = 5
        endif
        
        SetUnitMenu(ArrayStart, ArrayEndNum)
        
        MenuToShow = CS_FactionMilitaryReportUnits.GetAt(MenuNum) as Message
        int Response = MenuToShow.show(TroopCounts[0], TroopCounts[1], TroopCounts[2], TroopCounts[3], TroopCounts[4])

        if Response == LastIndex
            if HasNextPage == 1
                pagenum += 1
            else
                InMenu = false
            endif
        elseif Response == 0 && pagenum > 1
            pagenum -= 1
        else
            Quest Unit = CS_FactionMilitaryUnitCommanders.Units.GetAt(ArrayStart + Response) as Quest
            MenuUnit(Unit)
        endif
    endwhile
    
EndFunction

Function MenuUnit(Quest Unit)
    SetUnit(Unit)
    
    int Response
    while Response != 4
        Response = CS_FactionMilitaryReportUnit.show(UnitScript.AliveTroopCount, UnitScript.TotalTroopCount)
        
        if Response == 0
            MenuUnitTroopConfig()
        elseif Response == 1
            MenuUnitOrders()
        elseif Response == 2
            MenuUnitEquipment()
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfig()
    int Response
    while Response != 3
        TroopsSet = UnitScript.TotalTroopCount
        
        Response = CS_FactionMilitaryReportUnitTroopConfig.show(TroopsSet, 20)
        if Response == 0
            MenuUnitTroopConfigRecruit()
        elseif Response == 1
            MenuUnitTroopConfigRemove()
        elseif Response == 2
            MenuUnitTroopConfigTemplate()
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigRecruit()
    int Response
    while Response != 4
        TroopsSet = UnitScript.TotalTroopCount
        
        Response = CS_FactionMilitaryReportUnitTroopConfigRecruitStart.show(TroopsSet, 20)
        if Response == 0
            MenuUnitTroopConfigRecruitNormal()
        elseif Response == 1
            MenuUnitTroopConfigRecruitMage()
        elseif Response == 2
            MenuUnitTroopConfigRecruitDwarven()
        elseif Response == 3
            MenuUnitTroopConfigRecruitCreatures()
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigRecruitNormal()
    int Response
    while Response != 4
        TroopsSet = UnitScript.TotalTroopCount
        TroopCount1 = UnitScript.TroopCounts[0]
        TroopCount2 = UnitScript.TroopCounts[1]
        TroopCount3 = UnitScript.TroopCounts[2]
        TroopCount4 = UnitScript.TroopCounts[3]
        
        Response = CS_FactionMilitaryReportUnitTroopConfigRecruitNormal.show(TroopsSet, TroopCount1, TroopCount2, TroopCount3, TroopCount4)
        if Response < 4
            UnitScript.RecruitTroop(Response)
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigRecruitMage()
    int Response
    while Response != 6
        TroopsSet = UnitScript.TotalTroopCount
        TroopCount1 = UnitScript.TroopCounts[4]
        TroopCount2 = UnitScript.TroopCounts[5]
        TroopCount3 = UnitScript.TroopCounts[6]
        TroopCount4 = UnitScript.TroopCounts[7]
        TroopCount5 = UnitScript.TroopCounts[8]
        TroopCount6 = UnitScript.TroopCounts[9]
        
        Response = CS_FactionMilitaryReportUnitTroopConfigRecruitMage.show(TroopsSet, TroopCount1, TroopCount2, TroopCount3, TroopCount4)
        if Response < 6
            UnitScript.RecruitTroop(Response + 4)
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigRecruitDwarven()
    int Response
    while Response != 3
        TroopsSet = UnitScript.TotalTroopCount
        TroopCount1 = UnitScript.TroopCounts[10]
        TroopCount2 = UnitScript.TroopCounts[11]
        TroopCount3 = UnitScript.TroopCounts[12]
        
        Response = CS_FactionMilitaryReportUnitTroopConfigRecruitDwarven.show(TroopsSet, TroopCount1, TroopCount2, TroopCount3, TroopCount4)
        if Response < 3
            UnitScript.RecruitTroop(Response + 10)
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigRecruitCreatures()
    int Response
    while Response != 8
        TroopsSet = UnitScript.TotalTroopCount
        TroopCount1 = UnitScript.TroopCounts[14]
        TroopCount2 = UnitScript.TroopCounts[15]
        TroopCount3 = UnitScript.TroopCounts[16]
        TroopCount4 = UnitScript.TroopCounts[17]
        TroopCount5 = UnitScript.TroopCounts[18]
        TroopCount6 = UnitScript.TroopCounts[19]
        TroopCount7 = UnitScript.TroopCounts[20]
        TroopCount8 = UnitScript.TroopCounts[21]
        
        Response = CS_FactionMilitaryReportUnitTroopConfigRecruitCreatures.show(TroopsSet, TroopCount1, TroopCount2, TroopCount3, TroopCount4)
        if Response < 8
            UnitScript.RecruitTroop(Response + 14)
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigRemove()
    int Response
    while Response != 4
        TroopsSet = UnitScript.TotalTroopCount
        
        Response = CS_FactionMilitaryReportUnitTroopConfigRemoveStart.show(TroopsSet, 20)
        if Response == 0
            MenuUnitTroopConfigRemoveNormal()
        elseif Response == 1
            MenuUnitTroopConfigRemoveMage()
        elseif Response == 2
            MenuUnitTroopConfigRemoveDwarven()
        elseif Response == 3
            MenuUnitTroopConfigRemoveCreatures()
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigRemoveNormal()
    int Response
    while Response != 4
        TroopsSet = UnitScript.TotalTroopCount
        TroopCount1 = UnitScript.TroopCounts[0]
        TroopCount2 = UnitScript.TroopCounts[1]
        TroopCount3 = UnitScript.TroopCounts[2]
        TroopCount4 = UnitScript.TroopCounts[3]
        
        Response = CS_FactionMilitaryReportUnitTroopConfigRemoveNormal.show(TroopsSet, TroopCount1, TroopCount2, TroopCount3, TroopCount4)
        if Response < 4
            UnitScript.RemoveTroop(Response)
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigRemoveMage()
    int Response
    while Response != 6
        TroopsSet = UnitScript.TotalTroopCount
        TroopCount1 = UnitScript.TroopCounts[4]
        TroopCount2 = UnitScript.TroopCounts[5]
        TroopCount3 = UnitScript.TroopCounts[6]
        TroopCount4 = UnitScript.TroopCounts[7]
        TroopCount5 = UnitScript.TroopCounts[8]
        TroopCount6 = UnitScript.TroopCounts[9]
        
        Response = CS_FactionMilitaryReportUnitTroopConfigRemoveMage.show(TroopsSet, TroopCount1, TroopCount2, TroopCount3, TroopCount4)
        if Response < 6
            UnitScript.RemoveTroop(Response + 4)
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigRemoveDwarven()
    int Response
    while Response != 3
        TroopsSet = UnitScript.TotalTroopCount
        TroopCount1 = UnitScript.TroopCounts[10]
        TroopCount2 = UnitScript.TroopCounts[11]
        TroopCount3 = UnitScript.TroopCounts[12]
        
        Response = CS_FactionMilitaryReportUnitTroopConfigRemoveDwarven.show(TroopsSet, TroopCount1, TroopCount2, TroopCount3, TroopCount4)
        if Response < 3
            UnitScript.RemoveTroop(Response + 10)
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigRemoveCreatures()
    int Response
    while Response != 8
        TroopsSet = UnitScript.TotalTroopCount
        TroopCount1 = UnitScript.TroopCounts[14]
        TroopCount2 = UnitScript.TroopCounts[15]
        TroopCount3 = UnitScript.TroopCounts[16]
        TroopCount4 = UnitScript.TroopCounts[17]
        TroopCount5 = UnitScript.TroopCounts[18]
        TroopCount6 = UnitScript.TroopCounts[19]
        TroopCount7 = UnitScript.TroopCounts[20]
        TroopCount8 = UnitScript.TroopCounts[21]
        
        Response = CS_FactionMilitaryReportUnitTroopConfigRemoveCreatures.show(TroopsSet, TroopCount1, TroopCount2, TroopCount3, TroopCount4)
        if Response < 8
            UnitScript.RemoveTroop(Response + 14)
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigTemplate()
    int Response
    while Response != 6
        
        Response = CS_FactionMilitaryReportUnitTroopConfigTemplate.show()
        if Response == 0
            MenuUnitTroopConfigTemplateNormal()
        elseif Response == 1
            MenuUnitTroopConfigTemplateMage()
        elseif Response == 2
            ;MenuUnitTroopConfigTemplateDwarven()
        elseif Response == 3
            ;MenuUnitTroopConfigTemplateCreatures()
        elseif Response == 4
            ;MenuUnitTroopConfigTemplateMixed()
        elseif Response == 5
            ;MenuUnitTroopConfigTemplateCustom()
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigTemplateNormal()
    int Response
    while Response != 7
        
        Response = CS_FactionMilitaryReportUnitTroopConfigTemplateNormal.show()
        if Response < 7
            CS_TroopTemplateScript TroopTemplate = CS_TroopTemplatesNormal.GetAt(Response) as CS_TroopTemplateScript
            UnitScript.UseTroopTemplate(TroopTemplate)
            Response = 7
        endif
    endwhile
EndFunction

Function MenuUnitTroopConfigTemplateMage()
    int Response
    while Response != 6
        
        Response = CS_FactionMilitaryReportUnitTroopConfigTemplateMage.show()
        if Response < 6
            CS_TroopTemplateScript TroopTemplate = CS_TroopTemplatesMage.GetAt(Response) as CS_TroopTemplateScript
            UnitScript.UseTroopTemplate(TroopTemplate)
            Response = 6
        endif
    endwhile
EndFunction

Function MenuUnitOrders()
    int Response
    
    if UnitCommander.GetActorRef()
        while Response != 2
            
            SetUnitTask()
            Response = CS_FactionMilitaryReportUnitOrders.show(UnitScript.AliveTroopCount, UnitScript.TotalTroopCount)
            if Response == 0
                UnitScript.SetNewTask(1, Game.GetPlayer())
            elseif Response == 1
                UnitScript.ClearOrders()
            endif
        endwhile
    else
        Response = CS_FactionMilitaryReportUnitOrdersNoCommander.show()
    endif
EndFunction

Function MenuUnitEquipment()
    int Response
    while Response != 2
        float Modifier = UnitScript.TroopEquipmentModifier
        
        Response = CS_FactionMilitaryReportUnitEquipment.show(Modifier)
        if Response == 0
            MenuUnitEquipmentTier()
        elseif Response == 1
            GetUnitEquipment()
        endif
    endwhile
EndFunction

Function MenuUnitEquipmentTier()
    int Response
    while Response < 9
        SetEquipmentTierMenu()
        int EquipmentTier = UnitScript.EquipmentTier
        
        Response = CS_FactionMilitaryReportUnitEquipmentTier.show(EquipmentTier)
        if Response < 9
            UnitScript.SetNewTier(Response)
        endif
    endwhile
EndFunction

Function MenuEquipment()
    
    int Response
    while Response != 3
        
        Response = CS_FactionMilitaryReportEquipment.show()
        if Response == 0
            MenuEquipmentNormal()
        elseif Response == 1
            MenuEquipmentMage()
        elseif Response == 2
            MenuEquipmentGuard()
        endif
        
    endwhile
    
EndFunction

Function MenuEquipmentNormal()
    
    int Response
    while Response != 4
        Response = CS_FactionMilitaryReportEquipmentNormal.show()
        
        if Response < 4
            MenuEquipmentTroop(Response)
        endif
    endwhile
    
EndFunction

Function MenuEquipmentMage()
    
    int Response
    while Response != 4
        Response = CS_FactionMilitaryReportEquipmentMage.show()
        
        if Response < 4
            MenuEquipmentTroop(Response + 4)
        endif
    endwhile
    
EndFunction

Function MenuEquipmentTroop(int trooptype)
    
    int Response
    while Response != 7
    
        CustomOutfitEnabled = Military.HasCustomOutfits[trooptype]
        GenderedEquipment = Military.HasGenderedOutfits[trooptype]
        
        Response = CS_FactionMilitaryReportEquipmentTroop.show()
        
        if Response == 0
            GetTroopEquipment(trooptype)
        elseif Response == 1
            GetTroopEquipment(trooptype, 0)
        elseif Response == 2
            GetTroopEquipment(trooptype, 1)
        elseif Response == 3
            Military.HasGenderedOutfits[trooptype] = 1
            Military.UpdateEquipment(trooptype, 0)
            Military.UpdateEquipment(trooptype, 1)
        elseif Response == 4
            Military.HasGenderedOutfits[trooptype] = 0
            Military.UpdateEquipment(trooptype)
        elseif Response == 5
            Military.HasCustomOutfits[trooptype] = 1
        elseif Response == 6
            Military.HasCustomOutfits[trooptype] = 0
        endif
        
    endwhile
    
EndFunction

Function MenuEquipmentGuard()
    
    int Response
    while Response != 7
    
        CustomOutfitEnabled = Military.HasCustomGuardOutfit
        GenderedEquipment = Military.HasGenderedGuardOutfit
        
        Response = CS_FactionMilitaryReportEquipmentTroop.show()
        
        if Response == 0
            GetGuardEquipment()
        elseif Response == 1
            GetGuardEquipment(0)
        elseif Response == 2
            GetGuardEquipment(1)
        elseif Response == 3
            Military.HasGenderedGuardOutfit = 1
            Military.UpdateGuardEquipment(0)
            Military.UpdateGuardEquipment(1)
        elseif Response == 4
            Military.HasGenderedGuardOutfit = 0
            Military.UpdateGuardEquipment()
        elseif Response == 5
            Military.HasCustomGuardOutfit = 1
        elseif Response == 6
            Military.HasCustomGuardOutfit = 0
        endif
        
    endwhile
    
EndFunction
    
; Set Up Functions ---------------------------------------------------------------

Function SetUp(ObjectReference FactionToUse)
    FactionOwner = FactionToUse
    
    Diplomacy = FactionToUse as CS_FactionManagementDiplomacy
    Military = FactionToUse as CS_FactionManagementMilitary
    
    FactionName.ForceLocationTo(Diplomacy.FactionName)
EndFunction

Function SetUnitMenu(int ArrayStart, int ArrayEnd)
    TroopCounts = new int[5]
    
    int i = 0
    while i < UnitThreads.Length && (ArrayStart + i) < ArrayEnd
        if UnitThreads[i]
            CS_FactionMilitaryReportUnitScript Thread = UnitThreads[i] as CS_FactionMilitaryReportUnitScript
            Thread.Unit = CS_FactionMilitaryUnitCommanders.Units.GetAt(ArrayStart + i) as Quest
            Thread.GoToState("Update")
            Thread.RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile
    
    LastIndex = i
    
    i = 0
    while i < UnitThreads.Length && (ArrayStart + i) < ArrayEnd
        CS_FactionMilitaryReportUnitScript Thread = UnitThreads[i] as CS_FactionMilitaryReportUnitScript
        int loopnum
        while Thread.GetState() != "Updated" && loopnum < 50
            utility.wait(0.1)
            loopnum += 1
        endwhile
        TroopCounts[i] = Thread.TroopCount
        i += 1
    endwhile
EndFunction

Function SetUnit(Quest Unit)
    UnitScript = Unit as CS_ArmyUnitAliasScript
    Population = UnitScript.HomeStation as CS_CityManagementPopulation
    
    Location HomeSettlement = (UnitScript.HomeStation as CS_CityManagementOwnership).VanillaCity
    
    if UnitScript.Commander.GetActorRef()
        UnitCommander.ForceRefTo(UnitScript.Commander.GetActorRef())
        UnitLocation.ForceLocationTo(UnitCommander.GetActorRef().GetCurrentLocation())
    else
        UnitCommander.ForceRefTo(CS_NoneObject)
        UnitLocation.ForceLocationTo(CS_NoneLocation)
    endif
    
    SetUnitTask()
    
    UnitHomeSettlement.ForceLocationTo(HomeSettlement)
EndFunction

Function SetUnitTask()
    if UnitScript.CurrentTask
        CS_UnitTaskScript CurrentTask = UnitScript.CurrentTask
        if CurrentTask.Moving ; Will either fill the text with "Moving To" or the name of the task
            UnitTaskMoving.ForceLocationTo(CS_FactionMilitaryReportMovingToText)
            UnitTask.ForceRefTo(CS_NoneObject)
        else
            UnitTask.ForceRefTo(CurrentTask as ObjectReference)
            UnitTaskMoving.ForceLocationTo(CS_NoneLocation)
        endif
        
        if CurrentTask.TargetLocation ; Will either fill the text with the Ref of the target or the target location
            UnitTaskTargetLoc.ForceLocationTo(CurrentTask.TargetLocation)
            UnitTaskTarget.ForceRefTo(CS_NoneObject)
        elseif CurrentTask.Target
            UnitTaskTarget.ForceRefTo(CurrentTask.Target)
            UnitTaskTargetLoc.ForceLocationTo(CS_NoneLocation)
        endif
    endif
    
    OrdersNum = UnitScript.OrdersNum
EndFunction

Function SetEquipmentTierMenu()
    CS_FactionManagementEconomy FactionEconomy = (UnitScript.CS_FactionPlayer as ObjectReference) as CS_FactionManagementEconomy
    CS_StorageFactionEquipmentScript EquipmentStorage = FactionEconomy.StorageEquipment as CS_StorageFactionEquipmentScript
    
    if UnitScript.EquipmentTier > 0
        ShowTier0 = 1
    else
        ShowTier0 = 0
    endif
    
    ShowTier1 = EquipmentStorage.CurrentTroopEquipmentTiers[1]
    ShowTier2 = EquipmentStorage.CurrentTroopEquipmentTiers[2]
    ShowTier3 = EquipmentStorage.CurrentTroopEquipmentTiers[3]
    ShowTier4 = EquipmentStorage.CurrentTroopEquipmentTiers[4]
    ShowTier5 = EquipmentStorage.CurrentTroopEquipmentTiers[5]
    ShowTier6 = EquipmentStorage.CurrentTroopEquipmentTiers[6]
    ShowTier7 = EquipmentStorage.CurrentTroopEquipmentTiers[7]
    ShowTier8 = EquipmentStorage.CurrentTroopEquipmentTiers[8]
EndFunction

Function GetUnitEquipment()
    
    Actor EquipmentActor = FactionOwner.PlaceAtMe(CS_CustomEquipmentTroopActor) as Actor
    Armor[] TroopArmor = UnitScript.CustomEquipment
    Form[] TroopItems = UnitScript.CustomItems
    int[] TroopItemsAmount = UnitScript.CustomItemsAmount
    
    int i = 0
    while i < TroopArmor.Length
        EquipmentActor.AddItem(TroopArmor[i], 1)
        i += 1
    endwhile
    
    i = 0
    while i < TroopItems.Length
        EquipmentActor.AddItem(TroopItems[i], TroopItemsAmount[i])
        i += 1
    endwhile
    
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).MilitaryScript = Military
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).UnitScript = UnitScript
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).GoToState("UnitReady")
    
    EquipmentActor.OpenInventory(true)
    while utility.IsInMenuMode()
        utility.wait(0.1)
    endwhile
    
    EquipmentActor.delete()
    
    if ModifiedUnit
        ModifiedUnit = false
        UnitScript.UpdateTroops()
    endif
    
EndFunction

Function GetTroopEquipment(int trooptype, int gender=-1)
    
    Actor EquipmentActor = FactionOwner.PlaceAtMe(CS_CustomEquipmentTroopActor) as Actor
    Armor[] TroopArmor
    Form[] TroopItems
    
    if trooptype == 0
        if gender == 0
            TroopArmor = Military.CustomOutfitSoldierMale
            TroopItems = Military.CustomItemsSoldierMale
        elseif gender == 1
            TroopArmor = Military.CustomOutfitSoldierFemale
            TroopItems = Military.CustomItemsSoldierFemale
        else
            TroopArmor = Military.CustomOutfitSoldier
            TroopItems = Military.CustomItemsSoldier
        endif
    elseif trooptype == 1
        if gender == 0
            TroopArmor = Military.CustomOutfitWarriorMale
            TroopItems = Military.CustomItemsWarriorMale
        elseif gender == 1
            TroopArmor = Military.CustomOutfitWarriorFemale
            TroopItems = Military.CustomItemsWarriorFemale
        else
            TroopArmor = Military.CustomOutfitWarrior
            TroopItems = Military.CustomItemsWarrior
        endif
    elseif trooptype == 2
        if gender == 0
            TroopArmor = Military.CustomOutfitArcherMale
            TroopItems = Military.CustomItemsArcherMale
        elseif gender == 1
            TroopArmor = Military.CustomOutfitArcherFemale
            TroopItems = Military.CustomItemsArcherFemale
        else
            TroopArmor = Military.CustomOutfitArcher
            TroopItems = Military.CustomItemsArcher
        endif
    elseif trooptype == 3
        if gender == 0
            TroopArmor = Military.CustomOutfitCrossbowMale
            TroopItems = Military.CustomItemsCrossbowMale
        elseif gender == 1
            TroopArmor = Military.CustomOutfitCrossbowFemale
            TroopItems = Military.CustomItemsCrossbowFemale
        else
            TroopArmor = Military.CustomOutfitCrossbow
            TroopItems = Military.CustomItemsCrossbow
        endif
    elseif trooptype == 4
        if gender == 0
            TroopArmor = Military.CustomOutfitMageDestructionFireMale
            TroopItems = Military.CustomItemsMageDestructionFireMale
        elseif gender == 1
            TroopArmor = Military.CustomOutfitMageDestructionFireFemale
            TroopItems = Military.CustomItemsMageDestructionFireFemale
        else
            TroopArmor = Military.CustomOutfitMageDestructionFire
            TroopItems = Military.CustomItemsMageDestructionFire
        endif
    elseif trooptype == 5
        if gender == 0
            TroopArmor = Military.CustomOutfitMageDestructionFrostMale
            TroopItems = Military.CustomItemsMageDestructionFrostMale
        elseif gender == 1
            TroopArmor = Military.CustomOutfitMageDestructionFrostFemale
            TroopItems = Military.CustomItemsMageDestructionFrostFemale
        else
            TroopArmor = Military.CustomOutfitMageDestructionFrost
            TroopItems = Military.CustomItemsMageDestructionFrost
        endif
    elseif trooptype == 6
        if gender == 0
            TroopArmor = Military.CustomOutfitMageDestructionShockMale
            TroopItems = Military.CustomItemsMageDestructionShockMale
        elseif gender == 1
            TroopArmor = Military.CustomOutfitMageDestructionShockFemale
            TroopItems = Military.CustomItemsMageDestructionShockFemale
        else
            TroopArmor = Military.CustomOutfitMageDestructionShock
            TroopItems = Military.CustomItemsMageDestructionShock
        endif
    elseif trooptype == 7
        if gender == 0
            TroopArmor = Military.CustomOutfitMageRestorationMale
            TroopItems = Military.CustomItemsMageRestorationMale
        elseif gender == 1
            TroopArmor = Military.CustomOutfitMageRestorationFemale
            TroopItems = Military.CustomItemsMageRestorationFemale
        else
            TroopArmor = Military.CustomOutfitMageRestoration
            TroopItems = Military.CustomItemsMageRestoration
        endif
    elseif trooptype == 8
        if gender == 0
            TroopArmor = Military.CustomOutfitMageConjurationMale
            TroopItems = Military.CustomItemsMageConjurationMale
        elseif gender == 1
            TroopArmor = Military.CustomOutfitMageConjurationFemale
            TroopItems = Military.CustomItemsMageConjurationFemale
        else
            TroopArmor = Military.CustomOutfitMageConjuration
            TroopItems = Military.CustomItemsMageConjuration
        endif
    elseif trooptype == 9
        if gender == 0
            TroopArmor = Military.CustomOutfitMageAlterationMale
            TroopItems = Military.CustomItemsMageAlterationMale
        elseif gender == 1
            TroopArmor = Military.CustomOutfitMageAlterationFemale
            TroopItems = Military.CustomItemsMageAlterationFemale
        else
            TroopArmor = Military.CustomOutfitMageAlteration
            TroopItems = Military.CustomItemsMageAlteration
        endif
    endif
    
    int i = 0
    while i < TroopArmor.Length
        EquipmentActor.AddItem(TroopArmor[i], 1)
        i += 1
    endwhile
    
    i = 0
    while i < TroopItems.Length
        EquipmentActor.AddItem(TroopItems[i], 1)
        i += 1
    endwhile
    
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).MilitaryScript = Military
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).TroopType = TroopType
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).gender = gender
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).GoToState("TroopReady")
    
    EquipmentActor.OpenInventory(true)
    while utility.IsInMenuMode()
        utility.wait(0.1)
    endwhile
    
    EquipmentActor.delete()
    
    if ModifiedTroop
        ModifiedTroop = false
        Military.UpdateEquipment(trooptype, gender)
    endif
    
EndFunction

Function GetGuardEquipment(int gender=-1)
    
    Actor EquipmentActor = FactionOwner.PlaceAtMe(CS_CustomEquipmentTroopActor) as Actor
    Armor[] TroopArmor
    Form[] TroopItems
    
    if gender == 0
        TroopArmor = Military.CustomOutfitGuardMale
        TroopItems = Military.CustomItemsGuardMale
    elseif gender == 1
        TroopArmor = Military.CustomOutfitGuardFemale
        TroopItems = Military.CustomItemsGuardFemale
    else
        TroopArmor = Military.CustomOutfitGuard
        TroopItems = Military.CustomItemsGuard
    endif
    
    int i = 0
    while i < TroopArmor.Length
        EquipmentActor.AddItem(TroopArmor[i], 1)
        i += 1
    endwhile
    
    i = 0
    while i < TroopItems.Length
        EquipmentActor.AddItem(TroopItems[i], 1)
        i += 1
    endwhile
    
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).MilitaryScript = Military
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).gender = gender
    (EquipmentActor as CS_CustomEquipmentTroopActorScript).GoToState("GuardReady")
    
    EquipmentActor.OpenInventory(true)
    while utility.IsInMenuMode()
        utility.wait(0.1)
    endwhile
    
    EquipmentActor.delete()
    
    if ModifiedTroop
        ModifiedTroop = false
        Military.UpdateGuardEquipment(gender)
    endif
    
EndFunction