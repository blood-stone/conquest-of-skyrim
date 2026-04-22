Scriptname CS_CuffScript extends ReferenceAlias  

Event OnUpdate()
	If (Self.GetReference() as Actor).IsEquipped(Cuffs)
		(Self.GetReference() as Actor).PlayIdle(OffsetBoundStandingStart)
	EndIf
EndEvent


Idle Property OffsetBoundStandingStart  Auto  

Armor Property Cuffs  Auto  
