Scriptname CS_FactionArmyRegimentsScript extends Quest conditional

CS_FactionManagementMilitary Property CS_FactionPlayer Auto

ReferenceAlias[] Property Commanders Auto
Actor[] Property CommanderActors Auto
ReferenceAlias[] Property CommanderTargets Auto
ReferenceAlias[] Property Regiments Auto
LocationAlias[] Property BaseLocations Auto

ReferenceAlias Property ControllingRegiment Auto

int Property RegimentOrders Auto conditional

CS_ArmyRegimentOrders ControllingRegimentOrders
CS_ArmyRegimentTroops ControllingRegimentTroops
CS_ArmyRegimentEquipment ControllingRegimentEquipment

int Function GetNextCommander()
    int i = 0
    while i < Commanders.Length
        if (Commanders[i] as CS_FactionArmyRegimentCommanderScript).GetState() != "Unassigned" && (Commanders[i] as CS_FactionArmyRegimentCommanderScript).GetState() != "Assigned"
            (Commanders[i] as CS_FactionArmyRegimentCommanderScript).GoToState("Unassigned")
            return i
        endif
        i += 1
    endwhile
    
    return -1
EndFunction

Function HireCommander(int unitnum, Actor NewCommander)
    ObjectReference Regiment = CS_FactionPlayer.Regiments[unitnum]
    (Regiment as CS_ArmyRegimentOrders).HireCommander(NewCommander)
EndFunction

Function SetControllingRegiment(Actor CommanderActor)
    int RegimentIndex = CommanderActors.Find(CommanderActor)
    
    if RegimentIndex >= 0
        ObjectReference ControllingRegimentRef = Regiments[RegimentIndex].GetRef()
        ControllingRegiment.ForceRefTo(ControllingRegimentRef)
        ControllingRegimentOrders = ControllingRegimentRef as CS_ArmyRegimentOrders
        ControllingRegimentTroops = ControllingRegimentRef as CS_ArmyRegimentTroops
        ControllingRegimentEquipment = ControllingRegimentRef as CS_ArmyRegimentEquipment
    endif
EndFunction

Function FollowPlayer()
    RegimentOrders = 2
    ControllingRegimentOrders.RegisterForFollowPlayer()
EndFunction

Function StopFollowPlayer()
    RegimentOrders = -1
    ControllingRegimentOrders.CancelOrders()
EndFunction