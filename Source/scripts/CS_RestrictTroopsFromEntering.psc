Scriptname CS_RestrictTroopsFromEntering extends ReferenceAlias

Faction Property PlayerArmyFaction Auto

Event OnActivate(ObjectReference akActionRef)
	If (akActionRef as Actor).IsInFaction(PlayerArmyFaction) == 1
		(self.GetReference()).BlockActivation()
	Else
		(self.GetReference()).Activate(akActionRef)
	EndIf
EndEvent

FormList Property FollowCommander  Auto  
