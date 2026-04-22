Scriptname CS_AttackCityReinforcementsA extends Quest  

CS_AttackCityAttackerScript[] Property Troops Auto
CS_ArmyUnitAliasScript[] Property Units Auto hidden

FormList Property CS_AttackCityAttackerSpawns2 Auto
FormList Property CS_AttackCityAttackerSpawns3 Auto
FormList Property CS_AttackCityAttackerSpawns4 Auto

FormList Property SpawnPoints2 Auto hidden
FormList Property SpawnPoints3 Auto hidden

CS_TacticalPlan Property TacticalAttackPlan Auto Hidden
CS_AttackCityFinalScript Property AttackCityScript Auto

int unitnum
int troopnum

Function Initialize()
    TacticalAttackPlan = AttackCityScript.TacticalAttackPlan
    Units = TacticalAttackPlan.Units
    SpawnPoints2 = CS_AttackCityAttackerSpawns2.GetAt(AttackCityScript.citynum) as FormList
    SpawnPoints3 = CS_AttackCityAttackerSpawns3.GetAt(AttackCityScript.citynum) as FormList
    SetUpTroops()
EndFunction

Function SetUpTroops()
    int i = 0
    while i < 20
        Troops[i].RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
EndFunction