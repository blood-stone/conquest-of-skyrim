Scriptname CS_CaravanQuestComplete extends ObjectReference  

Quest Property CaravanQuest Auto

Event OnOpen(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		CaravanQuest.SetStage(100)
	endif
EndEvent