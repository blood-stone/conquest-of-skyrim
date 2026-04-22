Scriptname CS_DiplomacyFactionLeaderScript extends Quest conditional

int holdnum

int Property FactionRelations Auto conditional ;1=Trade, 2=Allies, 3=Player is Vassal, 4=Faction is Player's Vassal

LocationAlias Property FactionName Auto

ReferenceAlias Property PlayerFactionActivator Auto

FormList Property CS_FactionActivatorsHolds Auto

ObjectReference FactionActivator

CS_FactionManagementDiplomacy DiplomacyScript
CS_FactionManagementMilitary MilitaryScript
CS_FactionManagementEconomy EconomyScript
CS_FactionManagementOwnership OwnershipScript

Function SetUp(Actor Leader)
    holdnum = -1
    
    int i = 0
    while i < CS_FactionActivatorsHolds.GetSize() && holdnum == -1
        FactionActivator = (CS_FactionActivatorsHolds.GetAt(i) as ObjectReference)
        if (FactionActivator as CS_FactionManagementOwnership).Leader == Leader
            holdnum = i
            
            EconomyScript = FactionActivator as CS_FactionManagementEconomy
            DiplomacyScript = FactionActivator as CS_FactionManagementDiplomacy
            MilitaryScript = FactionActivator as CS_FactionManagementMilitary
            OwnershipScript = FactionActivator as CS_FactionManagementOwnership
            
            FactionName.ForceLocationTo(DiplomacyScript.FactionName)
            
            if DiplomacyScript.Vassals.Find(PlayerFactionActivator.GetRef()) >= 0
                FactionRelations = 3
            endif
            
        endif
        i += 1
    endwhile
EndFunction

Function PlayerBecomeVassal()
    ObjectReference PlayerFactionActivatorRef = PlayerFactionActivator.GetRef()
    
    DiplomacyScript.AddVassal(PlayerFactionActivatorRef, false)
    FactionRelations = 3
EndFunction

Function PlayerBecomeNotVassal()
    ObjectReference PlayerFactionActivatorRef = PlayerFactionActivator.GetRef()
    
    DiplomacyScript.RemoveVassal(PlayerFactionActivatorRef)
    FactionRelations = 0
EndFunction

Function GiveSettlement(int settlementnum)
    ObjectReference PlayerFactionActivatorRef = PlayerFactionActivator.GetRef()
    CS_FactionManagementEconomy PlayerEconomyScript = PlayerFactionActivatorRef as CS_FactionManagementEconomy
    
    ObjectReference Settlement = PlayerEconomyScript.Settlements[settlementnum]
    (Settlement as CS_CityManagementOwnership).ChangeOwnerFaction(FactionActivator)
EndFunction