Scriptname CS_SettlementGetClosestTreeScript extends ReferenceAlias

Static Property CS_TreeMarker Auto

Event OnInIt()
    if GetRef()
        debug.trace("Placing tree marker")
        GetRef().PlaceAtMe(CS_TreeMarker)
    endif
    utility.wait(1)
    GetOwningQuest().Stop()
EndEvent