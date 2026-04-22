Scriptname CS_AttackCityGateScript extends ReferenceAlias  

Int Property OldStage = 3 Auto
{The destruction stage that is before the stage you want to trigger at
- Default = 3}

Int Property NewStage = 4 Auto
{The destruction stage that you want the trigger to happen at
- Default = 4}

GlobalVariable Property CS_AttackCityDoorHealth Auto

ReferenceAlias Property GateCollision Auto

;Function DamageCityDoor(int newstate) -- Updates the Gate's Health value for the objective. 
;When the health reaches 0 advances to next stage

Function DamageCityDoor(int newstate)
    CS_AttackCityDoorHealth.SetValue(100 - newstate*25)
    GetOwningQuest().UpdateCurrentInstanceGlobal(CS_AttackCityDoorHealth)
    if CS_AttackCityDoorHealth.GetValue() == 0
        TryToDisable()
        GetOwningQuest().SetObjectiveCompleted(10)
        GetOwningQuest().SetStage(11)
    else
        GetOwningQuest().SetObjectiveDisplayed(10, true, true)
    endif
EndFunction

Event OnInIt()
    TryToEnable()
    TryToReset()
    GetRef().ClearDestruction()
    CS_AttackCityDoorHealth.SetValue(100)
    GetOwningQuest().UpdateCurrentInstanceGlobal(CS_AttackCityDoorHealth)
    ;GetOwningQuest().SetObjectiveDisplayed(0, true, true)
EndEvent

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)

    DamageCityDoor(aiCurrentStage)

EndEvent