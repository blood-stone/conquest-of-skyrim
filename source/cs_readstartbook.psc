Scriptname CS_ReadStartBook extends ObjectReference  

Event OnRead()
	(GovQuest as CS_StartFactionMenu).MenuStart()
EndEvent

Quest Property GovQuest Auto