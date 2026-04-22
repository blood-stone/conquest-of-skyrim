Scriptname CS_CitizenAssaultStopScript extends ReferenceAlias  

Event OnInit()
    GetActorRef().StopCombat()
    Utility.Wait(1)
    GetActorRef().StopCombat()
    GetOwningQuest().Stop()
EndEvent