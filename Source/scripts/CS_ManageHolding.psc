Scriptname CS_ManageHolding extends ObjectReference  

Keyword Property CS_StoryManageArea Auto
Keyword Property CS_StoryClaimAreaRemoveEnemies Auto
Keyword Property CS_StorySettlementWorkers Auto

Location Property HoldingLoc Auto

ObjectReference Property BannerFlag Auto
ObjectReference Property BuildingChest Auto
ObjectReference Property CityManagementActivator Auto

Quest Property CS_ClaimAreaRemoveEnemies Auto
Quest Property CS_SettlementWorkersQuest Auto

;CS_CityManagementReportScript Property CS_CityManagementReport Auto
CS_SettlementManagementScript Property CS_SettlementManagementReport Auto

bool Property IsActivated Auto

Function RemoveBanner()
    (BannerFlag as CS_FlagChangerMiscScript).RemoveBanner()
    
    disable()
    delete()
EndFunction

Function DisableBanner()
    (BannerFlag as CS_FlagChangerMiscScript).DisableBanner()
    
    disable()
EndFunction

Function EnableBanner()
    BannerFlag.enable()
    (BannerFlag as CS_FlagChangerMiscScript).PlaceBanner()
    
    enable()
EndFunction;/

Auto State CanActivate
    
    Event OnActivate(ObjectReference akActionRef)
        
        GoToState("Activating")
        CS_CityManagementReport.Stop()
        CS_CityManagementReport.Start()
        CS_CityManagementReport.MenuStart(CityManagementActivator)
        GoToState("CanActivate")
        
    EndEvent
    
EndState/;

Event OnCellAttach()
    CS_ClaimAreaRemoveEnemies.Stop()
    CS_StoryClaimAreaRemoveEnemies.SendStoryEvent((CityManagementActivator as CS_CityManagementOwnership).VanillaCity)
    
    CS_ArmyUnitAliasScript Unit = (CityManagementActivator as CS_CityManagementMilitary).Unit
    if Unit.OrdersNum == 0 && Unit.Activated
        Unit.DeactivateUnit()
    endif
EndEvent