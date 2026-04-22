Scriptname CS_AttackCityEnterCityScript extends ObjectReference  

Quest Property AttackCityQuest Auto
Quest Property AttackCityQuestNew Auto

Event OnCellAttach()
	if AttackCityQuestNew.GetStage() < 16
		self.disable()
		AttackCityQuestNew.SetStage(16)
	endif
EndEvent