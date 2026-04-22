Scriptname CS_FactionWarAIArmyScript extends ObjectReference  

import CS_CommonFunctions

string Property ArmyName Auto

ObjectReference[] Property Regiments Auto
ObjectReference[] Property HomeRegiments Auto

ObjectReference Property FactionOwnerActivator Auto
ObjectReference Property HQBattleSpace Auto
ObjectReference Property HQCamp Auto
ObjectReference Property ArmyCommander Auto
ObjectReference Property OpsPlan Auto

int Property Defensive Auto

int Property MinimumRegiments Auto

Function AddRegimentToHomeArmy(ObjectReference Regiment)
    Regiments = AddToArray(Regiment, Regiments)
    HomeRegiments = AddToArray(Regiment, HomeRegiments)
    (Regiment as CS_FactionWarAIRegimentScript).HomeArmy = self as ObjectReference
EndFunction

Function RemoveRegimentFromHomeArmy(ObjectReference Regiment)
    Regiments = RemoveFromArray(Regiment, Regiments)
    HomeRegiments = RemoveFromArray(Regiment, HomeRegiments)
    (Regiment as CS_FactionWarAIRegimentScript).HomeArmy = None
EndFunction

Function AddRegimentToArmy(ObjectReference Regiment)
    Regiments = AddToArray(Regiment, Regiments)
EndFunction

Function RemoveRegimentFromArmy(ObjectReference Regiment)
    Regiments = RemoveFromArray(Regiment, Regiments)
EndFunction

Function TransferRegimentToArmy(ObjectReference Regiment, ObjectReference Army)
    RemoveRegimentFromArmy(Regiment)
    (Army as CS_FactionWarAIArmyScript).AddRegimentToArmy(Regiment)
EndFunction

Function DisbandArmy()
    int i = 0
    while i < Regiments.Length
        (Regiments[i] as CS_FactionWarAIRegimentScript).ReturnToHomeStation()
        i += 1
    endwhile
    
    (FactionOwnerActivator as CS_FactionManagementMilitary).DeleteArmy(self as ObjectReference)
EndFunction

int Function GetNumDeployableRegiments()
    int DeployableRegiments
    
    DeployableRegiments = Regiments.Length - MinimumRegiments
    if DeployableRegiments > 0
        return DeployableRegiments
    else
        return 0
    endif
EndFunction

Function DeployRegimentsIntoArmy(ObjectReference Army, int requestedregiments)
    int DeployableRegiments = GetNumDeployableRegiments()
    int DeployedRegiments
    
    int i = Regiments.Length - 1
    while i >= 0 && DeployedRegiments < requestedregiments && DeployedRegiments < DeployableRegiments
        TransferRegimentToArmy(Regiments[i], Army)
        DeployedRegiments += 1
        i -= 1
    endwhile
    
    debug.trace((HQBattleSpace as CS_BattleSpaceRegionAll).BattleSpaceName + " deployed " + deployedregiments + " regiments into " + (Army as CS_FactionWarAIArmyScript).ArmyName)
EndFunction