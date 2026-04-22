Scriptname CS_ArmyRegimentCommandScript extends Quest conditional

FormList Property CS_ArmyAllRegimentFactions Auto
FormList Property CS_ArmyAllRegiments Auto

int Property RegimentOrders Auto conditional

Keyword Property CS_StoryArmyFormUp Auto
CS_TroopFormUpScript Property CS_TroopFormUp Auto

CS_RegimentScript Property RegimentScript Auto

Function SetRegiment(Actor Commander)
    int i = 0
    while i < CS_ArmyAllRegiments.GetSize()
        if (CS_ArmyAllRegiments.GetAt(i) as CS_RegimentScript).Commander.GetActorRef() == Commander
            RegimentScript = (CS_ArmyAllRegiments.GetAt(i) as CS_RegimentScript)
            RegimentOrders = RegimentScript.OrdersNum
            return
        endif
        i += 1
    endwhile
EndFunction

Function FollowPlayer()
    RegimentOrders = -1
    RegimentScript.RegisterForFollowPlayer()
EndFunction

Function StopFollowPlayer()
    RegimentOrders = -1
    RegimentScript.CancelOrders()
EndFunction