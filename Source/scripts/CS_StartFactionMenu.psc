Scriptname CS_StartFactionMenu extends ObjectReference  

Message Property CS_StartFaction Auto

Quest Property CS_StartUp Auto

Event OnRead()
    MenuStart()
EndEvent

Function MenuStart(int Response = 0)
    Response = CS_StartFaction.show()
    if Response == 0
        CS_StartUp.Start()
    endif
endFunction
