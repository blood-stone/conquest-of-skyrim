Scriptname CS_CityManagementMilitary extends ObjectReference  

import CS_CommonFunctions

int Property MilitaryPersonnel Auto
int Property Guards Auto
int Property BarracksLevel Auto

Container Property CS_FactionWarAIRegiment Auto

ObjectReference Property CommandDesk Auto

ObjectReference Property BattleSpace Auto

ObjectReference[] Property HomeRegiments Auto

ObjectReference[] Property DeployableRegiments Auto
ObjectReference[] Property DeployedRegiments Auto
ObjectReference[] Property HoldPatrolLocations Auto

int Property AIRegimentsInitial Auto

CS_ArmyUnitAliasScript Property Unit Auto

Function SetUnit(CS_ArmyUnitAliasScript NewUnit)
    Unit = NewUnit
EndFunction

Function RecruitTroop(int troopnum, int initialequipmenttier=-1)
    
    CS_CityManagementPopulation PopulationScript = ((self as ObjectReference) as CS_CityManagementPopulation)
    
    if PopulationScript.Unassigned > 0
        bool filled
        PopulationScript.Unassigned = PopulationScript.Unassigned - 1
        if PopulationScript.Unemployed > 0
            PopulationScript.Unemployed = PopulationScript.Unemployed - 1
            filled = true
        endif
    endif
EndFunction

Function SetUpAIRegiments(ObjectReference FactionOwner)
    int i = 0
    while i < AIRegimentsInitial
        ObjectReference NewRegiment = PlaceAtMe(CS_FactionWarAIRegiment)
        (NewRegiment as CS_FactionWarAIRegimentScript).FactionOwnerActivator = FactionOwner
        (NewRegiment as CS_FactionWarAIRegimentScript).HomeLocation = self as ObjectReference
        (NewRegiment as CS_FactionWarAIRegimentScript).TroopCount = 20
        HomeRegiments = AddToArray(NewRegiment, HomeRegiments)
        if i < BarracksLevel
            ((self as ObjectReference) as CS_FactionWarLocationScript).AttachDefendingRegimentToLocation(NewRegiment)
        endif
        i += 1
    endwhile
EndFunction

Function DeleteAllAIRegiments()
    int i = HomeRegiments.Length
    while i >= 0
        (HomeRegiments[i] as CS_FactionWarAIRegimentScript).ClearRegiment()
        i -= 1
    EndWhile
EndFunction

ObjectReference Function AssignAIRegimentToWar(ObjectReference Regiment)
    DeployableRegiments = RemoveFromArray(Regiment, DeployableRegiments)
    DeployedRegiments = AddToArray(Regiment, DeployedRegiments)
    
    return Regiment
EndFunction
    
        