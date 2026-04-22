Scriptname CS_FactionWarAIRegimentScript extends ObjectReference  

import CS_CommonFunctions

int Property TroopCount Auto
int Property AverageEquipmentLevel Auto
int Property AverageTrainingLevel Auto

ObjectReference Property FactionOwnerActivator Auto
ObjectReference Property HomeArmy Auto
ObjectReference Property HomeLocation Auto
ObjectReference Property CurrentLocation Auto
ObjectReference Property CurrentBattleSpace Auto

Function ReturnToHomeStation()
    if HomeArmy
        (HomeArmy as CS_FactionWarAIArmyScript).AddRegimentToArmy(self as ObjectReference)
    else
        ClearRegiment()
    endif
EndFunction

Function ClearRegiment()
    if (CurrentLocation as CS_FactionWarLocationScript).DefendingRegiments.Find(self as ObjectReference) >= 0
        (CurrentLocation as CS_FactionWarLocationScript).DefendingRegiments = RemoveFromArray(self as ObjectReference, (CurrentLocation as CS_FactionWarLocationScript).DefendingRegiments)
    elseif (CurrentLocation as CS_FactionWarLocationScript).AttackingRegiments.Find(self as ObjectReference) >= 0
        (CurrentLocation as CS_FactionWarLocationScript).AttackingRegiments = RemoveFromArray(self as ObjectReference, (CurrentLocation as CS_FactionWarLocationScript).AttackingRegiments)
    endif
    (HomeLocation as CS_CityManagementMilitary).HomeRegiments = RemoveFromArray(self as ObjectReference, (HomeLocation as CS_CityManagementMilitary).HomeRegiments)
    delete()
EndFunction