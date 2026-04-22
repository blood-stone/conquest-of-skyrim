Scriptname CS_Faction extends Quest

import CS_FactionFunctions ;contains back-end functions

; Government ------------------------------------------------------------------------------------------------------------------------------

int Property FactionNum Auto

CS_Name Property Name Auto

CS_Holding Property HQ Auto

CS_Leader Property Leader Auto
CS_Steward Property Steward Auto
CS_ASIC Property ASIC Auto
CS_CourtMage Property Mage Auto

CS_Banner Property Banner Auto

Function RecruitGovPosition(string Position, Actor Official)
    if Position == "Leader"
        Leader.Recruit(Official)
    elseif Position == "Steward"
        Steward.Recruit(Official)
    elseif Position == "ASIC"
        ASIC.Recruit(Official)
    elseif Position == "Mage"
        Mage.Recruit(Official)
    endif
EndFunction

Function FireGovPosition(string Position)
    if Position == "Leader"
        Leader.Fire()
    elseif Position == "Steward"
        Steward.Fire()
    elseif Position == "ASIC"
        ASIC.Fire()
    elseif Position == "Mage"
        Mage.Fire()
    endif
EndFunction

Function FireGovOfficial(Actor Official)
    if Leader.GetActorRef() == Official
        Leader.Fire()
    elseif Steward.GetActorRef() == Official
        Steward.Fire()
    elseif ASIC.GetActorRef() == Official
        ASIC.Fire()
    elseif Mage.GetActorRef() == Official
        Mage.Fire()
    endif
EndFunction

Function SetNewOverlordGovernment(CS_FactionMajor NewOverlord)
    Leader.Fire()
    Steward.Fire()
    ASIC.Fire()
    Mage.Fire()
    
    Leader.Recruit(NewOverlord.HoldLeaders[FactionNum])
    Steward.Recruit(NewOverlord.HoldStewards[FactionNum])
    ASIC.Recruit(NewOverlord.HoldHousecarls[FactionNum])
    Mage.Recruit(NewOverlord.HoldMages[FactionNum])
EndFunction

Function SetHQ(CS_Holding NewHQ)
    HQ = NewHQ
EndFunction

string Function GetName()
    return Name.NameString
EndFunction

; Holdings -----------------------------------------------------------------------------------------------------------------------------------------

CS_City[] Property Cities Auto hidden
CS_Village[] Property Villages Auto hidden
CS_Settlement[] Property Settlements Auto hidden

Function AddHolding(CS_Holding Holding)
    ObjectReference HoldingRef = Holding as ObjectReference
    
    if HoldingRef as CS_City
        if Cities.Find(HoldingRef as CS_City) < 0
            Cities = AddToCityArray(HoldingRef as CS_City, Cities)
        endif
    elseif HoldingRef as CS_Village
        if Villages.Find(HoldingRef as CS_Village) < 0
            Villages = AddToVillageArray(HoldingRef as CS_Village, Villages)
        endif
    elseif HoldingRef as CS_Settlement
        if Settlements.Find(HoldingRef as CS_Settlement) < 0
            Settlements = AddToSettlementArray(HoldingRef as CS_Settlement, Settlements)
        endif
    endif
EndFunction

Function RemoveHolding(CS_Holding Holding)
    ObjectReference HoldingRef = Holding as ObjectReference
    
    if HoldingRef as CS_City
        if Cities.Find(HoldingRef as CS_City) >= 0
            Cities = RemoveFromCityArray(HoldingRef as CS_City, Cities)
        endif
    elseif HoldingRef as CS_Village
        if Villages.Find(HoldingRef as CS_Village) >= 0
            Villages = RemoveFromVillageArray(HoldingRef as CS_Village, Villages)
        endif
    elseif HoldingRef as CS_Settlement
        if Settlements.Find(HoldingRef as CS_Settlement) >= 0
            Settlements = RemoveFromSettlementArray(HoldingRef as CS_Settlement, Settlements)
        endif
    endif
EndFunction

Function SetUpInitialHoldings()
    int i = 0
    while i < Cities.Length
        Cities[i].SetGovernment(self)
        i += 1
    endwhile
    
    i = 0
    while i < Villages.Length
        Villages[i].SetGovernment(self)
        i += 1
    endwhile
    
    i = 0
    while i < Settlements.Length
        Settlements[i].SetGovernment(self)
        i += 1
    endwhile
EndFunction

;Diplomacy -------------------------------------------------------------------------------------------------------------------------------------------

CS_Faction Property Overlord Auto hidden
CS_Faction[] Property Vassals Auto hidden
CS_Faction[] Property Allies Auto hidden
CS_Faction[] Property Enemies Auto hidden

Faction Property AIFaction Auto
Faction Property AINPCFaction Auto

