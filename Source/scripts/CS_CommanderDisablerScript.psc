Scriptname CS_CommanderDisablerScript extends ReferenceAlias

Event OnCellDetach()
	;(GetOwningQuest() as CS_PatrolHoldScript).DisableAllTroops(self.GetActorRef())
	;self.Clear()
EndEvent