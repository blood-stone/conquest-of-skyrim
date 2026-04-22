Scriptname CS_NegotiationTableDisableScript extends ReferenceAlias

Event OnCellDetach()
	self.GetReference().disable()
	GetOwningQuest().stop()
EndEvent

Quest Property NegotiationQuest  Auto  