Function SetOverlord(CS_Faction NewOverlord)
    Overlord = NewOverlord
    debug.trace(GetName() + " set " + NewOverlord.GetName() + " as Overlord!")
EndFunction

Function AddVassal(CS_Faction Vassal)
    debug.trace(GetName() + " adding " + Vassal.GetName() + " as a Vassal...")
    if Vassals.Find(Vassal) < 0
        Vassals = AddToFactionArray(Vassal, Vassals)
    endif
    Vassal.SetOverlord(self)
    
    AIFaction.SetAlly(Vassal.AIFaction)
    AINPCFaction.SetAlly(Vassal.AINPCFaction)
    debug.trace(GetName() + " added " + Vassal.GetName() + " as a Vassal!")
EndFunction

Function RemoveVassal(CS_Faction Vassal)
    if Vassals.Find(Vassal) >= 0
        Vassals = RemoveFromFactionArray(Vassal, Vassals)
    endif
    Vassal.SetOverlord(None)
    
    AIFaction.SetEnemy(Vassal.AIFaction, true, true)
    AINPCFaction.SetEnemy(Vassal.AINPCFaction, true, true)
EndFunction

Function AddAlly(CS_Faction Ally)
    if Allies.Find(Ally) < 0
        Allies = AddToFactionArray(Ally, Allies)
    
        AIFaction.SetAlly(Ally.AIFaction)
        AINPCFaction.SetAlly(Ally.AINPCFaction)
        
        Ally.AddAlly(self)
    endif
EndFunction

Function RemoveAlly(CS_Faction Ally)
    if Allies.Find(Ally) >= 0
        Allies = RemoveFromFactionArray(Ally, Allies)
    
        AIFaction.SetEnemy(Ally.AIFaction, true, true)
        AINPCFaction.SetEnemy(Ally.AINPCFaction, true, true)
        
        Ally.RemoveAlly(self)
    endif
EndFunction

Function AddEnemy(CS_Faction Enemy)
    if Enemies.Find(Enemy) < 0
        Enemies = AddToFactionArray(Enemy, Enemies)
    
        AIFaction.SetEnemy(Enemy.AIFaction)
        AINPCFaction.SetEnemy(Enemy.AINPCFaction)
        
        int i = 0
        while i < Enemy.Vassals.Length
            AddEnemy(Enemy.Vassals[i])
            i += 1
        endwhile
        
        Enemy.AddEnemy(self)
    endif
EndFunction

Function RemoveEnemy(CS_Faction Enemy)
    if Enemies.Find(Enemy) >= 0
        Enemies = RemoveFromFactionArray(Enemy, Enemies)
    
        AIFaction.SetEnemy(Enemy.AIFaction, true, true)
        AINPCFaction.SetEnemy(Enemy.AINPCFaction, true, true)
        
        int i = 0
        while i < Enemy.Vassals.Length
            RemoveEnemy(Enemy.Vassals[i])
            i += 1
        endwhile
        
        Enemy.RemoveEnemy(self)
    endif
EndFunction

Function StartWar(CS_Faction EnemyFaction);/
    if TradeAgreements.Find(EnemyFaction) >= 0
        RemoveTradeAgreement(EnemyFaction)
    endif/;
    
    if Allies.Find(EnemyFaction) >= 0
        RemoveAlly(EnemyFaction)
    endif
    
    if Vassals.Find(EnemyFaction) >= 0
        RemoveVassal(EnemyFaction)
    endif
    ;/
    ObjectReference WarActivator = PlaceAtMe(CS_FactionWarActivator)
    Wars = AddToArray(WarActivator, Wars)
    (EnemyFaction as CS_FactionManagementDiplomacy).Wars = AddToArray(WarActivator, (EnemyFaction as CS_FactionManagementDiplomacy).Wars)
    (WarActivator as CS_FactionWarMasterScript).SetUp(self as ObjectReference, EnemyFaction)
    if PlayerFaction == 1
        CS_StoryWarObjectives.SendStoryEvent((EnemyFaction as CS_FactionManagementDiplomacy).FactionName, WarActivator, EnemyFaction)
        (EnemyFaction as CS_FactionManagementDiplomacy).AtWarPlayer = 1
    endif/;
    AddEnemy(EnemyFaction)
    debug.notification("A war between " + GetName() + " and " + EnemyFaction.GetName() + " has broken out!")
    debug.trace("A war between " + GetName() + " and " + EnemyFaction.GetName() + " has broken out!")
EndFunction

; Events --------------------------------------------------------------------------------------------------------------------------------------

Event OnInIt()
    SetUpInitialHoldings()
EndEvent

Event OnUpdateGameTime()
    debug.notification(GetName() + " updated")
EndEvent