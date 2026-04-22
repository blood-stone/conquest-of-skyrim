Scriptname CS_TradeDialogueScript extends Quest conditional

int Property holdnum Auto

int Property FoodDeficit Auto conditional
int Property PlayerInfluence Auto conditional
int Property InitialOpinion Auto conditional
int Property TradingWithNum Auto conditional
int Property CancelTradeHold Auto

float Property ResourceImport Auto conditional
float Property ResourceExport Auto conditional
float Property ResourceImportCounter Auto
float Property ResourceExportCounter Auto

int Property TermType Auto conditional; 1 = How much Jarl pays, 2 = How much player pays, 3 = Cancel Trade with Other

bool Property TradeWithPlayer Auto conditional

ReferenceAlias Property TradeJarl Auto
ReferenceAlias Property TradeFaction Auto
LocationAlias Property TradeFactionLoc Auto
ReferenceAlias Property PlayerFactionManagement Auto
ReferenceAlias Property FactionManagement Auto

ReferenceAlias[] Property TradingWith Auto
LocationAlias[] Property TradingWithLoc Auto

FormList Property CS_AllUpgradeLocations Auto
FormList Property CS_FactionNames Auto

FormList Property CS_FactionActivatorsHolds Auto
FormList Property CS_FactionActivatorsMajor Auto

Quest Property CS_TutorialQuests01Diplomacy Auto
ReferenceAlias Property TutorialTradeJarl Auto

ObjectReference Property CancelTradeFaction Auto

CS_FactionManagementEconomy EconomyScript
CS_FactionManagementDiplomacy DiplomacyScript

CS_FactionManagementEconomy PlayerEconomyScript
CS_FactionManagementDiplomacy PlayerDiplomacyScript

CS_EconomyUpdaterNewScript Property EconomyUpdater Auto
;CS_RecruitJarl Property JarlScript Auto
CS_PublicOpinionScript Property CS_PublicOpinion Auto
FavorDialogueScript Property DialogueFavorGeneric Auto
CS_FactionManagementReport Property FactionManagementReport Auto

Function SetUp(Actor Jarl)
    
    PlayerEconomyScript = PlayerFactionManagement.GetRef() as CS_FactionManagementEconomy
    PlayerDiplomacyScript = PlayerFactionManagement.GetRef() as CS_FactionManagementDiplomacy
    
    TradeJarl.ForceRefTo(Jarl)
    holdnum = -1
    
    int i = 0
    while i < CS_FactionActivatorsHolds.GetSize() && holdnum == -1
        ObjectReference FactionActivator = (CS_FactionActivatorsHolds.GetAt(i) as ObjectReference)
        if (FactionActivator as CS_FactionManagementOwnership).Leader == Jarl
            holdnum = i
            FactionManagement.ForceRefTo(FactionActivator)
    
            if PlayerDiplomacyScript.TradeAgreements.Find(FactionActivator) >= 0
                TradeWithPlayer = true
            else
                TradeWithPlayer = false
                ResourceImport = 1
                ResourceExport = 1
            endif
            
            EconomyScript = FactionActivator as CS_FactionManagementEconomy
            DiplomacyScript = FactionActivator as CS_FactionManagementDiplomacy
            
            TradeFactionLoc.ForceLocationTo(DiplomacyScript.FactionName)
            
        endif
        i += 1
    endwhile
EndFunction

Function GetTradingWithNum()
    TradingWithNum = 0
    ObjectReference[] TradeAgreements = DiplomacyScript.TradeAgreements

    int i = 0
    while i < TradeAgreements.Length
        Location TradeLocation = (TradeAgreements[i] as CS_FactionManagementDiplomacy).FactionName
        TradingWithLoc[TradingWithNum].ForceLocationTo(TradeLocation)
        i += 1
    endwhile
    
EndFunction

Function SetHoldToCancel(int TradeWithNumber)
    TermType = 3
    CancelTradeFaction = TradingWith[TradeWithNumber].GetRef()
    CalculateTerms()
EndFunction

Function CalculateTerms()
    int TermDifficulty = 50
        
    if TermType == 1 || TermType == -1
    
        if FoodDeficit > 0
            TermDifficulty -= 10
        else
            TermDifficulty += 10
        endif
        
        if ResourceImportCounter < ResourceImport
            TermDifficulty = 0
        else
            TermDifficulty += 20*(ResourceImportCounter - ResourceImport) as int
        endif
    elseif TermType == 2 || TermType == -2
        
        if FoodDeficit > 0
            TermDifficulty -= 10
        else
            TermDifficulty += 10
        endif
        
        if ResourceExportCounter > ResourceExport
            TermDifficulty = 0
        else
            TermDifficulty += 20*(ResourceExport - ResourceExportCounter) as int
        endif
    elseif TermType == 3
        ;TermDifficulty += EconomyUpdater.EconomyHoldUpdaters[holdnum].CalculateCityInfluence(CancelTradeHold)
    endif
    
    ((self as Quest) as CS_ConvinceScript).SetConvinceDifficulty(TradeJarl.GetActorRef(), TermDifficulty, FactionManagement.GetRef())
EndFunction

Function ConvinceJarl(bool Success)
    if Success == true
        if TermType == 1 || TermType == -1
            ResourceImport = ResourceImportCounter
            if TermType == 1
                TermType = 2
            endif
        elseif TermType == 2 || TermType == -2
            ResourceExport = ResourceExportCounter
            TermType = 0
        elseif TermType == 3
            DiplomacyScript.RemoveTradeAgreement(CancelTradeFaction)
            TermType = 0
        endif
    endif
EndFunction

Function BeginTradeAgreement()
    if ResourceImport == 0
        ResourceImport = 1
    elseif ResourceExport == 0
        ResourceExport = 1
    endif
    PlayerDiplomacyScript.AddTradeAgreement(FactionManagement.GetRef(), ResourceImport, ResourceExport)
    TradeWithPlayer = true
    if CS_TutorialQuests01Diplomacy.GetStage() == 1
        TutorialTradeJarl.ForceRefTo(TradeJarl.GetActorRef())
        CS_TutorialQuests01Diplomacy.SetStage(2)
        utility.wait(0.5)
    endif
    AdjustImportsExports()
EndFunction

Function AdjustImportsExports()
    int TradeAgreementNum = PlayerDiplomacyScript.TradeAgreements.Find(FactionManagement.GetRef())
    FactionManagementReport.Stop()
    FactionManagementReport.Start()
    FactionManagementReport.SetFaction(PlayerFactionManagement.GetRef())
    FactionManagementReport.TradeAgreementNum = TradeAgreementNum
    FactionManagementReport.MenuTradeAgreement()
    FactionManagementReport.Stop()
EndFunction

Function CancelTradeAgreement()
    PlayerDiplomacyScript.RemoveTradeAgreement(FactionManagement.GetRef())
EndFunction