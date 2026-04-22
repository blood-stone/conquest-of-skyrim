Scriptname CS_HireGuardsMisc extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
	Menu()
EndEvent

Function Menu(int Response = 0)
	Response = RecruitGuardsMessage.show()
	If Response == 0
		Game.GetPlayer().RemoveItem(Gold001, 400)
		GuardMarker.enable()
		GuardMarker.PlaceActorAtMe(Guard)
		GuardMarker.PlaceActorAtMe(Guard)
	EndIf
EndFunction

ActorBase Property Guard  Auto  

ObjectReference Property GuardMarker  Auto

Message Property RecruitGuardsMessage  Auto  

MiscObject Property Gold001  Auto  
