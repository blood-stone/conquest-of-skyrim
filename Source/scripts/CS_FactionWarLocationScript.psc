Scriptname CS_FactionWarLocationScript extends ObjectReference  

import CS_CommonFunctions

string Property LocationName Auto

Location Property VanillaLocation Auto

int Property FortificationLevel Auto

ObjectReference Property ControllingFaction Auto

CS_BattleSpaceRegionAll Property BattleSpace Auto

ObjectReference[] Property HomeRegiments Auto
ObjectReference[] Property DefendingRegiments Auto
ObjectReference[] Property AttackingRegiments Auto

Keyword Property BattleQuestKeyword Auto

Function AttachDefendingRegimentToLocation(ObjectReference Regiment)
    if (Regiment as CS_FactionWarAIRegimentScript)
        (Regiment as CS_FactionWarAIRegimentScript).CurrentLocation = self as ObjectReference
    elseif (Regiment as CS_ArmyRegimentOrders)
        (Regiment as CS_ArmyRegimentOrders).CurrentLocation = self as ObjectReference
    endif
    
    DefendingRegiments = AddToArray(Regiment, DefendingRegiments)
EndFunction

Function RemoveDefendingRegimentFromLocation(ObjectReference Regiment)
    if (Regiment as CS_FactionWarAIRegimentScript)
        (Regiment as CS_FactionWarAIRegimentScript).CurrentLocation = None
    elseif (Regiment as CS_ArmyRegimentOrders)
        (Regiment as CS_ArmyRegimentOrders).CurrentLocation = None
    endif
    
    DefendingRegiments = RemoveFromArray(Regiment, DefendingRegiments)
EndFunction

Function AttachAttackingRegimentToLocation(ObjectReference Regiment)
    if (Regiment as CS_FactionWarAIRegimentScript)
        (Regiment as CS_FactionWarAIRegimentScript).CurrentLocation = self as ObjectReference
    elseif (Regiment as CS_ArmyRegimentOrders)
        (Regiment as CS_ArmyRegimentOrders).CurrentLocation = self as ObjectReference
    endif
    
    AttackingRegiments = AddToArray(Regiment, AttackingRegiments)
EndFunction

Function RemoveAttackingRegimentFromLocation(ObjectReference Regiment)
    if (Regiment as CS_FactionWarAIRegimentScript)
        (Regiment as CS_FactionWarAIRegimentScript).CurrentLocation = None
    elseif (Regiment as CS_ArmyRegimentOrders)
        (Regiment as CS_ArmyRegimentOrders).CurrentLocation = None
    endif
    
    AttackingRegiments = RemoveFromArray(Regiment, AttackingRegiments)
EndFunction

Function AddRegimentToHomeRegiments(ObjectReference Regiment)
    HomeRegiments = AddToArray(Regiment, HomeRegiments)
    (Regiment as CS_FactionWarAIRegimentScript).HomeLocation = self as ObjectReference
EndFunction

Function RemoveFactionHomeRegiments()
    int i = HomeRegiments.Length - 1
    while i >= 0
        HomeRegiments = RemoveFromArray(HomeRegiments[i], HomeRegiments)
        i -= 1
    endwhile
EndFunction

Function ReinforceGarrisonRegiments()
    
    ;debug.trace(LocationName + " has " + AttackingRegiments.Length + " Attacking Regiments and " + DefendingRegiments.Length + " Defending Regiments")
    
    if AttackingRegiments
        ObjectReference AttackingFaction = (AttackingRegiments[0] as CS_FactionWarAIRegimentScript).FactionOwnerActivator
        int FactionCommonerIncreaseRate = (AttackingFaction as CS_FactionManagementEconomy).CommonerIncreaseRate
        if AttackingFaction == BattleSpace.BattleSpaceOwner
            ;debug.trace("Reinforcing attack troops at " + LocationName + " with " + FactionCommonerIncreaseRate + " new troops per regiment!")
            int i = 0
            while i < AttackingRegiments.Length
                int TroopsToAdd = FactionCommonerIncreaseRate
                if (TroopsToAdd + (AttackingRegiments[i] as CS_FactionWarAIRegimentScript).TroopCount) > 20
                    TroopsToAdd = 20 - (AttackingRegiments[i] as CS_FactionWarAIRegimentScript).TroopCount
                endif
                (AttackingRegiments[i] as CS_FactionWarAIRegimentScript).TroopCount += TroopsToAdd
                i += 1
            endwhile
        else
            debug.trace(LocationName + " surrounded and attackers can not receive reinforcements!")
        endif
    elseif DefendingRegiments
        if ControllingFaction == BattleSpace.BattleSpaceOwner || ((self as ObjectReference) as CS_CampManagementScript)
            int FactionCommonerIncreaseRate = (ControllingFaction as CS_FactionManagementEconomy).CommonerIncreaseRate
            ;debug.trace("Reinforcing garrison at " + LocationName + " with " + FactionCommonerIncreaseRate + " new troops per regiment!")
            int i = 0
            while i < DefendingRegiments.Length
                int TroopsToAdd = FactionCommonerIncreaseRate
                if (TroopsToAdd + (DefendingRegiments[i] as CS_FactionWarAIRegimentScript).TroopCount) > 20
                    TroopsToAdd = 20 - (DefendingRegiments[i] as CS_FactionWarAIRegimentScript).TroopCount
                endif
                (DefendingRegiments[i] as CS_FactionWarAIRegimentScript).TroopCount += TroopsToAdd
                i += 1
            endwhile
        else
            debug.trace(LocationName + " surrounded and defenders can not receive reinforcements!")
        endif
    endif
EndFunction

State Reinforcements

    Event OnUpdate()
        
        GoToState("Reinforcing")
        ReinforceGarrisonRegiments()
        GoToState("Reinforced")
        
    EndEvent
    
EndState

State InBattle
    
EndState