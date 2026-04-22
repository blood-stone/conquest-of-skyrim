Scriptname CS_NegotiationSitStart extends ReferenceAlias  

;Event OnSit(ObjectReference akFurniture)
	;if self.GetActorRef() == Game.GetPlayer() && GetOwningQuest().GetStage() == 10
	;	if (akFurniture == (GetOwningQuest() as CS_NegotiationScript).HostLeaderSeat.GetReference() && self == (GetOwningQuest() as CS_NegotiationScript).HostLeader) || (akFurniture == (GetOwningQuest() as CS_NegotiationScript).GuestLeaderSeat.GetReference() && self == (GetOwningQuest() as CS_NegotiationScript).GuestLeader)
	;		GetOwningQuest().SetStage(20)
	;	endif
	;elseif self.GetActorRef() == (GetOwningQuest() as CS_NegotiationScript).Tullius || self.GetActorRef() == (GetOwningQuest() as CS_NegotiationScript).Ulfric
	;		(GetOwningQuest() as CS_NegotiationScript).PeaceTalkStart.Start()		
	;else
	;	if (akFurniture == (GetOwningQuest() as CS_NegotiationScript).GuestLeaderSeat.GetReference() && self == (GetOwningQuest() as CS_NegotiationScript).GuestLeader) 
	;		(GetOwningQuest() as CS_NegotiationScript).HostStartScene.Start()
	;	endif
	;endif
;EndEvent

Event OnUnload()
	if self == (GetOwningQuest() as CS_NegotiationScript).GuestLeader
		If GetOwningQuest().GetStage() == 20 || GetOwningQuest().GetStage() == 106
			(GetOwningQuest() as CS_NegotiationScript).UnMakeFriends()
			GetOwningQuest().SetStage(102)
		ElseIf GetOwningQuest().GetStage() == 105
			(GetOwningQuest() as CS_NegotiationScript).ReAddToFactions()
			(GetOwningQuest().Stop())	
		EndIf
	endif
EndEvent
