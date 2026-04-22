;/ Decompiled by Champollion V1.0.1
Source   : CS_NegotiationTableDisableScript.psc
Modified : 2022-04-19 06:41:19
Compiled : 2022-04-19 06:41:20
User     : Emilio
Computer : DESKTOP-EH9BGO7
/;
scriptName CS_NegotiationTableDisableScript extends ReferenceAlias

;-- Properties --------------------------------------
quest property NegotiationQuest auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnCellDetach()

	self.GetReference().disable(false)
	self.GetOwningQuest().stop()
endFunction

; Skipped compiler generated GotoState
