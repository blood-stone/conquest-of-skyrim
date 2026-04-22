Scriptname CS_CitizenAssaultStopScript extends ReferenceAlias  

Event OnInit()
    GetActorRef().StopCombat()
    GetActorRef().StopCombatAlarm()
    Utility.Wait(1)
    GetActorRef().StopCombat()
    GetActorRef().StopCombatAlarm()
    GetOwningQuest().Stop()
EndEvent