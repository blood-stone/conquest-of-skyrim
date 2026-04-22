Scriptname CS_MapStartManage extends ObjectReference  

CS_MapManageMenuScript Property MapManage Auto

String Property MenuType Auto
int Property holdnum Auto

Function StartMenu()
	MapManage.MenuStart(holdnum, MenuType)
EndFunction

Event OnActivate(ObjectReference akActionRef)
	StartMenu()
EndEvent