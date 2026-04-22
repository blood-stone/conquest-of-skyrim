Scriptname CS_SettingsMenuScript extends Quest  

Message Property CS_SettingsMenuStart Auto
Message Property CS_SettingsMenuBattles Auto
Message Property CS_SettingsMenuBattlesSize Auto
Message Property CS_SettingsMenuBattlesSpeed Auto
Message Property CS_SettingsMenuWar Auto
Message Property CS_SettingsMenuWarRecoveryTimes Auto
Message Property CS_SettingsMenuWarRespawnTimes Auto

GlobalVariable Property CS_BattleSize Auto
GlobalVariable Property CS_BattleSpeed Auto
GlobalVariable Property CS_EnemyRecovery Auto
GlobalVariable Property CS_EnemyRespawns Auto
    
Function MenuStart(int Response = 0)
    Response = CS_SettingsMenuStart.show()
    if Response == 0
        MenuBattles()
    elseif Response == 1
        MenuWar()
    endif
    Stop()
EndFunction

; ----------------------------------Battles-------------------------------------
    
Function MenuBattles(int Response = 0)
    Response = CS_SettingsMenuBattles.show()
    if Response == 0
        MenuBattlesSize()
    elseif Response == 1
        MenuBattlesSpeed()
    elseif Response == 2
        MenuStart()
    endif
EndFunction

Function MenuBattlesSize(int Response = 0)
    UpdateCurrentInstanceGlobal(CS_BattleSize)
    Response = CS_SettingsMenuBattlesSize.show()
    if Response == 0
        CS_BattleSize.SetValue(5)
        MenuBattlesSize()
    elseif Response == 1
        CS_BattleSize.SetValue(10)
        MenuBattlesSize()
    elseif Response == 2
        CS_BattleSize.SetValue(15)
        MenuBattlesSize()
    elseif Response == 3
        CS_BattleSize.SetValue(20)
        MenuBattlesSize()
    elseif Response == 4
        MenuBattles()
    endif
EndFunction

Function MenuBattlesSpeed(int Response = 0)
    UpdateCurrentInstanceGlobal(CS_BattleSpeed)
    Response = CS_SettingsMenuBattlesSpeed.show()
    if Response == 0
        CS_BattleSpeed.SetValue(1)
        MenuBattlesSpeed()
    elseif Response == 1
        CS_BattleSpeed.SetValue(2)
        MenuBattlesSpeed()
    elseif Response == 2
        CS_BattleSpeed.SetValue(4)
        MenuBattlesSpeed()
    elseif Response == 3
        MenuBattles()
    endif
EndFunction

; ----------------------------------Warfare-------------------------------------

Function MenuWar(int Response = 0)
    Response = CS_SettingsMenuWar.show()
    if Response == 0
        MenuWarRespawn()
    elseif Response == 1
        MenuWarRecovery()
    elseif Response == 2
        MenuStart()
    endif
EndFunction

Function MenuWarRespawn(int Response = 0)
    UpdateCurrentInstanceGlobal(CS_EnemyRespawns)
    Response = CS_SettingsMenuWarRespawnTimes.show()
    if Response == 0
        CS_EnemyRespawns.SetValue(12)
        MenuWarRespawn()
    elseif Response == 1
        CS_EnemyRespawns.SetValue(24)
        MenuWarRespawn()
    elseif Response == 2
        CS_EnemyRespawns.SetValue(36)
        MenuWarRespawn()
    elseif Response == 3
        CS_EnemyRespawns.SetValue(48)
        MenuWarRespawn()
    elseif Response == 4
        CS_EnemyRespawns.SetValue(60)
        MenuWarRespawn()
    elseif Response == 5
        CS_EnemyRespawns.SetValue(72)
        MenuWarRespawn()
    elseif Response == 6
        MenuWar()
    endif
EndFunction

Function MenuWarRecovery(int Response = 0)
    UpdateCurrentInstanceGlobal(CS_EnemyRecovery)
    Response = CS_SettingsMenuWarRecoveryTimes.show()
    if Response == 0
        CS_EnemyRecovery.SetValue(12)
        MenuWarRecovery()
    elseif Response == 1
        CS_EnemyRecovery.SetValue(24)
        MenuWarRecovery()
    elseif Response == 2
        CS_EnemyRecovery.SetValue(36)
        MenuWarRecovery()
    elseif Response == 3
        CS_EnemyRecovery.SetValue(48)
        MenuWarRecovery()
    elseif Response == 4
        CS_EnemyRecovery.SetValue(60)
        MenuWarRecovery()
    elseif Response == 5
        CS_EnemyRecovery.SetValue(72)
        MenuWarRecovery()
    elseif Response == 6
        MenuWar()
    endif
EndFunction